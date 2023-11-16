package com.green.greenstock.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface MailCreateService {

	// 메일 내용 작성
	MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException;
	
	// 임시 비밀번호 발송 내용 작성
	MimeMessage createTempPassMessage(String to) throws MessagingException, UnsupportedEncodingException;

	// 랜덤 인증 코드 전송
	String createKey();

	MimeMessage createUserIdMessage(String to, String userId) throws MessagingException, UnsupportedEncodingException;

	// advisor 반려 메시지 송신 msg 에는 반려사유.
	int createRefuseMessage(String to, String msg) throws MessagingException, UnsupportedEncodingException;
}