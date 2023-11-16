package com.green.greenstock.dto;

import lombok.Data;

@Data
public class NoticeViewDto {
	private int id;
	private int userId;
	private String noticeTitle;
	private String noticeContent;
	private int noticeState;
	
}
