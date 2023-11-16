package com.green.greenstock.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.green.greenstock.dto.KakaoPayApproval;
import com.green.greenstock.dto.KakaoPayReady;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.repository.interfaces.PayRepository;
import com.green.greenstock.repository.model.Advisor;
import com.green.greenstock.repository.model.Pay;
import com.green.greenstock.repository.model.PaySubscribe;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class KakaoPayService {
	
	public final PayRepository payRepository;
	
	public final AdvisorService advisorService;
	
    private static final String HOST = "https://kapi.kakao.com";
    
    KakaoPayReady kakaoPayReady;
    KakaoPayApproval kakaoPayApproval;
    
    String itemName;
	String subCost;
    
    public String kakaoPayReady(int advisorId) {
    	
    	Advisor advisor = advisorService.findAdvisorById(advisorId);
    	
    	itemName = Integer.toString(advisor.getAdvisorId());
    	subCost = Integer.toString(advisor.getSubscriptionCost());
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "9b6cd082322c9ae36f1e62e76b1cc398");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "Gstock");
        params.add("item_name", itemName);
        params.add("quantity", "1");
        params.add("total_amount", subCost);
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost/pay/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost/pay/kakaoPayCancel");
        params.add("fail_url", "http://localhost/pay/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
        	kakaoPayReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReady.class);
            
            log.info("" + kakaoPayReady);
            
            return kakaoPayReady.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    public KakaoPayApproval KakaoPayInfo(String pg_token) {
    	log.info("KakaoPayInfo 실행");
    	
    	RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "9b6cd082322c9ae36f1e62e76b1cc398");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReady.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "Gstock");
        params.add("pg_token", pg_token);
        params.add("total_amount", subCost);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApproval = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApproval.class);
            log.info("" + kakaoPayApproval);
          
            return kakaoPayApproval;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
    public void KakaoPayCancel(Pay pay, int cancelAmount) {
    	log.info("KakaoPayCancel 실행");
    	
    	RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "9b6cd082322c9ae36f1e62e76b1cc398");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", pay.getTid());
        params.add("cancel_amount", Integer.toString(cancelAmount));
        params.add("cancel_tax_free_amount", "0");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            String result = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body, String.class);
            log.info("" + result);
            
            pay.setAmountTotal(pay.getAmountTotal()-cancelAmount);
            
            modifyPayInfo(pay);
            
            advisorService.deleteSubscribeToAdvisorEntity(Integer.parseInt(pay.getItemName()), pay.getUserId());
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Transactional
	public void insertPayInfo(Pay pay) {
		int result = payRepository.insertPayInfo(pay);
		if(result != 1) {
			throw new CustomRestfulException("잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
		}
	}
	
    @Transactional
	public void modifyPayInfo(Pay pay) {
		payRepository.modifyPayInfo(pay);
	}

	public Pay findPayInfoById(Integer id) {
		return payRepository.findPayInfoById(id);
	}
	
	/*
	 * @Transactional private void deletePaySubscribe(String tid) {
	 * payRepository.deletePaySubscribe(tid); }
	 */

	@Transactional
	public void insertPaySubscribeInfo(PaySubscribe paySubscribe) {
		int result = payRepository.insertPaySubscribeInfo(paySubscribe);
		if(result != 1) {
			throw new CustomRestfulException("잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
		}	
	}

	public Pay findPayInfoByTid(String tid) {
		return payRepository.findPayInfoByTid(tid);
	}
}
