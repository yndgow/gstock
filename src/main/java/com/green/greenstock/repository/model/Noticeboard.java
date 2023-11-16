package com.green.greenstock.repository.model;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonNaming(value =PropertyNamingStrategies.SnakeCaseStrategy.class )
public class Noticeboard {
	
	private int id;				
	private	int userId;	
	private String noticeTitle;
	private String noticeContent;
	private Timestamp noticeCreated;
	private Timestamp noticeUpdated;	
	private int noticeState;	
	private int hitCount;
	private int dataCount;
	
	

}
