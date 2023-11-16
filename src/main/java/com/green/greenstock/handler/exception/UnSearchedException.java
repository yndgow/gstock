package com.green.greenstock.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class UnSearchedException extends RuntimeException{
	private HttpStatus staus;
	
	public UnSearchedException(String message, HttpStatus httpStatus) {
		super(message);
		this.staus = httpStatus;
	}

}
