package com.green.greenstock.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
/** 국내주식기간별시세(일/주/월/년)
 * https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_a08c3421-e50f-4f24-b1fe-64c12f723c77 
 */
@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class InquireDailyItemChartPriceOutput {
	private String stckBsopDate; // 주식 영업 일자
	private String stckClpr;    // 주식 종가
	private String stckOprc;    // 주식 시가
	private String stckHgpr;    // 주식 최고가
	private String stckLwpr;    // 주식 최저가
	private String acmlVol;     // 누적 거래량
	private String acmlTrPbmn;  // 누적 거래 대금
	private String flngClsCode; // 락 구분 코드 01:권리락 02:배당락 03:분배락 04:권배락 05:중간(분기)배당락 06:권리중간배당락 07:권리분기배당락
	private String prttRate;    // 분할 비율
	private String modYn;       // 분할변경여부
	private String prdyVrssSign;// 전일 대비 부호
	private String prdyVrss;    // 전일 대비
	private String revlIssuReas;// 재평가사유코드
}