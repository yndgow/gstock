package com.green.greenstock.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.greenstock.repository.interfaces.ViewRepository;

@Service
public class SiteViewCountService {

	@Autowired
	ViewRepository viewRepository;

	public void addSiteViewCount(HttpServletRequest request, HttpServletResponse response) {
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();

		// 쿠키가 null이 아니고, 쿠키가 존재하는 경우
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("siteView")) {
					oldCookie = cookie;
					return; // 이미 "siteView" 쿠키가 존재하면 함수 종료
				}
			}
		}
		// "siteView" 쿠키가 존재하지 않는 경우에만 조회수 증가 및 새로운 쿠키 생성
		viewRepository.siteViewCountUp();
		Cookie newCookie = new Cookie("siteView", "1");
		newCookie.setPath("/");
		newCookie.setMaxAge(60); // test - 1분으로 설정
		response.addCookie(newCookie);
	}
	
}
