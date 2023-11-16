package com.green.greenstock.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
/** 국내주식 현재가 response body 
 * https://apiportal.koreainvestment.com/apiservice/apiservice-domestic-stock-quotations#L_07802512-4f49-4486-91b4-1050b6f5dc9d
 */
@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class DomesticStockCurrentPriceOutput {
	
	private String iscdStatClsCode; // 종목 상태 구분 코드. 00: 그외 51:관리종목	52:투자의견 53:투자경고 54:투자주의	55:신용가능 57:증거금100% 58:거래정지 59:단기과열
	private String margRate; // 증거금 비율
	private String rprsMrktKorName; // 대표 시장 한글 명 
	private String newHgprLwprClsCode; // 신 고가 저가 구분 코드
	private String bstpKorIsnm; // 업종 한글 종목명
	private String tempStopYn; // 임시 정지 여부
	private String oprcRangContYn; // 시가 범위 연장 여부
	private String clprRangContYn; // 종가 범위 연장 여부
	private String crdtAbleYn; // 신용 가능 여부
	private String grmnRateClsCode; // 보증금 비율 구분 코드 40 : 20%, 30%, 40%	50 : 50% 60 : 60%
	private String elwPblcYn; // ELW 발행 여부
	private String stckPrpr; // 주식 현재가 c
	private String prdyVrss; // 전일 대비 c
	private String prdyVrssSign; // 전일 대비 부호. 1:상한 2:상승 3:보합 4:하한 5:하락
	private String prdyCtrt; // 전일 대비율
	private String acmlTrPbmn; // 누적 거래 대금
	private String acmlVol; // 누적 거래량 c
	private String prdyVrssVolRate; // 전일 대비 거래량 비율. 주식현재가 일자별 API 응답값 사용
	private String stckOprc; // 주식 시가 c
	private String stckHgpr; // 주식 최고가 c
	private String stckLwpr; // 주식 최저가 c
	private String stckMxpr; // 주식 상한가 c
	private String stckLlam; // 주식 하한가 c
	private String stckSdpr; // 주식 기준가 전일 c
    private String wghnAvrgStckPrc;
    private String htsFrgnEhrt;
    private String frgnNtbyQty;
    private String pgtrNtbyQty;
    private String pvtScndDmrsPrc;
    private String pvtFrstDmrsPrc;
    private String pvtPontVal;
    private String pvtFrstDmspPrc;
    private String pvtScndDmspPrc;
    private String dmrsVal;
    private String dmspVal;
    private String cpfn;
    private String rstcWdthPrc;
    private String stckFcam;
    private String stckSspr;
    private String asprUnit;
    private String htsDealQtyUnitVal;
    private String lstnStcn; // 상장주식수 c
    private String htsAvls; // HTS 시가총액 c
    private String per; // 
    private String pbr; // 
    private String stacMonth;
    private String volTnrt;
    private String eps; // c
    private String bps; // c
    private String d250Hgpr;
    private String d250HgprDate;
    private String d250HgprVrssPrprRate;
    private String d250Lwpr;
    private String d250LwprDate;
    private String d250LwprVrssPrprRate;
    private String stckDryyHgpr;
    private String dryyHgprVrssPrprRate;
    private String dryyHgprDate;
    private String stckDryyLwpr;
    private String dryyLwprVrssPrprRate;
    private String dryyLwprDate;
    private String w52Hgpr; // 52주 최고 c
    private String w52HgprVrssPrprCtrt;
    private String w52HgprDate;
    private String w52Lwpr; // 52주 최저 c
    private String w52LwprVrssPrprCtrt;
    private String w52LwprDate;
    private String wholLoanRmndRate;
    private String sstsYn;
    private String stckShrnIscd;
    private String fcamCnnm;
    private String cpfnCnnm;
    private String frgnHldnQty; // 외국인 보유주식수 c
    private String viClsCode;
    private String ovtmViClsCode;
    private String lastSstsCntgQty;
    private String invtCafulYn;
    private String mrktWarnClsCode;
    private String shortOverYn;
    private String sltrYn;
    // 추가
    private String companyCode;
    private String companyName;
    private String type;
    private String acmlTrPbmnMillion; // 백만 c
    
    // 백만단위 절삭 표시
	public String getAcmlTrPbmnMillion() {
		String origin = this.acmlTrPbmn;
		long result = Long.parseLong(origin) / 1_000_000;
		this.acmlTrPbmnMillion = String.valueOf(result);
		return this.acmlTrPbmnMillion;
	}
	
	// 전일 대비 절대값 만들기
	public String getPrdyVrss() {
		int tempAbsVal = Math.abs(Integer.parseInt(this.prdyVrss));
		this.prdyVrss = String.valueOf(tempAbsVal);
		return prdyVrss;
	}
}
