package com.kh.spring.error;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice(basePackages = "com.kh.spring")
public class ErrorController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@ExceptionHandler(Exception.class)
	public String error(Exception ex) {
		logger.error("오류 발생", ex);
		return "error/error";
	}
}






