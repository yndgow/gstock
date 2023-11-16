package com.green.greenstock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class DomesticStockVolumeRankOutPut {

	private String htsKorIsnm; // HTS 한글 종목명
	private String mkscShrnIscd; // 유가증권 단축 종목코드
	private String dataRank; // 데이터 순위
	private String stckPrpr; // 주식 현재가
	private String prdyVrssSign; // 전일 대비 부호
	private String prdyVrss; // 전일 대비
	private String prdyCtrt; // 전일 대비율
	private String acmlVol; // 누적 거래량
	private String prdyVol; // 전일 거래량
	private String lstnStcn; // 상장 주수
	private String avrgVol; // 평균 거래량
	@JsonProperty("n_befr_clpr_vrss_prpr_rate")
	private String nBefrClprVrssPrprRate; // N일전종가대비현재가대비율
	private String volInrt; // 거래량증가율
	private String volTnrt; // 거래량 회전율
	private String ndayVolTnrt; // N일 거래량 회전율
	private String avrgTrPbmn; // 평균 거래 대금
	private String trPbmnTnrt; // 거래대금회전율
	private String ndayTrPbmnTnrt; // N일 거래대금 회전율
	private String acmlTrPbmn; // 누적 거래 대금

}
