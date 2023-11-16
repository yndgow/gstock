package com.green.greenstock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.ReplyPagingDto;
import com.green.greenstock.repository.interfaces.ReplyRepository;
import com.green.greenstock.repository.model.Reply;

@Service
public class ReplyService {

	@Autowired
	private ReplyRepository replyRepository;

	public List<Reply> selectReplyList(ReplyPagingDto paging) {
		return replyRepository.selectReplyList(paging);
	}
	
	public int selectReplyCount(int boardId) {
		return replyRepository.selectReplyCount(boardId);
	}

	public int selectMaxRef(int boardId) {
		return replyRepository.selectMaxRef(boardId);
	}
	
	public int getStep(Reply reply) {
		return replyRepository.getStep(reply);
	}
	
	public int maxStep(Reply reply) {
		return replyRepository.maxStep(reply);
	}

	public int updateReply(Reply reply) {
		return replyRepository.updateReply(reply);
	}

	public int insertReply(Reply reply) {
		return replyRepository.insertReply(reply);
	}
	
	public int deleteReply(Reply reply) {
		return replyRepository.deleteReply(reply);
	}
	public int deleteReplyRecommand(Reply reply) {
		return replyRepository.deleteReplyRecommand(reply);
	}
	
	public int replyThumbCheck(int replyId, int userId) {
		return replyRepository.replyThumbCheck(replyId, userId);
	}
	public int replyThumbUp(int replyId, int userId) {
		return replyRepository.replyThumbUp(replyId, userId);
	}
	public int replyThumbDelete(int replyId, int userId) {
		return replyRepository.replyThumbDelete(replyId, userId);
	}
	public int getReplyCount(int replyId) {
		return replyRepository.getReplyCount(replyId);
	}
	public List<Integer> replyUserCheck(int userId, int boardId) {
		return replyRepository.replyUserCheck(userId, boardId);
	}
	public List<Reply> selectMyReply(ReplyPagingDto paging){
		return replyRepository.selectMyReply(paging);
	}
	public int countMyReply(int userId) {
		return replyRepository.countMyReply(userId);
	}
}
