package com.green.greenstock.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyStocks {
	private int pId;
	private int amount;
	private int price;
	private int nowPrice;
	private String companyName;
	private String companyCode;
}