package com.green.greenstock.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeWriteDto {
	private int id;
	private int userId;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardCreated;
	private Integer view;
	
}
