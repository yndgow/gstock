package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.ViewLogDTO;

@Mapper
public interface ViewRepository {
	
	void siteViewCountUp();
	
	List<ViewLogDTO> findAll();
}
