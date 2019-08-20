package com.kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	//회원가입 기능(GET)
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";
	}
	
	
	//회원가입 기능(POST)
	@PostMapping("/regist")
	public String regist(
				@ModelAttribute MemberDto memberDto
			) {
		//memberDto 안에 있는 pw를 변경(BCrypt)
//		String origin = memberDto.getPw();
//		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
//		memberDto.setPw(encrypt);
		
		boolean result = memberDao.regist(memberDto);
		System.out.println(result);
		if(result) {
			return "member/regist_result";
		}
		else {
			return "member/regist_fail";
		}
	}
	
	//아이디 중복확인
	@GetMapping("/id_check")
	public String id_check(@ModelAttribute MemberDto memberDto) {
		return null;
	}
	
	
	
	
	
}
