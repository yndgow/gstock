package com.green.greenstock.repository.model;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int id;
	private String title;
	private int userId;
	private String userName;
	private String content;
	private Date date;
	private int categoryId;
	private int views;
	private int recommand;
	private int reply;
}
