package com.green.greenstock.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class AdminExpertDTO {
	private int advisorId;
	private int id;
	private int status;
	private String imgName;
	private String email;
	private String tel;
	private String advisorFullName;
	private String career;
	private String introduction;
	private String refusedComment;
	private int specialization;
	private Date createdAt; // 신청일
	private Date birthDate; // 생일
	private Date regDate;   // 가입일
}
