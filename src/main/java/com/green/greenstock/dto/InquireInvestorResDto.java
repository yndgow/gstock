package com.green.greenstock.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class InquireInvestorResDto {
    private String stckBsopDate; // 주식 영업 일자
    private String stckClpr; // 주식 종가
    private String prdyVrss; // 전일 대비
    private String prdyVrssSign; // 전일 대비 부호, 1 : 상한, 2 : 상승, 3 : 보합, 4 : 하한, 5 : 하락
    private String prsnNtbyQty; // 개인 순매수 수량
    private String frgnNtbyQty; // 외국인 순매수 수량
    private String orgnNtbyQty; // 기관계 순매수 수량
    private String prsnNtbyTrPbmn; // 개인 순매수 거래 대금
    private String frgnNtbyTrPbmn; // 외국인 순매수 거래 대금
    private String orgnNtbyTrPbmn; // 기관계 순매수 거래 대금
    private String prsnShnuVol; // 개인 매수2 거래량
    private String frgnShnuVol; // 외국인 매수2 거래량
    private String orgnShnuVol; // 기관계 매수2 거래량
    private String prsnShnuTrPbmn; // 개인 매수2 거래 대금
    private String frgnShnuTrPbmn; // 외국인 매수2 거래 대금
    private String orgnShnuTrPbmn; // 기관계 매수2 거래 대금
    private String prsnSelnVol; // 개인 매도 거래량
    private String frgnSelnVol; // 외국인 매도 거래량
    private String orgnSelnVol; // 기관계 매도 거래량
    private String prsnSelnTrPbmn; // 개인 매도 거래 대금
    private String frgnSelnTrPbmn; // 외국인 매도 거래 대금
    private String orgnSelnTrPbmn; // 기관계 매도 거래 대금

}
