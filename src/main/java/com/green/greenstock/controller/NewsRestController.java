package com.green.greenstock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.green.greenstock.dto.NewsCrawlDTO;
import com.green.greenstock.service.CrawlService;

@RestController
public class NewsRestController {

	@Autowired
	CrawlService crawlService;

	@GetMapping("/getNews")
	public List<NewsCrawlDTO> getNews() {
		return crawlService.newsCrawl();
	}

	@GetMapping("/getData")
	public void getData() {
		RestTemplate restTemplate = new RestTemplate();
		String otherServerUrl = "http://localhost:8181/wherego/asdf";
		try {
			String response = restTemplate.getForObject(otherServerUrl, String.class);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 정보를 출력하거나 로깅할 수 있습니다.
		}
	}
}