package com.green.greenstock.dto;

import lombok.Data;

@Data
public class BuySellDTO {
	private Integer portfolioId;
	private String stockId;
	private String companyName;
	private Integer price;
	private int amount;
}
