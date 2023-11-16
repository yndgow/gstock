package com.green.greenstock.dto;

import lombok.Data;

@Data
public class ReplyPagingDto {
	private int boardId;
	private int userId;
	private int page;
	private int recordSize;
	
	public int getOffset(){
		return (page - 1)*recordSize;
	}

	public ReplyPagingDto() {
		this.page = 1;
		this.recordSize = 10;
	}
}
