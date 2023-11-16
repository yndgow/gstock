package com.green.greenstock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.MyPortfolio;
import com.green.greenstock.dto.MyStocks;
import com.green.greenstock.repository.interfaces.MyStocksRepository;
import com.green.greenstock.repository.interfaces.PortfolioRepository;

@Service
public class PortfolioService {

	@Autowired
	PortfolioRepository portfolioRepository;
	
	@Autowired
	MyStocksRepository mystocksRepository;
	
	public MyPortfolio findAllDatasByPortfolioId(int pId) {
		MyPortfolio mp =  portfolioRepository.findByPortfolioId(pId);
		List<MyStocks> list = mystocksRepository.findMyStocksByPortfolioId(pId);
		mp.setStockList(list);
		return mp;
	}

	
	
}
