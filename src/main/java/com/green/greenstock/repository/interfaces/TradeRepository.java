package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.TradeLogDTO;

@Mapper
public interface TradeRepository {
	
	int insertTradeLog(TradeLogDTO tradelogDto);

	List<TradeLogDTO> findAllTradeLogByPortfolioId(int pid);
	
}
