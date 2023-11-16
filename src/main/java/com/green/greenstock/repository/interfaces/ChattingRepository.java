package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.dto.ChatMessage;
import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.repository.model.User;

@Mapper
public interface ChattingRepository {
	public int subscribe(@Param("companyCode") String companyCode, @Param("userId") int userId);
	public int unSubscribe(@Param("companyCode") String companyCode, @Param("userId") int userId);
	public String subCheck(@Param("companyCode") String companyCode, @Param("userId") int userId);
	public int insertMessage(ChatMessage message);
	public int deleteMessage(int id);
	public List<ChatMessage> selectMessageList(@Param("companyCode") String companyCode, 
											   @Param("userId") int userId, 
											   @Param("roleTypeId") int roleTypeId);
	public User findUserById(int userId);
	public List<User> selectUserListByCode(String companyCode);
	public List<ChattingRoom> selectChatListAll(PagingDto paging);
	public int countChatList(PagingDto paging);
	public List<ChattingRoom> selectChatListNotPaging(User user);
	public List<ChattingRoom> advisorChatList(int userId);
	public int advisorIdToUserId(int advisorId);
	public List<ChattingRoom> myAdvisorChatList(int userId);
	public int lastTimeUpdate(@Param("companyCode") String companyCode, @Param("userId") int userId);
}
