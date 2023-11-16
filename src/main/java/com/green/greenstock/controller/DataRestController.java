package com.green.greenstock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.greenstock.dto.DomesticStockCurrentPriceOutput;
import com.green.greenstock.dto.ResponseApiInfo;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.service.StockApiService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class DataRestController {

	private final StockApiService stockApiService;

	
	public String abc() {
		return "abc";
	}

	// 국내주식 현재가 조회 JSON 데이터
	public DomesticStockCurrentPriceOutput getStockDetailJson(String companyCode) {
		if (companyCode == null || companyCode.isEmpty()) {
			companyCode = "005930";
		}

		// 종목 코드로 api 정보 가져오기
		ResponseApiInfo<?> resInfo = stockApiService.getApiDomesticStockCurrentPrice(companyCode);

		if (resInfo == null) {
			throw new CustomRestfulException("입력하신 정보가 없습니다.", HttpStatus.BAD_REQUEST);
		}
		// 제네릭 타입 확정
		ObjectMapper mapper = new ObjectMapper();
		return mapper.convertValue(resInfo.getOutput(), DomesticStockCurrentPriceOutput.class);
	}
	
	
	
}
