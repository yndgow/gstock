package com.green.greenstock.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.green.greenstock.dto.GoogleOAuthTokenDto;
import com.green.greenstock.dto.GoogleProfile;
import com.green.greenstock.dto.KakaoProfile;
import com.green.greenstock.dto.NaverOAuthTokenDto;
import com.green.greenstock.dto.NaverProfile;
import com.green.greenstock.dto.NaverResponse;
import com.green.greenstock.dto.OAuthToken;
import com.green.greenstock.handler.exception.CustomRestfulException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SocialLoginServiceImpl implements SocialLoginService{
	
	@Override
	public String getAccessToken(MultiValueMap<String, String> params, String tokenUrl,
			String type) {
		log.info(type);
		RestTemplate rt = new RestTemplate();
		
		if(type.equals("Google")) {
			log.info("Google 엑세스토큰 발급 시작");
			ResponseEntity<GoogleOAuthTokenDto> response = rt.postForEntity(tokenUrl, params,
					GoogleOAuthTokenDto.class);
			if(response.getStatusCode() != HttpStatus.OK) {
				throw new CustomRestfulException("소셜 로그인 실패", HttpStatus.BAD_REQUEST);
			}
			return response.getBody().getAccessToken();
		} else if(type.equals("Naver")) {
			log.info("Naver 엑세스토큰 발급 시작");
			ResponseEntity<NaverOAuthTokenDto> response = rt.postForEntity(
					tokenUrl, params, NaverOAuthTokenDto.class);
			if(response.getStatusCode() != HttpStatus.OK) {
				throw new CustomRestfulException("소셜 로그인 실패", HttpStatus.BAD_REQUEST);
			}
			return response.getBody().getAccessToken();
		} else {
			log.info("Kakao 엑세스토큰 발급 시작");
			ResponseEntity<OAuthToken> response = rt.postForEntity(tokenUrl, params,
					OAuthToken.class);
			if(response.getStatusCode() != HttpStatus.OK) {
				throw new CustomRestfulException("소셜 로그인 실패", HttpStatus.BAD_REQUEST);
			}
			return response.getBody().getAccessToken();
		}
	}

	@Override
	public Object getUserInfo(String accessToken, String type, String apiUrl) {
		// TODO Auto-generated method stub
		log.info("엑세스 토큰 확인" + accessToken);
		log.info("----------------------------------------------------");

		RestTemplate apiRt = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + accessToken);

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(headers);

		if(type.equals("Google")) {
			ResponseEntity<GoogleProfile> userInfoResponse = apiRt.exchange(apiUrl, HttpMethod.GET, entity,
					GoogleProfile.class);
			if(userInfoResponse.getStatusCode() != HttpStatus.OK) {
				throw new CustomRestfulException("소셜 로그인 실패", HttpStatus.BAD_REQUEST);
			}
			GoogleProfile userInfo = userInfoResponse.getBody();
			log.info("Google 사용자 정보: " + userInfo);
			return userInfo;
		} else if(type.equals("Naver")) {
			ResponseEntity<NaverProfile> userInfoResponse = apiRt.exchange(apiUrl, HttpMethod.GET, entity,
					NaverProfile.class);
			if(userInfoResponse.getStatusCode() != HttpStatus.OK) {
				throw new CustomRestfulException("소셜 로그인 실패", HttpStatus.BAD_REQUEST);
			}
			NaverResponse naverUser = userInfoResponse.getBody().getResponse();
		    log.info("naverProfile : " + naverUser);
		    return naverUser;
		} else {
			ResponseEntity<KakaoProfile> userInfoResponse = apiRt.exchange(apiUrl, HttpMethod.GET, entity,
					KakaoProfile.class);
			if(userInfoResponse.getStatusCode() != HttpStatus.OK) {
				throw new CustomRestfulException("소셜 로그인 실패", HttpStatus.BAD_REQUEST);
			}
			KakaoProfile kakaoProfile = userInfoResponse.getBody();
			log.info("KakaoProfile : " + kakaoProfile);
			return kakaoProfile;
		}
	}

}