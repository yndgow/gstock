package com.green.greenstock.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.green.greenstock.repository.model.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MailServiceImpl implements MailCreateService, MailSendService{

	@Autowired
	JavaMailSender emailsender; // Bean 등록해둔 MailConfig 를 emailsender 라는 이름으로 autowired
	
	@Autowired
	UserService userService;

	private String ePw; // 인증번호

	// 메일 내용 작성
	@Override
	public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException {
		
		MimeMessage message = emailsender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to);// 보내는 대상
		message.setSubject("Gstock 회원가입 이메일 인증");// 제목

		String msgg = "";
		msgg += "<div style='margin:100px;'>";
		msgg += "<h1> 안녕하세요</h1>";
		msgg += "<h1> Gstock입니다</h1>";
		msgg += "<br>";
		msgg += "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
		msgg += "<br>";
		msgg += "<p>감사합니다<p>";
		msgg += "<br>";
		msgg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msgg += "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>";
		msgg += "<div style='font-size:130%'>";
		msgg += "CODE : <strong>";
		msgg += ePw + "</strong><div><br/> "; // 메일에 인증번호 넣기
		msgg += "</div>";
		message.setText(msgg, "utf-8", "html");// 내용, charset 타입, subtype
		// 보내는 사람의 이메일 주소, 보내는 사람 이름
		message.setFrom(new InternetAddress("dltmdgh757@naver.com", "Gstock_관리자"));// 보내는 사람

		return message;
	}
	
	@Override
	public MimeMessage createUserIdMessage(String to, String userId) throws MessagingException, UnsupportedEncodingException {
		
		MimeMessage message = emailsender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to);// 보내는 대상
		message.setSubject("Gstock 아이디 찾기");// 제목

		String msgg = "";
		msgg += "<div style='margin:100px;'>";
		msgg += "<h1> 안녕하세요</h1>";
		msgg += "<h1> Gstock입니다</h1>";
		msgg += "<br>";
		msgg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msgg += "<h3 style='color:blue;'>유저 아이디입니다.</h3>";
		msgg += "<div style='font-size:130%'>";
		msgg += "ID : <strong>";
		msgg += userId + "</strong><div><br/> ";
		msgg += "</div>";
		message.setText(msgg, "utf-8", "html");// 내용, charset 타입, subtype
		// 보내는 사람의 이메일 주소, 보내는 사람 이름
		message.setFrom(new InternetAddress("dltmdgh757@naver.com", "Gstock_관리자"));// 보내는 사람

		return message;
	}
	
	@Override
	public MimeMessage createTempPassMessage(String to) throws MessagingException, UnsupportedEncodingException {
		
		MimeMessage message = emailsender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to);// 보내는 대상
		message.setSubject("Gstock 임시 비밀번호 발송");// 제목

		String msgg = "";
		msgg += "<div style='margin:100px;'>";
		msgg += "<h1> 안녕하세요</h1>";
		msgg += "<h1> Gstock입니다</h1>";
		msgg += "<br>";
		msgg += "<p>회원님의 임시 비밀번호를 발송해 드립니다.<p>";
		msgg += "<br>";
		msgg += "<p>감사합니다<p>";
		msgg += "<br>";
		msgg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msgg += "<h3 style='color:blue;'>임시 비밀번호입니다.</h3>";
		msgg += "<div style='font-size:130%'>";
		msgg += "PASSWORD : <strong>";
		msgg += ePw + "</strong><div><br/> ";
		msgg += "</div>";
		message.setText(msgg, "utf-8", "html");
		message.setFrom(new InternetAddress("dltmdgh757@naver.com", "Gstock_관리자"));

		return message;
	}

	// 랜덤 인증 코드 전송
	@Override
	public String createKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 8; i++) { // 인증코드 8자리
			int index = rnd.nextInt(3); // 0~2 까지 랜덤, rnd 값에 따라서 아래 switch 문이 실행됨

			switch (index) {
			case 0:
				key.append((char) ((int) (rnd.nextInt(26)) + 97));
				// a~z (ex. 1+97=98 => (char)98 = 'b')
				break;
			case 1:
				key.append((char) ((int) (rnd.nextInt(26)) + 65));
				// A~Z
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				// 0~9
				break;
			}
		}

		return key.toString();
	}

	// 메일 발송
	// sendSimpleMessage 의 매개변수로 들어온 to 는 곧 이메일 주소가 되고,
	// MimeMessage 객체 안에 내가 전송할 메일의 내용을 담는다.
	// 그리고 bean 으로 등록해둔 javaMail 객체를 사용해서 이메일 보냄
	@Override
	public String sendSimpleMessage(String to) throws Exception {

		ePw = createKey(); // 랜덤 인증번호 생성

		// TODO Auto-generated method stub
		MimeMessage message = createMessage(to); // 메일 발송
		try {// 예외처리
			emailsender.send(message);
		} catch (MailException es) {
			es.printStackTrace();
			throw new IllegalArgumentException();
		}


		return ePw; // 메일로 보냈던 인증 코드를 서버로 반환
	}
	
	@Override
	public String sendUserId(String to, User user) throws Exception {
		
		log.info("유저 아이디 찾기 서비스 호출");
		
		String userId = user.getUserName();

		// TODO Auto-generated method stub
		MimeMessage message = createUserIdMessage(to, userId); // 메일 발송
		log.info("유저 아이디 찾기 메일발송");
		try {// 예외처리
			emailsender.send(message);
		} catch (MailException es) {
			es.printStackTrace();
			throw new IllegalArgumentException();
		}


		return userId; // 메일로 보냈던 인증 코드를 서버로 반환
	}
	
	@Override
	public String sendTempPassword(String to) throws Exception {

		ePw = createKey();

		MimeMessage message = createTempPassMessage(to);
		try {
			emailsender.send(message);
		} catch (MailException es) {
			es.printStackTrace();
			throw new IllegalArgumentException();
		}

		return ePw;
	}

	@Override
	public void sendSuspensionMessage(String userName, Integer suspendDate) throws UnsupportedEncodingException, MessagingException {
		User user = userService.findUserName(userName);
		String to = user.getEmail();
		
		MimeMessage message = createSuspensionMessage(to, suspendDate, userName);
		try {
			emailsender.send(message);
		} catch (MailException es) {
			es.printStackTrace();
			throw new IllegalArgumentException();
		}
	}

	private MimeMessage createSuspensionMessage(String to, Integer suspendDate, String userName) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = emailsender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to);// 보내는 대상
		message.setSubject("Gstock 계정정지 안내");// 제목

		String msgg = "";
		msgg += "<div style='margin:100px;'>";
		msgg += "<h1> 안녕하세요</h1>";
		msgg += "<h1> Gstock입니다</h1>";
		msgg += "<br>";
		msgg += "<p>이용약관 위반으로 " + userName + "가 사용정지되었습니다.<p>";
		msgg += "<br>";
		msgg += "<p>정지기간은 " + suspendDate + "일 입니다. 이용에 불편없으시길 바랍니다.<p>";
		message.setText(msgg, "utf-8", "html");
		message.setFrom(new InternetAddress("dltmdgh757@naver.com", "Gstock_관리자"));

		return message;
	}
	
	@Override
	public int createRefuseMessage(String to,String msg) throws MessagingException, UnsupportedEncodingException {
		
		MimeMessage message = emailsender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to);// 보내는 대상
		message.setSubject("Gstock 전문가 반려 사유");// 제목

		String msgg = "";
		msgg += "<div style='margin:100px;'>";
		msgg += "<h1> 안녕하세요</h1>";
		msgg += "<h1> Gstock입니다</h1>";
		msgg += "<br>";
		msgg += "<p>회원님의 전문가 신청이 반려되었습니다.<p>";
		msgg += "<br>";
		msgg += "<p>감사합니다<p>";
		msgg += "<br>";
		msgg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msgg += "<h3 style='color:blue;'>반려사유입니다.</h3>";
		msgg += "<div style='font-size:130%'>";
		msgg += "반려사유 : <strong>";
		msgg += msg + "</strong><div><br/> ";
		msgg += "</div>";
		message.setText(msgg, "utf-8", "html");
		message.setFrom(new InternetAddress("dltmdgh757@naver.com", "Gstock_관리자"));
		emailsender.send(message);
		return 1;
	}
	
	@Override
	public int createAcceptMessage(String to,String msg) throws MessagingException, UnsupportedEncodingException {
		
		MimeMessage message = emailsender.createMimeMessage();
		
		message.addRecipients(RecipientType.TO, to);// 보내는 대상
		message.setSubject("Gstock 전문가 승인");// 제목
		
		String msgg = "";
		msgg += "<div style='margin:100px;'>";
		msgg += "<h1> 안녕하세요</h1>";
		msgg += "<h1> Gstock입니다</h1>";
		msgg += "<br>";
		msgg += "<p>회원님의 전문가 신청이 승인되었습니다.<p>";
		msgg += "<br>";
		msgg += "<p>감사합니다<p>";
		msgg += "<br>";
		msgg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msgg += msg + "</strong><div><br/> ";
		msgg += "</div>";
		message.setText(msgg, "utf-8", "html");
		message.setFrom(new InternetAddress("dltmdgh757@naver.com", "Gstock_관리자"));
		emailsender.send(message);
		return 1;
	}
	
}