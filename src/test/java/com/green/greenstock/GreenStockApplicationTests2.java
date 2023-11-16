package com.green.greenstock;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.repository.interfaces.UserEntityRepository;
import com.green.greenstock.service.AdvisorService;
import com.green.greenstock.service.BoardNoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class GreenStockApplicationTests2 {

	@Autowired
	AdvisorRepository advisorRepository;

	@Autowired
	UserEntityRepository userEntityRepository;

	@Autowired
	AdvisorService advisorService;

	@Autowired
	BoardNoticeService boardNoticeService;
	
	
	@Test
	@Transactional
	void contextLoads() {	
		advisorService.validateSubscribeToAdvisor("shannon50", 3);
	}
	
}
