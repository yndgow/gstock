package com.green.greenstock.utils;

import lombok.Data;

@Data
public class Pagination {

	private int totalCount;
	private int start;
	private int end;
	private int currentPage;
	private boolean nextPageGroup;
	private boolean prevPageGroup;
	private int currentPageGroup;
	private int startPageGroup;
	private int endPageGroup;
	
	// 한페이지에 글 10개, 페이지 그룹크기는 5
	public Pagination(int totalCount, int currentPage, int perPageGroup) {
		this.start = ((currentPage - 1) * 10) + 1;
		this.end = totalCount < (currentPage * 10) ? totalCount : (currentPage * 10);
		int totalPageGroup = (int) Math.ceil(totalCount / 10.0);
		this.currentPageGroup = (int)Math.ceil(currentPage / (double)perPageGroup);
		this.nextPageGroup = (totalPageGroup > perPageGroup) && (totalPageGroup > (currentPageGroup)  * perPageGroup);
		this.prevPageGroup = (totalPageGroup > perPageGroup) && (currentPageGroup > 1);
		this.startPageGroup = ((currentPageGroup - 1) * perPageGroup) + 1;
		this.endPageGroup = (totalCount / 10) < (currentPageGroup * perPageGroup) ? totalPageGroup : (currentPageGroup * perPageGroup);
		this.totalCount = totalCount;
		this.currentPage = currentPage;
	}
	
}
