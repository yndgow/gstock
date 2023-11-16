package com.green.greenstock.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.green.greenstock.handler.exception.UnAuthorizedException;
import com.green.greenstock.handler.exception.UnSubscribeException;
import com.green.greenstock.repository.entity.AdvisorEntity;
import com.green.greenstock.repository.entity.SubscribeToAdvisorEntity;
import com.green.greenstock.repository.entity.UserEntity;
import com.green.greenstock.repository.interfaces.AdvisorEntityRepository;
import com.green.greenstock.repository.interfaces.SubscribeToAdvisorEntityRepository;
import com.green.greenstock.repository.model.User;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class AdvisorInterceptor implements HandlerInterceptor {

    private final SubscribeToAdvisorEntityRepository subscribeToAdvisorEntityRepository;
    private final AdvisorEntityRepository advisorEntityRepository;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("principal");

        if (user == null) {
            throw new UnAuthorizedException("로그인 먼저 해주세요.", HttpStatus.BAD_REQUEST);
        }

        String advisorNickName = null;
        String requestUri = request.getRequestURI();
        String[] parts = requestUri.split("/");

        if (parts.length > 4) {
            advisorNickName = parts[4];
        }

        if (advisorNickName == null) {
            response.sendRedirect("/advisor/list");
            return false;
        }

        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorNickName(advisorNickName);

        if (advisorEntity == null) {
            response.sendRedirect("/advisor/list");
            return false;
        }

        SubscribeToAdvisorEntity subscribeToAdvisorEntity = subscribeToAdvisorEntityRepository
                .findByAdvisorEntityAndUserEntity(
                        advisorEntity,
                        UserEntity.builder().id(user.getId()).build());

        if (subscribeToAdvisorEntity == null) {
            throw new UnSubscribeException("구독하지 않은 계정입니다.", "/advisor/" + advisorEntity.getAdvisorNickName());
        }

        return true;
    }

}
