package com.green.greenstock.handler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.green.greenstock.handler.exception.CustomPageException;
import com.green.greenstock.handler.exception.UnSearchedException;
import com.green.greenstock.handler.exception.PageNotFoundException;

/**
 * View 렌더링을 위해 ModelAndView
 * 객체를 반환하도록 설계할 때 사용
 * 예외 page 를 리턴하도록 설계
 */
@ControllerAdvice // IoC 대상
public class MyPageExceptionHandler {

	// @ExceptionHandler(Exception.class)
	// public void exception(Exception e) {
	// System.out.println("==== 예외 발생 확인 ====");
	// System.out.println(e.getMessage());
	// System.out.println("------------------------");
	// }

	// 사용자 정의 클래스 활용
	@ExceptionHandler(CustomPageException.class)
	public ModelAndView handleRuntimePageExcption(CustomPageException e) {
		System.out.println(e.getMessage());
		// ModelAndView 활용 방법 - 페이지 명시해야함.
		ModelAndView modelAndView = new ModelAndView("errorPage");
		modelAndView.addObject("statusCode", e.getStatus().value());
		modelAndView.addObject("message", e.getMessage());
		return modelAndView;
	}

	@ExceptionHandler(PageNotFoundException.class)
	public ModelAndView notSearchException(PageNotFoundException e) {
		ModelAndView modelAndView = new ModelAndView("errorPage404"); // HTML 템플릿 이름을 지정합니다.
		modelAndView.addObject("errorMessage", e.getMessage()); // 에러 메시지를 모델에 추가합니다.
		modelAndView.addObject("redirectUrl", e.getPath()); // 리다이렉션 URL을 모델에 추가합니다.
		return modelAndView;
	}

}