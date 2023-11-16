package com.green.greenstock.dto;

import java.text.DecimalFormat;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AdvisorSubCountResDto {

    private int advisorId;
    private String imgName;
    private String advisorNickName;
    private String specialization;
    private String subscriptionCost;
    private String introduction;
    private String subscribeCount;

    private LocalDateTime createdAt;

    public String getSpecialization() {
        switch (specialization) {
            case "1":
                specialization = "국내주식";
                break;
            case "2":
                specialization = "해외주식";
                break;
            case "3":
                specialization = "선물";
                break;
            default:
                specialization = "종합";
                break;
        }
        return specialization;
    }

    public String getSubscriptionCost() {
        int cost = Integer.parseInt(subscriptionCost);
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        subscriptionCost = decimalFormat.format(cost);
        return subscriptionCost;
    }

}
