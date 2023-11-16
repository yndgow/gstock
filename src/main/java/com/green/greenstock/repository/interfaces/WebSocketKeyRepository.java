package com.green.greenstock.repository.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.greenstock.repository.model.WebSocketKeyInfo;

public interface WebSocketKeyRepository extends JpaRepository<WebSocketKeyInfo, Integer>{
	
	WebSocketKeyInfo findTopByOrderByIdDesc();

}
