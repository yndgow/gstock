package com.green.greenstock.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class WebMvcConfig implements WebMvcConfigurer {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	private final AuthInterceptor authInterceptor;
	private final AdvisorInterceptor advisorInterceptor;
	private final AdminInterceptor adminInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(adminInterceptor).addPathPatterns("/admin/**");
		registry.addInterceptor(authInterceptor).addPathPatterns("/board/write").addPathPatterns("/board/update/*")
				.addPathPatterns("/board/thumb-*").addPathPatterns("/board/board*").addPathPatterns("/user/my-*")
				.addPathPatterns("/advisor/register").addPathPatterns("/chat*").addPathPatterns("/user/verify-user")
				.addPathPatterns("/pay/**").addPathPatterns("/user/user-info").addPathPatterns("/user/payment")
				.addPathPatterns("/advisor/register");
		registry.addInterceptor(advisorInterceptor).addPathPatterns("/advisor/sub/**");
	}

	@Value("${spring.servlet.multipart.location}")
	private String filePath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/upload/**")
				.addResourceLocations("file:///" + filePath);
	}
}
