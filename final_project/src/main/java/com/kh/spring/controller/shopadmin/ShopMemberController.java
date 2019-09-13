package com.kh.spring.controller.shopadmin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.repository.MemberDao;

@Controller
@RequestMapping("/shop_admin/member")
public class ShopMemberController {

	@Autowired
	private MemberDao memberDao;
	
	//로그인(GET)
	@GetMapping("/login")
	public String login() {
		return "admin/shop/member/login";
	}
	
	//로그인(POST)
	@PostMapping("/login")
	public String login(
				@ModelAttribute MemberDto memberDto,
				@RequestParam(required=false) String remember,
				HttpSession session,
				HttpServletResponse response
			) {
		//DB에서 회원정보(id)를 불러온다.
		MemberDto result = memberDao.get(memberDto.getId());
		if(result != null) {
			//BCrypt의 비교명령을 이용하여 비교 후 처리
			if(BCrypt.checkpw(memberDto.getPw(), result.getPw())) {
				if(result.getShop_code() > 0) {
					session.setAttribute("member_code", result.getNo());
					session.setAttribute("shop_code", result.getShop_code());
					session.setAttribute("type", result.getType());
				}
				else {
					return "admin/login_auth";//권한 없음 페이지로 전송
				}
				
				//아이디 저장
				//쿠키 객체 생성 후 체크 여부에 따라 시간 설정 후 response에 추가
				Cookie cookie = new Cookie("saveID", memberDto.getId());
				if(remember == null) {//체크 안했을 때
					cookie.setMaxAge(0);
				}
				else {
					cookie.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				}
				
				response.addCookie(cookie);
				return "redirect:/shop_admin";//관리자 메인페이지로 이동
			}
			else {
				return "admin/shop/member/login_fail";
			}
		}
		else {
			return "admin/shop/member/login_fail";
		}
	}
	
	//로그아웃 기능
	@GetMapping("/logout")
	public String logout(
				HttpSession session
			) {
		//세션으로 데이터 받아와서 지우기
		session.removeAttribute("member_code");
		session.removeAttribute("shop_code");
		session.removeAttribute("type");
		return "redirect:/shop_admin";
	}
	
}
