package com.green.greenstock.handler.exception;

import lombok.Getter;

@Getter
public class PageNotFoundException extends RuntimeException {

	private final String path;

	public PageNotFoundException(String message, String path) {
		super(message);
		this.path = path;
	}

}
