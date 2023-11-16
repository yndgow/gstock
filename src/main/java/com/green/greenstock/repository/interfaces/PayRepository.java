package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.repository.model.Pay;
import com.green.greenstock.repository.model.PaySubscribe;

@Mapper
public interface PayRepository {
	public int insertPayInfo(Pay pay);

	public int modifyPayInfo(Pay pay);

	public Pay findPayInfoById(Integer id);

	public void deletePaySubscribe(String tid);

	public int insertPaySubscribeInfo(PaySubscribe paySubscribe);

	public Pay findPayInfoByTid(String tid);
}
