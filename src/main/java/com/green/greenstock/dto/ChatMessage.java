package com.green.greenstock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ChatMessage {
    private String companyCode;
    private int id;
	private String userId;
	private String userName;
    private String content;
    private Date date;
    // 생성자, 게터, 세터 등을 추가하세요.
}
