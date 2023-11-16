package com.green.greenstock.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.GoogleProfile;
import com.green.greenstock.dto.KakaoProfile;
import com.green.greenstock.dto.NaverResponse;
import com.green.greenstock.dto.Pagination;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.dto.ReplyPagination;
import com.green.greenstock.dto.ReplyPagingDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.handler.exception.UnAuthorizedException;
import com.green.greenstock.repository.model.Board;
import com.green.greenstock.repository.model.Pay;
import com.green.greenstock.repository.model.PaySubscribe;
import com.green.greenstock.repository.model.Reply;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.BoardService;
import com.green.greenstock.service.MailSendService;
import com.green.greenstock.service.ReplyService;
import com.green.greenstock.service.SocialLoginService;
import com.green.greenstock.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;
	
	private final MailSendService mailSendService;
	
	private final SocialLoginService socialLoginServiceImpl;
	
	private final ReplyService replyService;
	
	private final BoardService boardService;
	@Autowired
	HttpSession session;

	// 구글로그인 관련 값
	private final String GOOGLE_TOKEN_URL = "https://oauth2.googleapis.com/token";
	private final String GOOGLE_API_URL = "https://www.googleapis.com/oauth2/v1/userinfo";
	// 네이버로그인 관련 값
	private final String NAVER_TOKEN_URL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	private final String NAVER_API_URL = "https://openapi.naver.com/v1/nid/me";
	// 카카오로그인 관련 값
	private final String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	private final String KAKAO_API_URL = "https://kapi.kakao.com/v2/user/me";
	
	@GetMapping("/sign-in")
	public String SignIn() {
		return "user/signIn";
	}

	@PostMapping("/sign-in")
	public ResponseEntity<Integer> SignInProc(User user) {
		User principal = userService.findUserByUserName(user);
		if (principal == null) {
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}
		if (principal.getSuspensionEndDate() != null) {
			return ResponseEntity.status(HttpStatus.OK).body(500);
		}
		principal.setPassword(null);
		session.setAttribute("principal", principal);
		return ResponseEntity.status(HttpStatus.OK).body(200);
	}

	@GetMapping("/sign-up")
	public String SignUp() {
		return "user/signUp";
	}

	@PostMapping("/sign-up")
	public String SignUpProc(User user) {
		if(user.getUserName() == null || user.getUserName().isEmpty()) {
			throw new CustomRestfulException("username을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getPassword() == null || user.getPassword().isEmpty()) {
			throw new CustomRestfulException("password을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getEmail() == null || user.getEmail().isEmpty()) {
			throw new CustomRestfulException("email을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getTel() == null || user.getTel().isEmpty()) {
			throw new CustomRestfulException("전화번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getBirthDate() == null) {
			throw new CustomRestfulException("생년월일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		userService.insertUser(user);
		return "user/signIn";
	}
	
	@GetMapping("/sign-out")
	public String SignOut() {
		session.invalidate();
		return "redirect:/user/sign-in";
	}
	
	@GetMapping("/findIdPw")
	public String FindIdPw() {
		return "user/findIdPw";
	}
	
	@PostMapping("/find-id")
	@ResponseBody
	String FindId(@RequestParam("email") String email) throws Exception {
		
		if(email == null || email.isEmpty()) {
			throw new CustomRestfulException("E-mail 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		log.info("아이디찾기 이메일 전송 컨트롤러 실행");
		
		//이메일정보로 유저찾기
		User user = userService.findUserFromEmail(email);
		
		log.info("이메일 유저정보 조회");
		if(user != null) {
			String code = mailSendService.sendUserId(email, user);
			log.info("유저아이디 : " + code);
		    return code;
		} else {
			//오류처리
			log.info("이메일로 유저찾기 실패"); 
			return null;
		}
		
	}
	
	@PostMapping("/find-pw")
	@ResponseBody
	String FindPw(@RequestParam("email") String email, @RequestParam("username") String username) throws Exception {
		
		if(email == null || email.isEmpty()) {
			throw new CustomRestfulException("E-mail 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(username == null || username.isEmpty()) {
			throw new CustomRestfulException("ID를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		
		log.info("비번찾기 이메일 전송 컨트롤러 실행");
		
		//이메일정보로 유저찾기
		User user = userService.findUserFromEmail(email);
		
		if(user.getUserName().equals(username)) {
			log.info("이메일 유저정보 조회");
			String code = mailSendService.sendSimpleMessage(email);
			log.info("인증코드 : " + code);
			return code;
		} else {
			//오류처리
			log.error("일치하는 유저가 없습니다.");
			return null;
		}
	}
	
	@PostMapping("/modify-pw")
	public String ModifyPw(User principal) {
		User user = userService.findUserName(principal.getUserName());
		user.setPassword(principal.getPassword());
		userService.modifyPw(user);
		return "user/signIn";
	}

	@PostMapping("/duplicate-check")
	public ResponseEntity<Integer> DuplicateCheck(@RequestParam("username") String username) {
		if (userService.findUserName(username) != null) {
			log.info("중복채크 실패");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		} else {
			log.info("중복채크 성공");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}

	// 구글 소셜 로그인
	@GetMapping("/google/callback")
	public String GoogleCallback(@RequestParam String code) {
		
		String type = "Google";
		
		log.info("구글 로그인 컨트롤러 실행");
		log.info("구글 로그인 콜백메서드 동작");
		log.info("구글 인가 코드 확인 : " + code);
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("code", code);
		params.add("client_id", "274947516179-mp9dq1e2lmf62hj46urhg6e30mn29q0u.apps.googleusercontent.com");
		params.add("client_secret", "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");
		params.add("redirect_uri", "http://localhost/user/google/callback");
		params.add("grant_type", "authorization_code");

		//accessToken 받아오기
		String accessToken = socialLoginServiceImpl.getAccessToken(params, GOOGLE_TOKEN_URL, type);

		//userInfo 받아오기
		GoogleProfile userInfo = (GoogleProfile)(socialLoginServiceImpl.getUserInfo(accessToken, type, GOOGLE_API_URL));

		//기존유저이면 그냥 세션등록 신규유저면 가입후 세션등록
		if (userInfo != null) {

			User oldUser = userService.findUserName(userInfo.getFamilyName() + userInfo.getGivenName());

			// 첫번째 구글로그인
			if (oldUser == null) {
				Date date = Date.valueOf("3000-01-01");

				User user = User.builder().userName(userInfo.getFamilyName() + userInfo.getGivenName())
						.password("google").tel("010-000-0000").birthDate((date))
						.regDate(Timestamp.valueOf(LocalDateTime.now())).build();

				userService.insertUser(user);
				oldUser = userService.findUserName(user.getUserName());
			}
			log.info("user : " + oldUser);
			// 기존 이용자
			session.setAttribute("principal", oldUser);
			session.setAttribute("isGoogle", true);

			log.info("Google : session 등록확인");
		}

		return "redirect:/main";
	}

	// 네이버 소셜 로그인
	@GetMapping("/naver/callback")
	public String NaverCallback(@RequestParam String code) throws UnsupportedEncodingException {
		log.info("네이버 로그인 컨트롤러 실행");
		log.info("네이버 로그인 콜백메서드 동작");
		log.info("네이버 인가 코드 확인 : " + code);

		String clientId = "4QL7qRNsZX0v8r2aJUDp";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "pJI4Gx3AEY";
		String redirectURI = URLEncoder.encode("http://localhost/user/naver/callback", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String type = "Naver";

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("client_id", clientId);
		params.add("client_secret", clientSecret);
		params.add("redirect_uri", redirectURI);
		params.add("code", code);
		params.add("state", state);
		
		String accessToken = socialLoginServiceImpl.getAccessToken(params, NAVER_TOKEN_URL, type);
		
		NaverResponse naverUser = (NaverResponse)socialLoginServiceImpl.getUserInfo(accessToken, type, NAVER_API_URL);

		if (naverUser != null) {

		    User oldUser = userService.findUserName(naverUser.getName());

		    //첫번째 네이버로그인 
		    if(oldUser == null) { 
				log.info("기존유저가 아니므로 회원가입 진행");
		    	Date date =	Date.valueOf(naverUser.getBirthyear()+ "-" + naverUser.getBirthday());

			    User user = User.builder()
			            .userName(naverUser.getName())
			            .password("naver")
			            .tel(naverUser.getMobile())
			            .birthDate(date)
			            .regDate(Timestamp.valueOf(LocalDateTime.now()))
			            .build();
	
			    userService.insertUser(user);
			    oldUser = userService.findUserName(user.getUserName());
			    }
			log.info("user : " + oldUser);
		    //기존 이용자 
		    session.setAttribute("principal", oldUser);
		    session.setAttribute("isNaver", true);

		    log.info("Naver : session 등록확인");
		    
			}
		return "redirect:/main";
	}

	// 카카오 소셜 로그인
	@GetMapping("/kakao/callback")
	public String KakaoCallback(@RequestParam String code) {

		String type = "Kakao";
		
		log.info("카카오 로그인 컨트롤러 실행");
		log.info("카카오 로그인 콜백메서드 동작");
		log.info("카카오 인가 코드 확인 : " + code);

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "1e30a4b6f56a90aa1e581ead0614dcf6");
		params.add("redirect_uri", "http://localhost/user/kakao/callback");
		params.add("code", code);

		String accessToken = socialLoginServiceImpl.getAccessToken(params, KAKAO_TOKEN_URL, type);
		
		KakaoProfile kakaoProfile = (KakaoProfile)socialLoginServiceImpl.getUserInfo(accessToken, type, KAKAO_API_URL);

		String username = kakaoProfile.getId().toString();

		User oldUser = userService.findUserName(username);

		if (oldUser == null) {

			log.info("가입 이력이 없으므로 카카오 api 정보를 기반으로 회원 가입 진행 후 로그인");

			String email = kakaoProfile.getKakaoAccount().getEmail();
			StringBuilder tel = new StringBuilder("99999999999");
			Date date = Date.valueOf("3000-01-01");
			try {
				tel = new StringBuilder(kakaoProfile.getKakaoAccount().getPhoneNumber());
				tel.delete(0, 4);
				tel.insert(0, "0");
			} catch (Exception e) {
				log.info("전화번호 기본값 삽입");
			}
			try {
				StringBuilder birth = new StringBuilder(kakaoProfile.getKakaoAccount().getBirthYear() + "-"
						+ kakaoProfile.getKakaoAccount().getBirthDay());
				birth.insert(7, "-");
				date = Date.valueOf(birth.toString());
			} catch (Exception e) {
				log.info("생년월일 기본값 삽입");
			}

			User userDto = User.builder().userName(username).password("kakaoUser").email(email).tel(tel.toString())
					.birthDate(date).regDate(Timestamp.valueOf(LocalDateTime.now())).build();

			log.info("userDto : " + userDto);

			userService.insertUser(userDto);
			oldUser = userService.findUserName(userDto.getUserName());
		} else {
			log.info("가입된 회원이므로 카카오 로그인 진행");
		}

		log.info("user : " + oldUser);

		session.setAttribute("principal", oldUser);

		session.setAttribute("iskakao", true);
		
		String uri = (String) session.getAttribute("beforeLogin");
		if (uri != null && !uri.equals("http://localhost/user/sign-up")
				&& !uri.equals("http://localhost/user/sign-in")) {
			return "redirect:" + uri;
		} else {
			return "redirect:/main";
		}
	}
	
	
	@PostMapping("/email-duplicate-check")
	public ResponseEntity<Integer> EmailDuplicateCheck(@RequestParam("email") String email) {
		
		if(email == null || email.isEmpty()) {
			throw new CustomRestfulException("E-mail 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		log.info("이메일 중복체크 컨트롤러 실행");
		
		if(userService.findUserFromEmail(email)!=null) {
			log.info("UserController ====> 이메일 사용불가");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			log.info("UserController ====> 이메일 사용가능");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}
	
	// 이메일 인증
	@PostMapping("/mail-confirm")
	@ResponseBody
	public String MailConfirm(@RequestParam("email") String email) throws Exception {
		
		if(email == null || email.isEmpty()) {
			throw new CustomRestfulException("E-mail 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		log.info("가입코드 이메일 전송 컨트롤러 실행");
		
	    String code = mailSendService.sendSimpleMessage(email);
	    log.info("인증코드 : " + code);
	    return code;
	}
	
	@GetMapping("/verify-user")
	public String VerifyUser() {
		return "user/verifyUser";
	}

	@PostMapping("/verify-user")
	public ResponseEntity<Integer> VerifyUserProc(User user) {
		User sessionUser = (User)session.getAttribute("principal");
		log.info("" + sessionUser);
		if(!user.getUserName().equals(sessionUser.getUserName())) {
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}
		User principal = userService.findUserByUserName(user);
		if (principal != null) {
			principal.setPassword(null);
			session.setAttribute("isVerify", true);
			return ResponseEntity.status(HttpStatus.OK).body(200);
		} else {
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}
	}

	

	@GetMapping("/user-info")
	public String UserInfo() {
		if(session.getAttribute("isVerify") == null) {
			throw new UnAuthorizedException("잘못된 접근입니다.", HttpStatus.UNAUTHORIZED);
		}
		return "user/modifyUser";
	}
	
	@PostMapping("/modify-userInfo")
	public String ModifyUserInfo(User user) {
		
		if(user.getUserName() == null || user.getUserName().isEmpty()) {
			throw new CustomRestfulException("username을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getPassword() == null || user.getPassword().isEmpty()) {
			throw new CustomRestfulException("password을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getEmail() == null || user.getEmail().isEmpty()) {
			throw new CustomRestfulException("email을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getTel() == null || user.getTel().isEmpty()) {
			throw new CustomRestfulException("전화번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if(user.getBirthDate() == null) {
			throw new CustomRestfulException("생년월일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		userService.modifyUserInfo(user);
		
		session.invalidate();
		
		return "user/signIn";
	}
	
	@GetMapping("/delete")
	public String deleteUser(Integer id) {
		session.invalidate();
		userService.deleteUser(id);
		return "redirect:/user/sign-in";
	}
	
	@GetMapping("/payment")
	public String UserPayment(Model model) {
		User user = (User)session.getAttribute("principal");
		List<PaySubscribe> payList = userService.findUserPayment(user.getId());
		int totalAmount = 0;
		for (PaySubscribe pay : payList) {
			totalAmount += pay.getAmount();
		}
		model.addAttribute("payList", payList);
		model.addAttribute("totalAmount", totalAmount);
		return "user/payment";
	}
	
	@GetMapping("/my-info")
	public String myInfo(Model model, HttpServletRequest request) {
		User user = (User)session.getAttribute("principal");
		
		// reply 가져오기
		int replySize = replyService.countMyReply(user.getId());
		model.addAttribute("replySize", replySize);
		
		// board 가져오기
		int boardSize = boardService.countMyBoard(user.getId());
		model.addAttribute("boardSize", boardSize);
		
		return "user/myInfo";
	}
	@GetMapping("/my-reply")
	public String myReply(ReplyPagingDto replyPaging, Model model, HttpServletRequest request) {
		User user = (User)session.getAttribute("principal");
		
		// reply 가져오기
		replyPaging.setUserId(user.getId());
		List<Reply> reply = replyService.selectMyReply(replyPaging);
		int total = replyService.countMyReply(user.getId());
		ReplyPagination pagination = new ReplyPagination(total, replyPaging);
		
		model.addAttribute("reply", reply);
		model.addAttribute("paging", replyPaging);
		model.addAttribute("page", pagination);
		model.addAttribute("paging", replyPaging);
		
		return "user/myReply";
	}
	@GetMapping("/my-board")
	public String myBoard(PagingDto paging, Model model, HttpServletRequest request) {
		User user = (User)session.getAttribute("principal");

		// board 가져오기
		paging.setSearchType("userName");
		paging.setSearchWord(user.getUserName());
		
		List<Board> boardList = boardService.selectBoardSearchList(paging);
		List<String> cate = boardService.findCategoryList();
		int total = boardService.countMyBoard(user.getId());
		Pagination pagination = new Pagination(total, paging);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("cate", cate);
		model.addAttribute("page", pagination);
		model.addAttribute("paging", paging);
		
		return "user/myBoard";
	}
}
