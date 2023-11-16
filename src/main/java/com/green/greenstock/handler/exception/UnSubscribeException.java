package com.green.greenstock.handler.exception;

import lombok.Getter;

@Getter
public class UnSubscribeException extends RuntimeException {

    private final String path;

    public UnSubscribeException(String message, String path) {
        super(message);
        this.path = path;
    }
}
