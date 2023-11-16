package com.green.greenstock.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.greenstock.dto.AdminExpertDTO;
import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.dto.Pagination;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.handler.exception.UnAuthorizedException;
import com.green.greenstock.handler.exception.UnSearchedException;
import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.repository.model.Board;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.BoardService;
import com.green.greenstock.service.ChattingService;
import com.green.greenstock.service.MailSendService;
import com.green.greenstock.service.SuspensionService;
import com.green.greenstock.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final UserService userService;

	private final SuspensionService suspensionService;

	private final MailSendService mailSendService;

	private final BoardService boardService;

	private final ChattingService chattingService;

	@Autowired
	AdvisorRepository advisorRepository;

	@Autowired
	HttpSession session;

	@GetMapping("/main")
	public String AdminMain(Model model) {

		// 접근유저가 권한있는 사용자인지 확인
		if (session.getAttribute("principal") == null) {
			throw new UnAuthorizedException("권한있는 사용자가 아닙니다.", HttpStatus.UNAUTHORIZED);
		}

		User user = (User) session.getAttribute("principal");

		if (user.getRoletypeId() != 0) {
			throw new UnAuthorizedException("권한있는 사용자가 아닙니다.", HttpStatus.UNAUTHORIZED);
		}

		// 유저 테이블 가져오기
		List<User> userList = userService.findAdminMainUserList();
		model.addAttribute("userList", userList);
		
		// 구독자 차트
		LocalDate currentDate = LocalDate.now();
        int currentMonth = currentDate.getMonthValue();
        log.info("currentMonth : " + currentMonth);
        List<Integer> months = new ArrayList<>();
        for(int i=5; i>=0; i--) {
        	months.add(currentMonth-i);
        	log.info("" + (currentMonth-i));
        }
        log.info(months.toString());
        List<Integer> countSubUserList = userService.countSubUser(currentMonth);
        log.info(countSubUserList.toString());
        model.addAttribute("months", months);
        model.addAttribute("countSubUserList", countSubUserList);
        
		// board 가져오기
		PagingDto paging = new PagingDto();
		List<Board> boardList = boardService.selectBoardSearchList(paging);
		List<Board> subBoardList = boardList.subList(0, 10);
		List<String> cate = boardService.findCategoryList();

		model.addAttribute("boardList", subBoardList);
		model.addAttribute("cate", cate);

		return "admin/adminMain";
	}

	@GetMapping("/user")
	public String AdminUser(Model model, PagingDto paging) {
		List<User> userList = userService.findAllUser(paging);
		int total = userService.countUser();
		Pagination pagination = new Pagination(total, paging);
		model.addAttribute("userList", userList);
		model.addAttribute("page", pagination);
		return "admin/adminUser";
	}

	@PostMapping("/suspended")
	public String suspendedUser(String userName, Integer suspendDate) {
		suspensionService.suspendUser(userName, suspendDate);
		try {
			mailSendService.sendSuspensionMessage(userName, suspendDate);
			log.info("메일발송 성공");
		} catch (Exception e) {
			log.info("메일발송 실패");
			e.printStackTrace();
		}
		return "redirect:/admin/user";
	}

	@GetMapping("/search-user")
	public String searchUser(String search, PagingDto paging, Model model) {
		List<User> userList = userService.findSearchUser(search, paging);
		if (userList.isEmpty()) {
			throw new UnSearchedException("해당 유저가 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
		}
		Pagination pagination = new Pagination(1, paging);
		model.addAttribute("userList", userList);
		model.addAttribute("page", pagination);
		return "admin/adminUser";
	}

	@GetMapping("/board")
	public String adminBoard(PagingDto paging, Model model) {
		List<String> cate = boardService.findCategoryList();
		List<Board> list = boardService.selectBoardSearchList(paging);
		int total = boardService.selectBoardCount(paging);
		Pagination pagination = new Pagination(total, paging);

		model.addAttribute("cate", cate);
		model.addAttribute("list", list);
		model.addAttribute("page", pagination);
		model.addAttribute("paging", paging);
		return "admin/adminBoard";
	}

	@PostMapping("/board-delete")
	public String boardDelete(Board board, HttpServletRequest request) {
		boardService.deleteBoard(board, request);
		return "redirect:/admin/board";
	}

	@GetMapping("/chat")
	public String adminChatList(PagingDto paging, Model model) {
		List<ChattingRoom> list = chattingService.selectChatListAll(paging);
		int total = chattingService.countChatList(paging);
		Pagination pagination = new Pagination(total, paging);

		model.addAttribute("page", pagination);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		return "admin/adminChatList";
	}

	@PostMapping("/chat-delete")
	public String chatDelete(int id, String code, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("principal");
		int userId = user.getId();
		if (user.getRoletypeId() != 0) {
			throw new UnAuthorizedException("권한있는 사용자가 아닙니다.", HttpStatus.UNAUTHORIZED);
		} else {
			chattingService.deleteMessage(id);
		}
		return "redirect:/chat?companyCode=" + code + "&userId=" + userId;
	}

	/*
	 * 전문가 등급 관리
	 */
	// 신청 목록 페이지
	@GetMapping("/advisor")
	public String adminAdvisorList() {
		return "advisor/adminAdvisorList";
	}

	// 심사중 기능
	@GetMapping("/expert/{status}/page/{page}")
	public String expert(Model model, @PathVariable int status, @PathVariable int page) {
		List<AdminExpertDTO> dtoList = advisorRepository.findAllInfoByStatus(status);
		PagingDto paging = new PagingDto();
		paging.setRecordSize(10);
		paging.setPage(page);
		List<List<AdminExpertDTO>> paginatedList = IntStream.range(0, (dtoList.size() + 10 - 1) / 10)
				.mapToObj(i -> dtoList.subList(i * 10, Math.min((i + 1) * 10, dtoList.size())))
				.collect(Collectors.toList());
		List<AdminExpertDTO> list = paginatedList.get(page - 1);
		int total = dtoList.size();
		Pagination pagination = new Pagination(total, paging);
		dtoList.forEach(e -> e.setImgName(e.getImgName().replace("\\", "/")));
		model.addAttribute("status",status);
		model.addAttribute("page", pagination);
		model.addAttribute("paging", paging);
		model.addAttribute("expertList", list);
		return "/admin/adminExpert";
	}
	// 심사완료 등급업 기능
	// 전문가 이력 추가 페이지
	// 전문가 이력 추가 기능
	// 전문가 이력 관리 페이지
	// 전문가 이력 관리 기능

}
