package com.green.greenstock.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
@PropertySource("classpath:/email.properties")
public class MailConfig {
	
    @Value("${mail.smtp.port}")
    private int port;
    @Value("${mail.smtp.socketFactory.port}")
    private int socketPort;
    @Value("${mail.smtp.auth}")
    private boolean auth;
    @Value("${mail.smtp.starttls.enable}")
    private boolean starttls;
    @Value("${mail.smtp.starttls.required}")
    private boolean startlls_required;
    @Value("${mail.smtp.socketFactory.fallback}")
    private boolean fallback;
    @Value("${AdminMail.id}")
    private String id;
    @Value("${AdminMail.password}")
    private String password;
 
    @Bean
    public JavaMailSender javaMailService() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost("smtp.gmail.com");
        javaMailSender.setUsername(id);
        javaMailSender.setPassword(password);
        javaMailSender.setPort(port);
        javaMailSender.setJavaMailProperties(getMailProperties());
        javaMailSender.setDefaultEncoding("UTF-8");
        return javaMailSender;
    }
    private Properties getMailProperties()
    {
        Properties pt = new Properties();
        pt.put("mail.smtp.socketFactory.port", socketPort);
        pt.put("mail.smtp.auth", auth);
        pt.put("mail.smtp.starttls.enable", starttls);
        pt.put("mail.smtp.starttls.required", startlls_required);
        pt.put("mail.smtp.socketFactory.fallback",fallback);
        pt.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        return pt;
    }

	/*
	 * @Bean public JavaMailSender javaMailService() { JavaMailSenderImpl
	 * javaMailSender = new JavaMailSenderImpl();
	 * 
	 * javaMailSender.setHost("smtp.naver.com"); // 메인 도메인 서버 주소 => 정확히는 smtp 서버 주소
	 * javaMailSender.setUsername("dltmdgh757"); // 네이버 아이디
	 * javaMailSender.setPassword("vpfznlr1264!"); // 네이버 비밀번호
	 * 
	 * javaMailSender.setPort(465); // 메일 인증서버 포트
	 * 
	 * javaMailSender.setJavaMailProperties(getMailProperties()); // 메일 인증서버 정보 가져오기
	 * 
	 * return javaMailSender; }
	 * 
	 * private Properties getMailProperties() { Properties properties = new
	 * Properties(); properties.setProperty("mail.transport.protocol", "smtp"); //
	 * 프로토콜 설정 properties.setProperty("mail.smtp.auth", "true"); // smtp 인증
	 * properties.setProperty("mail.smtp.starttls.enable", "true"); // smtp
	 * strattles 사용 properties.setProperty("mail.debug", "true"); // 디버그 사용
	 * properties.setProperty("mail.smtp.ssl.trust","smtp.naver.com"); // ssl 인증 서버는
	 * smtp.naver.com properties.setProperty("mail.smtp.ssl.enable","true"); // ssl
	 * 사용 return properties; }
	 */
}