package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.dto.ReplyPagingDto;
import com.green.greenstock.repository.model.Reply;

@Mapper
public interface ReplyRepository {
	public List<Reply> selectReplyList(ReplyPagingDto paging);
	public int selectReplyCount(int boardId);
	public int selectMaxRef(int boardId);
	public int getStep(Reply reply);
	public int maxStep(Reply reply);
	public int updateReply(Reply reply);
	public int insertReply(Reply reply);
	public int deleteReply(Reply reply);
	public int deleteReplyRecommand(Reply reply);
	public int replyThumbCheck(@Param("replyId") int replyId,@Param("userId") int userId);
	public int replyThumbUp(@Param("replyId") int replyId,@Param("userId") int userId);
	public int replyThumbDelete(@Param("replyId") int replyId,@Param("userId") int userId);
	public int getReplyCount(int replyId);
	public List<Integer> replyUserCheck(@Param("userId") int userId, @Param("boardId") int boardId);
	public List<Reply> selectMyReply(ReplyPagingDto paging);
	public int countMyReply(int userId);
}
