package com.green.greenstock.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class UnSignUpException extends RuntimeException{
	private HttpStatus staus;
	
	public UnSignUpException(String message, HttpStatus httpStatus) {
		super(message);
		this.staus = httpStatus;
	}

}
