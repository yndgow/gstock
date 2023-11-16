package com.green.greenstock.service;

import com.green.greenstock.repository.model.User;

public interface MailSendService {
	
	// 메일 발송
	String sendSimpleMessage(String to) throws Exception;

	// 임시 비밀번호 발송
	String sendTempPassword(String to) throws Exception;

	String sendUserId(String to, User user) throws Exception;

	void sendSuspensionMessage(String userName, Integer suspendDate) throws Exception;
	
	int createRefuseMessage(String to, String msg)throws Exception;

	int createAcceptMessage(String to, String msg)throws Exception;

}