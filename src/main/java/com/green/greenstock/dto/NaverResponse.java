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
public class NaverResponse {

	@JsonProperty("id")
	private String id;
	@JsonProperty("email")
	private String email;
	@JsonProperty("mobile")
	private String mobile;
	@JsonProperty("name")
	private String name;
	@JsonProperty("birthday")
	private String birthday;
	@JsonProperty("birthyear")
	private String birthyear;

}