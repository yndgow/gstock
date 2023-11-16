package com.green.greenstock.repository.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Pay {
	private Integer id;
	//요청 고유번호
	private String aid;
	//결제 고유번호
	private String tid;
	//가맹점 코드
	private String cid;
	//정기결제용 ID
	private String sid;
	//상품명
	private String itemName;
	//결제 총액
	private int amountTotal;
	private Date createdAt;
	//결제 승인 시각
	private Date approvedAt;
	private int userId;
}
