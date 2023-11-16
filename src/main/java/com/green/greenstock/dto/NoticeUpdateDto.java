package com.green.greenstock.dto;

import lombok.Data;

@Data
public class NoticeUpdateDto {
 
	private int id;
	private String noticeTitle;
	private String noticeContent;
	private int noticeState;
}
