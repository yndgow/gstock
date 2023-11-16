package com.green.greenstock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReady {
	private String tid;
	private String next_redirect_pc_url;
	private String partner_order_id;
	private Date created_at;
}
