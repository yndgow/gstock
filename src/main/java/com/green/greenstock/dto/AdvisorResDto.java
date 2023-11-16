package com.green.greenstock.dto;

import java.text.DecimalFormat;

import com.green.greenstock.repository.entity.AdvisorEntity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdvisorResDto {

    private int advisorId;
    private String image;
    private String nickName;
    private String strSpecialization;
    private String formatSubscriptionCost;

    private String fullName;
    private String career;
    private String introduction;

    public AdvisorResDto fromEntity(AdvisorEntity advisorEntity) {

        String specializationName = null;

        switch (advisorEntity.getSpecialization()) {
            case 1:
                specializationName = "국내주식";
                break;
            case 2:
                specializationName = "해외주식";
                break;
            case 3:
                specializationName = "선물";
                break;
        }

        DecimalFormat decimalFormat = new DecimalFormat("#,###");

        return AdvisorResDto
                .builder()
                .advisorId(advisorEntity.getAdvisorId())
                .image(advisorEntity.getImageEntity().getImgName())
                .nickName(advisorEntity.getAdvisorNickName())
                .strSpecialization(specializationName)
                .formatSubscriptionCost(decimalFormat.format(advisorEntity.getSubscriptionCost()))
                .fullName(advisorEntity.getAdvisorFullName())
                .career(advisorEntity.getCareer())
                .introduction(advisorEntity.getIntroduction())
                .build();
    }

}
