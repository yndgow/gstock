package com.green.greenstock.dto;

import lombok.Data;

@Data
public class BoardSearchDto {
	private int categoryId;
	private String searchType;
	private String searchWord;
	private String orderType;
	private PagingDto paging;
	public int getOffset(){
		return (paging.getPage() - 1)*10;
	}
}
