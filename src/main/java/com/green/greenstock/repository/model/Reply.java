package com.green.greenstock.repository.model;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	private int id;
	private int boardId;
	private int userId;
	private int parentId;
	private String userName;
	private String content;
	private Date date;
	private int recommand;
	private int ref; // 댓글 순서
	private int step; // 대댓 순서
	private int level; // 들여쓰기
	private int deleted;
}
