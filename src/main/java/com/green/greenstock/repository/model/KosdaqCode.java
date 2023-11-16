package com.green.greenstock.repository.model;

import java.time.LocalDate;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/*
 * https://github.com/koreainvestment/open-trading-api/blob/main/stocks_info/%EC%A2%85%EB%AA%A9%EB%A7%88%EC%8A%A4%ED%84%B0%EC%A0%95%EB%B3%B4(%EC%BD%94%EC%8A%A4%EB%8B%A5).h
 */

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class KosdaqCode {

	private String mkscShrnIscd;
	private String htsKorIsnm;

}
