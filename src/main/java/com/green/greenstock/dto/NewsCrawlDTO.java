package com.green.greenstock.dto;

import lombok.Data;

@Data
public class NewsCrawlDTO {
	private String thumb;
	private String ahref;
	private String subject;
	private String summary;
	private String company;
	private String regdate;
}
