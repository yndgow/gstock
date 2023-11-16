package com.green.greenstock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.Pagination;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.dto.ReplyPagination;
import com.green.greenstock.dto.ReplyPagingDto;
import com.green.greenstock.repository.model.Board;
import com.green.greenstock.repository.model.Reply;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.BoardService;
import com.green.greenstock.service.ReplyService;


@Controller
@RequestMapping(value="/board", method = {RequestMethod.GET, RequestMethod.POST})
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/write")
	public String boardWrite(Model model) {
		List<String> cate = boardService.findCategoryList();
		model.addAttribute("cate", cate);
		return "board/board-write";
	}
	@PostMapping("/board-write")
	public String postBoardWrite(Board board, HttpServletRequest request) {
		boardService.insertBoard(board, request);
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String boardList(PagingDto paging, Model model) {
		List<String> cate = boardService.findCategoryList();
		List<Board> list = boardService.selectBoardSearchList(paging);
		int total = boardService.selectBoardCount(paging);
		Pagination pagination = new Pagination(total, paging);
		
		model.addAttribute("cate", cate);
		model.addAttribute("list", list);
		model.addAttribute("page", pagination);
		model.addAttribute("paging", paging);
		return "board/board-list";
	}
	
	
	@GetMapping("/detail")
	public String boardDetail(ReplyPagingDto paging, HttpServletRequest request,HttpServletResponse response, Model model) {
		
		List<String> cate = boardService.findCategoryList();
		Board board = boardService.selectBoardById(paging.getBoardId());
		List<Reply> reply = replyService.selectReplyList(paging);
		int maxRef = replyService.selectMaxRef(paging.getBoardId());
		int totalReply = replyService.selectReplyCount(paging.getBoardId());
		ReplyPagination pagination = new ReplyPagination(totalReply, paging);
		
		model.addAttribute("cate", cate);
		model.addAttribute("board", board);
		model.addAttribute("reply", reply);
		model.addAttribute("maxRef", maxRef);
		model.addAttribute("page", pagination);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("principal");
		if(user!=null) {
			int thumb = boardService.thumbCheck(paging.getBoardId(), user.getId());
			List<Integer> replyUser = replyService.replyUserCheck(user.getId(), paging.getBoardId());
			
			model.addAttribute("thumb", thumb);
			model.addAttribute("replyUser",replyUser);
		}else {
			model.addAttribute("replyUser",'0');
		}
		
		boardService.viewCountUpFnc(paging.getBoardId(), request, response);
		
		return "board/board-detail";
	}
	
	@GetMapping("/update/{id}")
	public String boardUpdate(@PathVariable("id") int boardId, Model model) {
		
		List<String> cate = boardService.findCategoryList();
		Board board = boardService.selectBoardById(boardId);
		
		model.addAttribute("cate", cate);
		model.addAttribute("board", board);
		return "board/board-update";
	}
	
	@PostMapping("/board-update")
	public String postBoardUpdate(Board board, HttpServletRequest request) {
		boardService.updateBoard(board, request);
		return "redirect:list";
	}
	@PostMapping("/board-delete")
	public String boardDelete(Board board, HttpServletRequest request) {
		boardService.deleteBoard(board, request);
		return "redirect:/board/list";
	}

	@PostMapping("/reply-write")
	public String postReplyWrite(Reply reply) {
		int step = replyService.getStep(reply);
		if(step==0) {
			replyService.updateReply(reply);
		}else {
			int maxStep = replyService.maxStep(reply);
			reply.setStep(maxStep);
			replyService.updateReply(reply);
		}
		replyService.insertReply(reply);
		int boardId = reply.getBoardId();
		return "redirect:detail?boardId="+boardId;
	}
	@GetMapping("/reply-delete")
	public String postReplyDelete(Reply reply) {
		replyService.deleteReply(reply);
		replyService.deleteReplyRecommand(reply);
		int boardId = reply.getBoardId();
		return "redirect:detail?boardId="+boardId;
	}
	
	@GetMapping("/thumb-check")
	@ResponseBody
	public int thumbCheck(int boardId, int userId) {
		int check = boardService.thumbCheck(boardId, userId);
		if(check==0) {
			boardService.thumbUp(boardId, userId);
			check = 1;
		}else {
			boardService.thumbDelete(boardId, userId);
			check = 0;
		}
		return check;
	}
	@GetMapping("/reply-thumb-check")
	@ResponseBody
	public int replyThumbCheck(int replyId, int userId) {
		int check = replyService.replyThumbCheck(replyId, userId);
		if(check==0) {
			replyService.replyThumbUp(replyId, userId);
			check = 1;
		}else {
			replyService.replyThumbDelete(replyId, userId);
			check = 0;
		}
		return check;
	}
	@GetMapping("/get-reply-count")
	@ResponseBody
	public int getReplyCount(int replyId) {
		int count = replyService.getReplyCount(replyId);
		return count;
	}
}
