package com.green.greenstock.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class TradeLogDTO {
	private int pId;
	private String stockName;
	private String stockCode;
	private String tradeType;
	private int amount;
	private int price;
	private int quantity;
	private String regDate;
	
	public void setDateTime() {
		LocalDateTime dateTime = LocalDateTime.parse("2023-11-03T11:37:31");

		// 원하는 형식의 문자열로 변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(this.getRegDate());
		String formattedDateTime = dateTime.format(formatter);
		this.setRegDate(formattedDateTime);
	}
}
