package com.green.greenstock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.green.greenstock.controller.DataRestController;
import com.green.greenstock.dto.MyPortfolio;
import com.green.greenstock.repository.interfaces.GrowthLogRepository;
import com.green.greenstock.repository.interfaces.MyStocksRepository;
import com.green.greenstock.repository.interfaces.PortfolioRepository;

@Service
public class RankingService {

	@Autowired
	PortfolioRepository portfolioRepository;

	@Autowired
	DataRestController dataRestController;

	@Autowired
	MyStocksRepository myStockRepository;

	@Autowired
	GrowthLogRepository growthLogRepository;

	/*
	 * @Scheduled(fixedDelay = 10000) // 10초마다 실행 public void refreshROR() {
	 * List<MyPortfolio> list = portfolioRepository.findAllPortfolio();
	 * list.forEach(e -> {
	 * e.setStockList(myStockRepository.findMyStocksByPortfolioId(e.getPId())); });
	 * list.forEach(e -> { if (e.getStockList() != null) {
	 * e.getStockList().forEach(stock -> { stock.setNowPrice(Integer
	 * .parseInt(dataRestController.getStockDetailJson(stock.getCompanyCode()).
	 * getStckPrpr())); e.setNowTotalAsset(); }); // ror update.
	 * portfolioRepository.updateRor(e); } else { System.out.println("else"); } });
	 * }
	 */
//	@Scheduled(fixedDelay = 10000) // 1초마다 실행
	public void refreshROR() {
		List<MyPortfolio> list = portfolioRepository.findAllPortfolio();
		list.forEach(e -> {
			e.setStockList(myStockRepository.findMyStocksByPortfolioId(e.getPId()));
		});
		list.forEach(e -> {
			if (e.getStockList() != null) {
				e.getStockList().forEach(stock -> {
					stock.setNowPrice(Integer
							.parseInt(dataRestController.getStockDetailJson(stock.getCompanyCode()).getStckPrpr()));
					e.setNowTotalAsset();
				});
				portfolioRepository.updateRor(e);
			} else {
			}
		});
	}

	@Scheduled(cron = "0 0 0 * * ?") // 매일 오전 12시에 실행
	public void growthLog() {
		refreshROR();
		List<MyPortfolio> list = portfolioRepository.findAllPortfolio();
		list.forEach(e -> {
			growthLogRepository.makeGrowthLog(e);
		});
	}
}
