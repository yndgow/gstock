package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.jpa.repository.JpaRepository;

import com.green.greenstock.dto.MyStocks;

@Mapper
public interface MyStocksRepository{

	int updateMyStocks(MyStocks ms);

	int insertMyStocks(MyStocks ms);

	int deleteMyStocks(String companyCode);
	
	List<MyStocks> findMyStocksByPortfolioId(int id);

	void deleteMyStockByPid(int pfId);
	
}
