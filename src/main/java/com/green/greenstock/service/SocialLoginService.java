package com.green.greenstock.service;

import org.springframework.util.MultiValueMap;

public interface SocialLoginService {
	
	//accesstoken 발급
	String getAccessToken(MultiValueMap<String, String> params, String tokenUrl, String type);

	//token 이용해 user정보 받아오기
	Object getUserInfo(String accessToken, String type, String apiUrl);

}