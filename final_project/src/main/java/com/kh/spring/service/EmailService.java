package com.kh.spring.service;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

import com.kh.spring.entity.MemberDto;

@Service
public interface EmailService {
	
	//아이디 찾기
	void sendCertificationid(String email) throws MessagingException;

	//비밀번호 찾기
//	void sendCertificationpw(String email) throws MessagingException;

	//비밀번호 찾기
	void find_pw(MemberDto memberDto) throws MessagingException;

	
}
