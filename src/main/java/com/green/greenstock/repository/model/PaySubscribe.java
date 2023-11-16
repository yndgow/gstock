package com.green.greenstock.repository.model;

import java.sql.Date;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaySubscribe {
	private int id;
	
	private String tid;

	private int advisorId;
	
	private String advisorNickName;
	
	private int userId;
	
	private int amount;
	
	private Date createdAt;
	
	private int staId;
}
