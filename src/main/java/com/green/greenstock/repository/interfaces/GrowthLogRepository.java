package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.GrowthLogDTO;
import com.green.greenstock.dto.MyPortfolio;

@Mapper
public interface GrowthLogRepository {
	
	void makeGrowthLog(MyPortfolio mp);

	GrowthLogDTO findAllGrowthLog();

	List<GrowthLogDTO> findGrowthLogByPid(int pid);
}
