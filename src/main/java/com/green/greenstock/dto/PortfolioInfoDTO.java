package com.green.greenstock.dto;

import lombok.Data;

@Data
public class PortfolioInfoDTO {
	private int pId;
	private int userId;
	private String title;
	private String discription;
	private int totalAsset;
	private boolean visible;
	private int msId;
	private String companyCode;
	private int price;
	
}
