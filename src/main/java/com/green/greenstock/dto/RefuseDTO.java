package com.green.greenstock.dto;

import java.time.LocalDate;
import java.util.Date;

import lombok.Data;

@Data
public class RefuseDTO {
	private int advisorId;
	private String refuseMsg;
	private String email;
	private LocalDate date;
}
