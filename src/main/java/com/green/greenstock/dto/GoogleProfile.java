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
public class GoogleProfile {

	@JsonProperty("id")
	private String id;
	@JsonProperty("connected_at")
	private String name;
	@JsonProperty("given_name")
	private String givenName;
	@JsonProperty("family_name")
	private String familyName;
	@JsonProperty("picture")
	private String picture;
	@JsonProperty("locale")
	private String locale;

}