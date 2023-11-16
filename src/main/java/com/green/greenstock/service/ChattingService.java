package com.green.greenstock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.ChatMessage;
import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.repository.interfaces.ChattingRepository;
import com.green.greenstock.repository.model.User;

@Service
public class ChattingService {
	
	@Autowired
	ChattingRepository chattingRepository;
	
	public int subscribe(String companyCode, int userId) {
		return chattingRepository.subscribe(companyCode, userId);
	}
	
	public int unSubscribe(String companyCode, int userId) {
		return chattingRepository.unSubscribe(companyCode, userId);
	}
	
	public String subCheck(String companyCode, int userId) {
		String res = chattingRepository.subCheck(companyCode, userId);
		return res;
	}
	
	public int insertMessage(ChatMessage message) {
		return chattingRepository.insertMessage(message);
	}
	
	public int deleteMessage(int id) {
		return chattingRepository.deleteMessage(id);
	}

	public List<ChatMessage> selectMessageList(String companyCode, int userId, int roleTypeId) {
		return chattingRepository.selectMessageList(companyCode, userId, roleTypeId);
	}
	
	public User findUserById(int userId) {
		return chattingRepository.findUserById(userId);
	}
	
	public List<User> selectUserListByCode(String companyCode){
		return chattingRepository.selectUserListByCode(companyCode);
	}
	
	public List<ChattingRoom> selectChatListAll(PagingDto paging) {
		return chattingRepository.selectChatListAll(paging);
	}
	
	public int countChatList(PagingDto paging) {
		return chattingRepository.countChatList(paging);
	}
	
	public List<ChattingRoom> selectChatListNotPaging(User user) {
		return chattingRepository.selectChatListNotPaging(user);
	}
	
	public List<ChattingRoom> advisorChatList(int userId) {
		return chattingRepository.advisorChatList(userId);
	}
	
	public int advisorIdToUserId(int advisorId) {
		return chattingRepository.advisorIdToUserId(advisorId);
	}
	
	public List<ChattingRoom> myAdvisorChatList(int userId) {
		return chattingRepository.myAdvisorChatList(userId);
	}

	public int lastTimeUpdate(String companyCode, int userId) {
		return chattingRepository.lastTimeUpdate(companyCode, userId);
	}
}
