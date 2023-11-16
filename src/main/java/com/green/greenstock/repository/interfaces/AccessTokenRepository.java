package com.green.greenstock.repository.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.greenstock.repository.model.AccessTokenInfo;


public interface AccessTokenRepository extends JpaRepository<AccessTokenInfo, Integer>{

	AccessTokenInfo findTopByOrderByTokenIdDesc();
}
