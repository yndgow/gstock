package com.green.greenstock.dto;

import lombok.Data;

@Data
public class Pagination {
	private int endPage;
	private boolean prev;
	private boolean next;
	private int countData;
	private PagingDto paging;
	
	public Pagination(int countData, PagingDto paging) {
		this.countData= countData;
		this.paging = paging;
		this.endPage = (int) Math.ceil((countData-1)/10)+1;
		
		this.prev = paging.getPage()>5?true:false; // 현재 페이지 5 이상이면 true
		this.next = paging.getPage()<endPage-5?true:false; // endpage 보다 5 이상 작으면 true
	}
}