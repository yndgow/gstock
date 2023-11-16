package com.green.greenstock.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.KakaoPayApproval;
import com.green.greenstock.dto.KakaoPayDto;
import com.green.greenstock.repository.interfaces.SubscribeToAdvisorRepository;
import com.green.greenstock.repository.model.Advisor;
import com.green.greenstock.repository.model.Pay;
import com.green.greenstock.repository.model.PaySubscribe;
import com.green.greenstock.repository.model.SubscribeToAdvisor;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.AdvisorService;
import com.green.greenstock.service.ChattingService;
import com.green.greenstock.service.KakaoPayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pay")
@RequiredArgsConstructor
public class PayController {
	
	private final KakaoPayService kakaoPayService;
	
	private final AdvisorService advisorService;
	
	private final ChattingService chattingService;
	
	private final SubscribeToAdvisorRepository subscribeToAdvisorRepository;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/kakao")
	public String KakaoPay(@RequestParam("advisorId") Integer advisorId, Model model) {
		model.addAttribute("advisorId", advisorId);
		return "/pay/pay";
	}
	
	@PostMapping("/kakao")
	@ResponseBody
	public String KakaoPayProc(KakaoPayDto kakaoPayDto, Integer advisorId) {
		log.info("advisorId : " + advisorId);
		return kakaoPayService.kakaoPayReady(advisorId);
	}
	
	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		log.info("pg_token : " + pg_token);
		KakaoPayApproval kakaoPayApproval = kakaoPayService.KakaoPayInfo(pg_token);
		User user = (User)session.getAttribute("principal");
		
		int amount = kakaoPayApproval.getAmount().getTotal();
		Date createdAt = kakaoPayApproval.getCreated_at();
		int userId = user.getId();
		String tid = kakaoPayApproval.getTid();
		
		//결제 정보를 pay_tb에 저장
		Pay pay = new Pay();
		pay.setAid(kakaoPayApproval.getAid());
		pay.setCid(kakaoPayApproval.getCid());
		pay.setTid(tid);
		pay.setSid(kakaoPayApproval.getSid());
		pay.setItemName(kakaoPayApproval.getItem_name());
		pay.setAmountTotal(amount);
		pay.setCreatedAt(createdAt);
		pay.setApprovedAt(kakaoPayApproval.getApproved_at());
		pay.setUserId(userId);
		kakaoPayService.insertPayInfo(pay);
		
		//결제 정보를 subscribe_to_advisor에 저장
		int advisorId = Integer.parseInt(pay.getItemName());
		advisorService.saveSubscribeToAdvisor(advisorId, userId);
		
		Advisor advisor = advisorService.findAdvisorById(advisorId);
		log.info("advisor : " + advisor);
		
		SubscribeToAdvisor subscribeToAdvisor = subscribeToAdvisorRepository.findByAdvisorIdAndUserId(advisorId, userId);
		log.info("subscribeToAdvisor : " + subscribeToAdvisor);
		//결제 정보를 pay_subscribe에 저장
		PaySubscribe paySubscribe = new PaySubscribe();
		paySubscribe.setTid(tid);
		paySubscribe.setAdvisorId(advisorId);
		paySubscribe.setAdvisorNickName(advisor.getAdvisorNickName());
		paySubscribe.setAmount(amount);
		paySubscribe.setUserId(userId);
		paySubscribe.setCreatedAt(createdAt);
		paySubscribe.setStaId(subscribeToAdvisor.getSubId());
		kakaoPayService.insertPaySubscribeInfo(paySubscribe);
		
		//일대일 채팅 생성
		String chattingCode = ""+advisor.getAdvisorNickName()+"@"+user.getUserName();
		String subCheck = chattingService.subCheck(chattingCode, user.getId());
		if(subCheck.equals("0")) {
			int advisorIdToUserId = chattingService.advisorIdToUserId(advisorId);
			chattingService.subscribe(chattingCode, advisorIdToUserId);
			chattingService.subscribe(chattingCode, user.getId());
		}
		
		model.addAttribute("payInfo", kakaoPayApproval);
		model.addAttribute("advisor", advisor);
		return "/pay/paySuccess";
	}
	
	@GetMapping("/refund")
	public String Refund(@RequestParam("tid") String tid) {
		
		Pay pay = kakaoPayService.findPayInfoByTid(tid);
		
		//기간에 따라 환불금액설정
        LocalDateTime now = LocalDateTime.now();
		java.util.Date utilDate = Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
		java.util.Date approvedDate = pay.getApprovedAt();
		long differenceInMillis = utilDate.getTime() - approvedDate.getTime();
		long differenceInDays = differenceInMillis / (1000 * 60 * 60 * 24);
		double refundAmount = pay.getAmountTotal()*differenceInDays/30;
		int amount = (int) (pay.getAmountTotal() - refundAmount);
		log.info("amount : " + amount);
		kakaoPayService.KakaoPayCancel(pay, amount);
		
		return "redirect:/user/payment";
	}
}
