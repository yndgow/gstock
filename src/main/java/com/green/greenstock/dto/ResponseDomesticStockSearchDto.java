package com.green.greenstock.dto;

import java.util.List;

import com.green.greenstock.utils.Pagination;

import lombok.Data;

@Data
public class ResponseDomesticStockSearchDto {

	private List<DomesticStockCurrentPriceOutput> domesticStockCurrentPriceList;
	private String searchData;
	
	private Pagination pagination;
	
	
}
