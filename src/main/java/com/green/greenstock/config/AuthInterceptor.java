package com.green.greenstock.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.green.greenstock.repository.model.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthInterceptor implements HandlerInterceptor {
	
	// 컨트롤러 들어가기전에 호출되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		User principal = (User) session.getAttribute("principal");
		if(principal == null ) {
			throw new com.green.greenstock.handler.exception.UnAuthorizedException("로그인 먼저 해주십시오", HttpStatus.UNAUTHORIZED);
		}
		
		return true;
	}
	
	@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
		}	
	
	@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
				throws Exception {
			HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
		}
}
