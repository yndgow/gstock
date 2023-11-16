package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.dto.MyPortfolio;
import com.green.greenstock.dto.PortfolioInfoDTO;

@Mapper
public interface PortfolioRepository {

	MyPortfolio findByPortfolioId(int pid);
	void savePortfolio(@Param("pf") MyPortfolio pf,@Param("id") int id);
	List<MyPortfolio> findByuserId(int id);
	int updateTitle(MyPortfolio mp);
	int updateDiscription(MyPortfolio mp);
	int deleteByPortfolioId(Integer id);
	void buySellStock(MyPortfolio mp);
	List<MyPortfolio> findAllPortfolioDescRor();
	List<MyPortfolio> findAllPortfolio();
	int updateVisibility(MyPortfolio mp);
	void updateRor(MyPortfolio mp);
	
}
