package com.green.greenstock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class NaverProfile {

	@JsonProperty("resultcode")
	private String resultcode;
	@JsonProperty("message")
	private String message;
	@JsonProperty("response")
	private NaverResponse response;
	

}