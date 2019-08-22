package com.kh.spring.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			return "redirect:regist_result";
		}
		else {
			return "redirect:regist_fail";
		}
		//정보를 보내거나 받을때(데이터 받아서 처리할때)는 주소만(포워드)
		//주소로 보내고싶을때는 redirect(확인용)
	}
	
	//회원가입 성공시 성공페이지로 보내기
	@GetMapping("/regist_result")
	public String regist_result() {
		return "member/regist_result";
	}
	
	//회원가입 실패시 실패페이지로 보내기
	@GetMapping("/regist_fail")
	public String regist_fail() {
		return "member/regist_fail";
	}
	
	//아이디 중복확인
	@GetMapping("/id_check")
	public void id_check(@RequestParam String id, HttpServletResponse resp) throws IOException {
		System.out.println("접속했습니다.");
		resp.setContentType("text/plain");
		MemberDto mdto = memberDao.get(id);
		System.out.println("테스트시작");
		if(mdto == null) {
			resp.getWriter().print("Y");
			System.out.println("Y");
		}
		else {
			resp.getWriter().print("N");
			System.out.println("N");
		}
	}
	
	//로그인 기능(GET)
	
	
	
	
	
	
}
