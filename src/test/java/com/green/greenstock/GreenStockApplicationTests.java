package com.green.greenstock;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.greenstock.service.PortfolioService;
import com.green.greenstock.dto.Pagination;
import com.green.greenstock.dto.PagingDto;

@SpringBootTest
class GreenStockApplicationTests {
	

	@Autowired
	PortfolioService portfolioService;

	private int endPage;
	private int countData;

	
	@Test
	void contextLoads() {		
		PagingDto pagingDto = new PagingDto( );
		pagingDto.getPage();
		int result = pagingDto.getRecordSize();
		System.out.println(result);
		Pagination pagination =  new Pagination(1,  pagingDto);
		pagination.getEndPage();
		PagingDto result2 = pagination.getPaging();
		this.endPage = (int) Math.ceil(countData/10 )+1;
	}
}
