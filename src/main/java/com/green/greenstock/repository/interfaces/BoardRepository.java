package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.repository.model.Board;

@Mapper
public interface BoardRepository {

	public List<String> findCategoryList();
	public int insertBoard(Board board);
	public int selectBoardCount(PagingDto paging);
	public Board selectBoardById(int id);
	public int updateBoard(Board board);
	public int deleteBoard(Board board);
	public List<Board> selectBoardSearchList(PagingDto paging);
	public int viewCountUp(int boardId);
	public int thumbUp(@Param("boardId") int boardId,@Param("userId") int userId);
	public int thumbDelete(@Param("boardId") int boardId,@Param("userId") int userId);
	public int thumbCheck(@Param("boardId") int boardId,@Param("userId") int userId);
	public int countMyBoard(int userId);
}
