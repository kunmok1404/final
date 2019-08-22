package com.kh.spring.service;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

@Service
public interface EmailService {
	
	void sendCertification(String email) throws MessagingException;
	
}
