package com.green.greenstock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class InquireMemberResDto {

    private String selnMbcrNo1; // 매도 회원사 번호1
    private String selnMbcrNo2; // 매도 회원사 번호2
    private String selnMbcrNo3; // 매도 회원사 번호3
    private String selnMbcrNo4; // 매도 회원사 번호4
    private String selnMbcrNo5; // 매도 회원사 번호5
    private String selnMbcrName1; // 매도 회원사 명1
    private String selnMbcrName2; // 매도 회원사 명2
    private String selnMbcrName3; // 매도 회원사 명3
    private String selnMbcrName4; // 매도 회원사 명4
    private String selnMbcrName5; // 매도 회원사 명5
    private String totalSelnQty1; // 총 매도 수량1
    private String totalSelnQty2; // 총 매도 수량2
    private String totalSelnQty3; // 총 매도 수량3
    private String totalSelnQty4; // 총 매도 수량4
    private String totalSelnQty5; // 총 매도 수량5
    private String selnMbcrRlim1; // 매도 회원사 비중1
    private String selnMbcrRlim2; // 매도 회원사 비중2
    private String selnMbcrRlim3; // 매도 회원사 비중3
    private String selnMbcrRlim4; // 매도 회원사 비중4
    private String selnMbcrRlim5; // 매도 회원사 비중5
    private String selnQtyIcdc1; // 매도 수량 증감1
    private String selnQtyIcdc2; // 매도 수량 증감2
    private String selnQtyIcdc3; // 매도 수량 증감3
    private String selnQtyIcdc4; // 매도 수량 증감4
    private String selnQtyIcdc5; // 매도 수량 증감5
    private String shnuMbcrNo1; // 매수2 회원사 번호1
    private String shnuMbcrNo2; // 매수2 회원사 번호2
    private String shnuMbcrNo3; // 매수2 회원사 번호3
    private String shnuMbcrNo4; // 매수2 회원사 번호4
    private String shnuMbcrNo5; // 매수2 회원사 번호5
    private String shnuMbcrName1; // 매수2 회원사 명1
    private String shnuMbcrName2; // 매수2 회원사 명2
    private String shnuMbcrName3; // 매수2 회원사 명3
    private String shnuMbcrName4; // 매수2 회원사 명4
    private String shnuMbcrName5; // 매수2 회원사 명5
    private String totalShnuQty1; // 총 매수2 수량1
    private String totalShnuQty2; // 총 매수2 수량2
    private String totalShnuQty3; // 총 매수2 수량3
    private String totalShnuQty4; // 총 매수2 수량4
    private String totalShnuQty5; // 총 매수2 수량5
    private String shnuMbcrRlim1; // 매수2 회원사 비중1
    private String shnuMbcrRlim2; // 매수2 회원사 비중2
    private String shnuMbcrRlim3; // 매수2 회원사 비중3
    private String shnuMbcrRlim4; // 매수2 회원사 비중4
    private String shnuMbcrRlim5; // 매수2 회원사 비중5
    private String shnuQtyIcdc1; // 매수2 수량 증감1
    private String shnuQtyIcdc2; // 매수2 수량 증감2
    private String shnuQtyIcdc3; // 매수2 수량 증감3
    private String shnuQtyIcdc4; // 매수2 수량 증감4
    private String shnuQtyIcdc5; // 매수2 수량 증감5
    private String globTotalSelnQty; // 외국계 총 매도 수량
    private String globSelnRlim; // 외국계 매도 비중
    private String globNtbyQty; // 외국계 순매수 수량
    private String globTotalShnuQty; // 외국계 총 매수2 수량
    private String globShnuRlim; // 외국계 매수2 비중
    @JsonProperty("seln_mbcr_glob_yn_1")
    private String selnMbcrGlobYn1; // 매도 회원사 외국계 여부1
    @JsonProperty("seln_mbcr_glob_yn_2")
    private String selnMbcrGlobYn2; // 매도 회원사 외국계 여부2
    @JsonProperty("seln_mbcr_glob_yn_3")
    private String selnMbcrGlobYn3; // 매도 회원사 외국계 여부3
    @JsonProperty("seln_mbcr_glob_yn_4")
    private String selnMbcrGlobYn4; // 매도 회원사 외국계 여부4
    @JsonProperty("seln_mbcr_glob_yn_5")
    private String selnMbcrGlobYn5; // 매도 회원사 외국계 여부5

    @JsonProperty("shnu_mbcr_glob_yn_1")
    private String shnuMbcrGlobYn1; // 매수2 회원사 외국계 여부1
    @JsonProperty("shnu_mbcr_glob_yn_2")
    private String shnuMbcrGlobYn2; // 매수2 회원사 외국계 여부2
    @JsonProperty("shnu_mbcr_glob_yn_3")
    private String shnuMbcrGlobYn3; // 매수2 회원사 외국계 여부3
    @JsonProperty("shnu_mbcr_glob_yn_4")
    private String shnuMbcrGlobYn4; // 매수2 회원사 외국계 여부4
    @JsonProperty("shnu_mbcr_glob_yn_5")
    private String shnuMbcrGlobYn5; // 매수2 회원사 외국계 여부5
    private String globTotalSelnQtyIcdc; // 외국계 총 매도 수량 증감
    private String globTotalShnuQtyIcdc; // 외국계 총 매수2 수량 증감
    private String acmlVol; // 누적 거래량
}
