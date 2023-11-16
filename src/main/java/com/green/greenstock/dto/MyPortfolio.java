package com.green.greenstock.dto;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain = true)
public class MyPortfolio {
	private Integer pId;
	private Integer userId;
	private String title;
	private String discription;
	private Integer sellMoney;
	private Integer totalAsset;
	private Integer nowTotalAsset;
	private BigDecimal ror;
	private String regDate;
	private boolean isVisible;
	private boolean stockExist;
	private List<MyStocks> stockList;

	// 이 메써드를 수행하고나서는 꼭 myPortfolio 를 수정해주자.
	public void buySell(MyStocks mystock, String type) { // type == buy / sell
		this.setStockExist(false);
		int operation = type.equals("buy") ? 1 : -1;

		// 예외처리.
		if (stockList == null) {
			if (type.equals("buy")) {
				this.setStockExist(false);
				List<MyStocks> list = new ArrayList<>();
				list.add(mystock);
				this.stockList = list;
				this.setTotalAsset();
			} else {
			}
		}

		// sell일경우 모두 팔면 remove한다.
		if (type.equals("sell") && stockList != null) {
			// 1. 판매할 것중 match 하는게 있고, amount 또한 일치한다.
			boolean amountMatch = stockList.stream().anyMatch(
					e -> e.getCompanyCode().equals(mystock.getCompanyCode()) && e.getAmount() == mystock.getAmount());
			if (amountMatch) {
				// 목록에서 해당 myStock를 삭제한다.
				stockList.removeIf(e -> e.getCompanyCode().equals(mystock.getCompanyCode())
						&& e.getAmount() == mystock.getAmount());
				this.sellMoney = (int) mystock.getAmount() * mystock.getPrice();
				this.setStockExist(false);
			} else {
				stockList.stream().filter(e -> e.getCompanyCode().equals(mystock.getCompanyCode())).forEach(stock -> {
					this.sellMoney += (int) stock.getAmount() * stock.getPrice()
							+ operation * (int) (mystock.getPrice() * mystock.getAmount());
					stock.setAmount(stock.getAmount() - mystock.getAmount());
				});

				this.setStockExist(true);
			}
		} else { // buy
			boolean isMatchingStockExists = stockList.stream()
					.anyMatch(e -> e.getCompanyCode().equals(mystock.getCompanyCode()));

			if (isMatchingStockExists) {
				this.setStockExist(true);
				stockList.stream().filter(e -> e.getCompanyCode().equals(mystock.getCompanyCode())).forEach(e -> {
					// 평균가를 내서 Mystock 배열을 수정.
					e.setPrice(((int) (e.getPrice() * e.getAmount())
							+ operation * (int) (mystock.getPrice() * mystock.getAmount()))
							/ (int) (e.getAmount() + operation * mystock.getAmount()));
					e.setAmount(e.getAmount() + operation * mystock.getAmount());
				});
				this.setTotalAsset();
			} else {
				this.setStockExist(false);
				this.stockList.add(mystock);
				this.setTotalAsset();
			}
			// 수정한 뒤 total Asset 갱신. 샀을때는 상관없을꺼같은데, 팔았을 때는 자산 변동. - 든 + 든
		}

	}

	public void setTotalAsset() {
		Integer asset = 0;

		for (int i = 0; i < this.stockList.size(); i++) {
			asset += (int) this.stockList.get(i).getAmount() * this.stockList.get(i).getPrice();
		}
		if (this.sellMoney != null && this.sellMoney != 0) {
			asset += this.sellMoney;
		}
		this.totalAsset = asset;
	}

	public void addStockList(MyStocks stock) {
		this.stockList.add(stock);
	}

	public MyStocks getMyStocks(String companyCode) {
		MyStocks myStock = this.stockList.stream().filter(e -> e.getCompanyCode().equals(companyCode)).findFirst() // 또는
																													// .findAny()
				.orElse(null);
		return myStock;
	}

	public void setNowTotalAsset() {
		Integer asset = 0;

		for (int i = 0; i < this.stockList.size(); i++) {
			asset += (int) this.stockList.get(i).getAmount() * this.stockList.get(i).getNowPrice();
		}
		if (this.sellMoney != null && this.sellMoney != 0) {
			asset += this.sellMoney;
		}
		this.nowTotalAsset = asset;
		setRor();
	}

	public void setRor() {
		double roi = (((double) this.nowTotalAsset - (double) this.totalAsset) / this.totalAsset) * 100;
		BigDecimal roiDecimal = new BigDecimal(roi);
		DecimalFormat df = new DecimalFormat("0.00");
		String formattedData = df.format(roiDecimal);
		this.ror = new BigDecimal(formattedData);
	}

}