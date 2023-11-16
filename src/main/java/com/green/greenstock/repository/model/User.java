package com.green.greenstock.repository.model;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class User {
	private Integer id;
	private String userName;
	private String password;
	private String email;
	private String tel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDate;
	private Timestamp regDate;
	private Integer roletypeId;
	private boolean suspended;
    private Date suspensionEndDate;
    
	public User() {
		this.suspended = false;
	}
    
}