package com.green.greenstock.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdvisorReqDto {
        
    private int userId;
    private String fullName;
    private String nickName;
    private MultipartFile profilePhoto;
    private String career;
    private String introduction;
    private int specialization;
}
