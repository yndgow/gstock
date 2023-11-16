package com.green.greenstock.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.repository.interfaces.BoardRepository;
import com.green.greenstock.repository.model.Board;
import com.green.greenstock.repository.model.User;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	public List<String> findCategoryList(){
		return boardRepository.findCategoryList();
	}
	
	public int insertBoard(Board board, HttpServletRequest request) {
		HttpSession session = (HttpSession) request.getSession();
		User user = (User) session.getAttribute("principal");
		if(user==null) {
			throw new CustomRestfulException("로그인이 필요한 서비스입니다", HttpStatus.BAD_REQUEST);
		}
		return boardRepository.insertBoard(board); 
	}
	public int selectBoardCount(PagingDto paging) {
		return boardRepository.selectBoardCount(paging);
	}
	
	public Board selectBoardById(int id) {
		return boardRepository.selectBoardById(id);
	}

	public int updateBoard(Board board, HttpServletRequest request) {
		HttpSession session = (HttpSession) request.getSession();
		User user = (User) session.getAttribute("principal");
		if(user==null) {
			throw new CustomRestfulException("로그인이 필요한 서비스입니다", HttpStatus.BAD_REQUEST);
		}else if(board.getUserId()!=user.getId()) {
			throw new CustomRestfulException("해당정보의 유저가 없습니다.", HttpStatus.BAD_REQUEST);
		}
		return boardRepository.updateBoard(board);
	}
	
	public int deleteBoard(Board board, HttpServletRequest request) {
		HttpSession session = (HttpSession) request.getSession();
		User user = (User) session.getAttribute("principal");
		if(user==null) {
			throw new CustomRestfulException("로그인이 필요한 서비스입니다", HttpStatus.BAD_REQUEST);
		}else if(board.getUserId()!=user.getId()&&user.getRoletypeId()!=0) {
			System.out.println(board.getUserId()+","+user.getId());
			throw new CustomRestfulException("유저 정보가 일치하지 않습니다", HttpStatus.BAD_REQUEST);
		}
		return boardRepository.deleteBoard(board);
	}
	
	public List<Board> selectBoardSearchList(PagingDto paging){
		return boardRepository.selectBoardSearchList(paging);
	}
	
	public int viewCountUp(int boardId) {
		return boardRepository.viewCountUp(boardId);
	}
	
	public int thumbUp(int boardId, int userId) {
		return boardRepository.thumbUp(boardId, userId);
	}
	public int thumbDelete(int boardId, int userId) {
		return boardRepository.thumbDelete(boardId, userId);
	}
	public int thumbCheck(int boardId, int userId) {
		return boardRepository.thumbCheck(boardId, userId);
	}
	
	public void viewCountUpFnc(int boardId, HttpServletRequest request, HttpServletResponse response) {

	    Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }
	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + boardId + "]")) {
	            viewCountUp(boardId);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + boardId + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60); // test - 1분으로 설정
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	viewCountUp(boardId);
	        Cookie newCookie = new Cookie("postView","[" + boardId + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60); // test - 1분으로 설정
	        response.addCookie(newCookie);
	    }
	}
	public int countMyBoard(int userId) {
		return boardRepository.countMyBoard(userId);
	}
}
