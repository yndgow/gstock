package com.green.greenstock.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.greenstock.dto.AdminExpertDTO;
import com.green.greenstock.handler.exception.UnAuthorizedException;
import com.green.greenstock.service.UserService;

@Controller
public class PortfolioController {

	@Autowired
	UserService userService;
	
	@Autowired
	HttpSession session;

	@GetMapping("/portfolio")
	public String test() {
		// 접근유저가 권한있는 사용자인지 확인
		if (session.getAttribute("principal") == null) {
			throw new UnAuthorizedException("로그인 먼저 진행해주세요.", HttpStatus.UNAUTHORIZED);
		}
		return "/portfolio/userPortfolio";
	}

	@GetMapping("/portfolio/popUpPage")
	public String popUpPage() {
		return "/portfolio/popUpPage";
	}

}
