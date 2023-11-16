package com.green.greenstock.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.greenstock.dto.BuySellDTO;
import com.green.greenstock.dto.GrowthLogDTO;
import com.green.greenstock.dto.MyPortfolio;
import com.green.greenstock.dto.MyStocks;
import com.green.greenstock.dto.Stock;
import com.green.greenstock.dto.TradeLogDTO;
import com.green.greenstock.repository.interfaces.GrowthLogRepository;
import com.green.greenstock.repository.interfaces.MyStocksRepository;
import com.green.greenstock.repository.interfaces.PortfolioRepository;
import com.green.greenstock.repository.interfaces.StockRepository;
import com.green.greenstock.repository.interfaces.TradeRepository;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.CrawlService;
import com.green.greenstock.service.PortfolioService;

@RestController
@RequestMapping("/portfolio")
public class PortfolioRestController {

	@Autowired
	private DataRestController dataRestController;

	@Autowired
	private PortfolioRepository portfolioRepository;

	@Autowired
	private StockRepository stockRepository;

	@Autowired
	private MyStocksRepository mystocksRepository;

	@Autowired
	private PortfolioService portfolioService;

	@Autowired
	private TradeRepository tradeRepository;

	@Autowired
	GrowthLogRepository growthLogRepository;
	
	@Autowired
	CrawlService crawlService;
	
	@Autowired
	HttpSession session;

	@GetMapping("/getMyPortfolioList/{id}")
	public List<MyPortfolio> test(@PathVariable int id) {
		List<MyPortfolio> list = portfolioRepository.findByuserId(id);
		return list;
	}

	@GetMapping("/getUserid")
	public int getUserId() {
		User user = (User) session.getAttribute("principal");
		if(user != null) {
			return user.getId(); 
		}else {
			return (Integer) null;
		}
	}

	@PostMapping("/addPortfolio")
	public int postExample(@RequestBody MyPortfolio pf) {
		// pf null 처리 해야됨.
		User user = (User) session.getAttribute("principal");
		portfolioRepository.savePortfolio(pf, user.getId());
		return 1;
	}

	@GetMapping("/getMyPortfolioInfo/{id}")
	public MyPortfolio abc(@PathVariable int id) {
		MyPortfolio mp = portfolioRepository.findByPortfolioId(id);
		mp.setStockList(mystocksRepository.findMyStocksByPortfolioId(id));
		if (mp.getStockList() != null) {
			mp.getStockList().forEach(stock -> {
				stock.setNowPrice(
						Integer.parseInt(dataRestController.getStockDetailJson(stock.getCompanyCode()).getStckPrpr()));
				mp.setNowTotalAsset();
			});
		} else {
		}
		return mp;
	}

	@GetMapping("/getStock/{id}")
	public Stock getStock(@PathVariable String id) {
		Stock stock = new Stock();
		stock.setCompanyCode(id);
		stock.setCompanyName("testSTock");
		return stock;
	}

	// companyCode 로 현재가를 구한다.
	@GetMapping("/getNowPrice/{companyCode}")
	public int getNowPrice(@PathVariable String companyCode) {
		return Integer.parseInt(dataRestController.getStockDetailJson(companyCode).getStckPrpr());
	}

	@GetMapping("/getNowPriceWithCompanyCode/{companyCode}")
	public String getNowPriceWithCompanyCode(@PathVariable String companyCode) {
		return companyCode + "/" + dataRestController.getStockDetailJson(companyCode).getStckPrpr();
	}

	// MyStock 정보 세팅용
	@GetMapping("/getAllDataInfo/{id}")
	public MyPortfolio getAllDataInfo(@PathVariable int id) {
		MyPortfolio mp = portfolioService.findAllDatasByPortfolioId(id);

		// 불러올 때 ROR 을 갱신해준다.
		if (mp.getStockList() != null) {
			mp.getStockList().forEach(stock -> {
				stock.setNowPrice(
						Integer.parseInt(dataRestController.getStockDetailJson(stock.getCompanyCode()).getStckPrpr()));
				mp.setNowTotalAsset();
			});
			// ror update.
			portfolioRepository.updateRor(mp);
		}

		mp.setStockList(mystocksRepository.findMyStocksByPortfolioId(mp.getPId()));
		return mp;
	}

	@PostMapping("/buySell/{type}")
	public int buySell(@PathVariable String type, @RequestBody BuySellDTO buySellDto) {
		// 포트폴리오 상태 업데이트
		MyPortfolio mp = portfolioRepository.findByPortfolioId(buySellDto.getPortfolioId());
		// List<MyStocks> 을 set하는 과정이 없다 지금.
		mp.setStockList(mystocksRepository.findMyStocksByPortfolioId(mp.getPId()));

		int price = Integer.parseInt(dataRestController.getStockDetailJson(buySellDto.getStockId()).getStckPrpr());
		MyStocks ms = new MyStocks();
		ms.setAmount(buySellDto.getAmount());
		Stock stock = new Stock();
		stock.setCompanyCode(buySellDto.getStockId());
		stock.setCompanyName(buySellDto.getCompanyName());
		ms.setPrice(price);
		ms.setCompanyCode(stock.getCompanyCode());
		ms.setCompanyName(stock.getCompanyName());
		ms.setPId(buySellDto.getPortfolioId());
		mp.buySell(ms, type);
		portfolioRepository.buySellStock(mp);
		TradeLogDTO td = new TradeLogDTO();
		td.setPId(ms.getPId());
		td.setAmount(ms.getAmount());
		td.setPrice(ms.getPrice());
		td.setQuantity(ms.getAmount() * ms.getPrice());
		td.setStockCode(ms.getCompanyCode());
		td.setStockName(ms.getCompanyName());
		td.setTradeType(type);
		tradeRepository.insertTradeLog(td);

		if (type.equals("buy")) {
			if (mp.isStockExist()) {
				mystocksRepository.updateMyStocks(mp.getMyStocks(ms.getCompanyCode()));
			} else {
				mystocksRepository.insertMyStocks(ms);
			}
		} else {
			if (mp.isStockExist()) {
				mystocksRepository.updateMyStocks(mp.getMyStocks(ms.getCompanyCode()));
			} else {
				mystocksRepository.deleteMyStocks(ms.getCompanyCode());
			}
		}
		return 1;
	}

	@GetMapping("/getdailyGrowthData/{pid}")
	public List<GrowthLogDTO> getMonthlyAsset(@PathVariable int pid) {
		List<GrowthLogDTO> glist = new ArrayList<>();
		glist = growthLogRepository.findGrowthLogByPid(pid);
		glist.forEach(e -> {
			// e.set(e.getLogDate().replace("%",""));
			e.setRor(e.getRor().replace("%", ""));
		});
		return glist;
	}

	// 자동완성 -------------------------------------------------------
	@GetMapping("/getAutoCompleteData")
	public List<String> autocomplete() {
		return stockRepository.getAutoCompleteData();
	}

	@GetMapping("/updateVisible/{pid}")
	public int updateVisible(@PathVariable int pid) {
		MyPortfolio mp = portfolioRepository.findByPortfolioId(pid);
		if (mp.isVisible()) {
			mp.setVisible(false);
		} else {
			System.out.println(mp.isVisible());
			mp.setVisible(true);
		}
		return portfolioRepository.updateVisibility(mp);
	}

	// test용----------------------------------------------------------
	@PostMapping("/testCode123/{type}")
	public String testCode(@PathVariable String type, @RequestBody MyPortfolio mp) {
		if (type.equals("title")) {
			portfolioRepository.updateTitle(mp);
		} else {
			portfolioRepository.updateDiscription(mp);
		}
		return "asdf";
	}

	@GetMapping("/getTradeLog/{pid}")
	public List<TradeLogDTO> getTradeLog(@PathVariable int pid) {
		List<TradeLogDTO> list = tradeRepository.findAllTradeLogByPortfolioId(pid);
		list.forEach(e -> {
			e.setDateTime();
		});
		return list;
	}

	@GetMapping("/getStockByStockName/{stockname}")
	public Stock getStockIdByStockName(@PathVariable String stockname) {
		Stock stock = stockRepository.getStockByStockName(stockname);
		return stock;
	}

	@GetMapping("/deletePortfolio/{pfId}")
	public int deletePortfolio(@PathVariable int pfId) {
		mystocksRepository.deleteMyStockByPid(pfId);
		return portfolioRepository.deleteByPortfolioId(pfId);
	}

	/*
	 * @GetMapping("/getIndexData") public Map<String,String> bcd() {
	 * System.out.println(crawlService.indexCrawl()); crawlService.newsCrawl();
	 * return crawlService.indexCrawl(); }
	 */
//	@GetMapping("/getIndexData")
//	public Map<String,String> bcd() {
//		System.out.println(crawlService.indexCrawl());
//		crawlService.newsCrawl();
//		return crawlService.indexCrawl();
//	}

	@GetMapping("/getRanking")
	public List<MyPortfolio> getRanking() {
		return portfolioRepository.findAllPortfolioDescRor();
	}

}
