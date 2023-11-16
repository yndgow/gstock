package com.green.greenstock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ChattingRoom {
    private String companyCode;
	private String companyName;
    private String type;
    private int userId;
    private int countUser;
    private Date lastMessage;
    private Date lastTime;
}
