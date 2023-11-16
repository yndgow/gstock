package com.green.greenstock.controller;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.NoticeUpdateDto;
import com.green.greenstock.repository.model.Noticeboard;
import com.green.greenstock.service.BoardNoticeService;
import com.green.greenstock.service.UserService;
import com.green.greenstock.utils.Pagination;

import lombok.RequiredArgsConstructor;

//공지사항 컨트롤러 생성
@Controller
@RequestMapping(value="/notice")
@RequiredArgsConstructor
public class BoardNoticeController {	

	@Autowired
	private final UserService userService;
	@Autowired
	private final BoardNoticeService boardNoticeService;

	
	/**
	 * 어드민 상태 일때 보이는 공지사항 목록(페이징 기능 추가 ,공개 비공개 추가 )
	 * @param list 
	 * @return adminNoticeList
	 */
	//공지사랑 목록 (어드민)	
	@GetMapping("/admin/list")
	public String adminListNotice(Model model, @RequestParam (defaultValue = "1") int page, String noticeState,
		String noticeTitle){

		//공지사항 글 갯수를 불러오는 부분 	
		int total =  boardNoticeService.noticeListCount(null, noticeTitle);
		Pagination paginaion =  new Pagination(total , page, 10);		
		int offset = paginaion.getStart() -1;		
		List<Noticeboard> listNotice = boardNoticeService.noticeListService(offset, noticeState, noticeTitle);
		model.addAttribute("page", page);
		model.addAttribute("total", total);
		model.addAttribute("pagination",paginaion);
		model.addAttribute("noticeTitle",noticeTitle);
		if(listNotice.isEmpty()) {
			model.addAttribute("noticeList",null);
		}else {
			model.addAttribute("noticeList", listNotice);
		}
		return "notice/admin/adminNoticeList"; 
		
	}

	/**
	 * 
	 * 일반 사용자한태 보여지는 공지사항 목록 페이징 기능 추가 
	 * @param list
	 * @return noticeList
	 */
	//공지사항 목록 리스트(일반)
	 @GetMapping("/list")
	 public String listNotice(Model model, @RequestParam(defaultValue = "1") int page, String noticeTitle){ //공지사항 목록을 불러오는 부분 List<Noticeboard>
		 
		 int total = boardNoticeService.noticeListCount("1", noticeTitle); // 전체글 개수(공개상태, 제목 검색)
		 Pagination paginaion = new Pagination(total, page, 10); // 전체글( 공개상태일때, 페이지,페이지 갯수(파라미터를 int) 
		 int offset = paginaion.getStart() - 1; // start 값이 1 많음		 
		 List<Noticeboard> listNotice = boardNoticeService.noticeListService(offset,"1", noticeTitle); // limit, 0:비공개 1:공개, 제목검색		 	 
		 model.addAttribute("page", page);
		 model.addAttribute("total", total);
		 model.addAttribute("pagination",paginaion);
		 model.addAttribute("noticeTitle", noticeTitle);	
		 model.addAttribute("message", "검색결과가 없습니다");
		 if(listNotice.isEmpty()) {
			 model.addAttribute("noticeList", null);
		 }else {
			 model.addAttribute("noticeList", listNotice);
		 }
		 return "notice/noticeList";
	 }
	 	 

	//공지사항 작성된것을 보내는 주소 
	@GetMapping("/admin/write")
	public String writeNoticeForm() {			
		return "notice/admin/adminNoticeWrite";
	}
	
	//공지사항 작성(받는주소)
	@PostMapping("/admin/write")
	public String writeNotice(Noticeboard noticeboard ) {				
		boardNoticeService.noticeWriteService(noticeboard );		
		return "redirect:/notice/admin/list";
	}
		
	/**
	 *   
	 * 수정할때 페이지로 보내주는 주소(어드민 상태일때만)
	 * @param id
	 * @return adminNoticeUpdate
	 */
	@GetMapping("/admin/update/{id}")
	public String updateNotice(Model model, @PathVariable int id) {
		model.addAttribute("notice", boardNoticeService.noticeViewService(id));		
		return "notice/admin/adminNoticeUpdate";
	}
		
	/**
	 * 
	 * @param  공지사항 수정할때 받는 주소(어드민 상태일때만)
	 * @return
	 */
	//공지사항 수정 받으면 주소 (어드민)
	@PostMapping("/update")
	public String updateNoticeProc(NoticeUpdateDto noticeupdateDto)   {		

		int result = boardNoticeService.noticeUpdateService(noticeupdateDto);				
		return "redirect:/notice/admin/list";
		
	}
	/**
	 * 
	 * @param 공지사항 삭제 기능(어드민 상태만 가능)
	 * @return adminlist
	 */
	//공지사항 삭제(어드민)
	@GetMapping("/admin/delete/{id}")
	public String deleteNotice(@PathVariable int id ) {
		boardNoticeService.noticeDeleteService(id);
		return "redirect:/notice/admin/list";
	}	
	
	/**
	 * @param 공지사항 상세보기(어드민 페이지)
	 * @return adminNoticeView
	 */	
	@GetMapping("/admin/view/{id}")
	public String adminViewNotice(Model model, @PathVariable int id) {		
		model.addAttribute("view", boardNoticeService.noticeViewService(id));			
		return "notice/admin/adminNoticeView";
	}
	
	/**
	 * 
	 * 공지사항 상세보기(일반 페이지)
	 * @param 조회수 추가 
	 * @param id
	 * @return notice/noticeView
	 */		
	@GetMapping("/view/{id}")	
	public String viewNotice(Model model, @PathVariable int id) {
		// 하나의 글 찾기
		Noticeboard noticeboard = boardNoticeService.noticeViewService(id) ;
		// 조회수 증가
		boardNoticeService.noticeHitCountService(id);	
		model.addAttribute("view", noticeboard);		
		return "notice/noticeView";
	}
	

		
}