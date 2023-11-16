package com.green.greenstock.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

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
public class KakaoProfile {

	@JsonProperty("id")
	private Long id;
	@JsonProperty("connected_at")
	private String connectedAt;
	@JsonProperty("properties")
	private Properties properties;
	@JsonProperty("kakao_account")
	private KakaoAccount kakaoAccount;

	@JsonInclude(JsonInclude.Include.NON_NULL)
	@JsonPropertyOrder({ "nickname" })
	@Data
	public class Properties {
		@JsonProperty("nickname")
		private String nickname;

	}

	@JsonInclude(JsonInclude.Include.NON_NULL)
	@JsonPropertyOrder({ "profile_nickname_needs_agreement", "profile", "has_email", "email_needs_agreement",
			"is_email_valid", "is_email_verified", "email", "birthyear", "birthday", "phone_number" })
	@Data
	public class KakaoAccount {

		@JsonProperty("profile_nickname_needs_agreement")
		private Boolean profileNicknameNeedsAgreement;
		@JsonProperty("profile")
		private Profile profile;
		@JsonProperty("has_email")
		private Boolean hasEmail;
		@JsonProperty("email_needs_agreement")
		private Boolean emailNeedsAgreement;
		@JsonProperty("is_email_valid")
		private Boolean isEmailValid;
		@JsonProperty("is_email_verified")
		private Boolean isEmailVerified;
		@JsonProperty("email")
		private String email;
		@JsonProperty("birthyear")
		private String birthYear;
		@JsonProperty("birthday")
		private String birthDay;
		@JsonProperty("phone_number")
		private String phoneNumber;

		@JsonInclude(JsonInclude.Include.NON_NULL)
		@JsonPropertyOrder({ "nickname" })
		@Data
		public class Profile {
			@JsonProperty("nickname")
			private String nickname;
		}

	}

}