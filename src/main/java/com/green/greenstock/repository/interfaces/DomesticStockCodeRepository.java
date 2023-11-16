package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.DomesticStockCode;

@Mapper
public interface  DomesticStockCodeRepository {

	DomesticStockCode findByCompanyName(String companyName);
	List<DomesticStockCode>findAllLikeCompanyName(String companyName);
	DomesticStockCode findByCompanyCode(String companyCode);
}
