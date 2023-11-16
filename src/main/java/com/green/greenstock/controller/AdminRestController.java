package com.green.greenstock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.greenstock.dto.RefuseDTO;
import com.green.greenstock.dto.ViewLogDTO;
import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.repository.interfaces.ViewRepository;
import com.green.greenstock.service.MailSendService;

@RestController
public class AdminRestController {

	@Autowired
	MailSendService mailSendService;
	
	@Autowired
	AdvisorRepository advisorRepository;

	@Autowired
	ViewRepository viewRepository;
	

	@PostMapping("/refuse")
	@ResponseBody
	public String refuse(@RequestBody RefuseDTO dto) throws Exception {
		advisorRepository.updateStatus(dto.getAdvisorId(),3);
		advisorRepository.insertRefuseReason(dto.getAdvisorId(),dto.getRefuseMsg());
		mailSendService.createRefuseMessage(dto.getEmail(), dto.getRefuseMsg());
		return "메시지 전송 완료";
	}
	
	@GetMapping("/approve/{advisorId}/{advisorEmail}")
	public int approve(@PathVariable int advisorId, @PathVariable String advisorEmail) throws Exception {
		advisorRepository.updateStatus(advisorId, 2);
		mailSendService.createAcceptMessage("ysl2884@naver.com", "전문가 등록 완료.");
		return 1;
	}
	
	@GetMapping("/getRefuseData/{advisorId}")
	public RefuseDTO getRefuseData(@PathVariable int advisorId) {
		return advisorRepository.findAdvisorRefuseByAdvisorId(advisorId);
	}
	
	@GetMapping("/getDailyViewData")
	public List<ViewLogDTO> getDailyViewCount(){
		return viewRepository.findAll();
	}
	
	@GetMapping("/insertData")
	public void insertData() {
		
	}
}
