package com.green.greenstock.dto;

import lombok.Data;

@Data
public class PagingDto {
	private int page; // 페이지
	private int recordSize; // 페이지 사이즈
	private int categoryId;
	private String searchWord; // 검색 단어
	private String searchType; // 검색 타입
	private String orderType;
	
	public int getOffset(){
		return (page - 1)*recordSize;
	}

	public PagingDto() {
		this.page = 1;
		this.recordSize = 10;
	}
}
