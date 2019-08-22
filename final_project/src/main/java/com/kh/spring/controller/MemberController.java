package com.kh.spring.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MyshopDto;
import com.kh.spring.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	// �쉶�썝媛��엯 湲곕뒫(GET)
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";
	}

	// �쉶�썝媛��엯 湲곕뒫(POST)
	@PostMapping("/regist")
	public String regist(@ModelAttribute MemberDto memberDto) {
		// memberDto �븞�뿉 �엳�뒗 pw瑜� 蹂�寃�(BCrypt)
//		String origin = memberDto.getPw();
//		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
//		memberDto.setPw(encrypt);

		boolean result = memberDao.regist(memberDto);
		System.out.println(result);
		if (result) {
			return "redirect:regist_result";
		} 
		else {
			return "redirect:regist_fail";
		}
		// �젙蹂대�� 蹂대궡嫄곕굹 諛쏆쓣�븣(�뜲�씠�꽣 諛쏆븘�꽌 泥섎━�븷�븣)�뒗 二쇱냼留�(�룷�썙�뱶)
		// 二쇱냼濡� 蹂대궡怨좎떢�쓣�븣�뒗 redirect(�솗�씤�슜)
	}

	// �쉶�썝媛��엯 �꽦怨듭떆 �꽦怨듯럹�씠吏�濡� 蹂대궡湲�
	@GetMapping("/regist_result")
	public String regist_result() {
		return "member/regist_result";
	}

	// �쉶�썝媛��엯 �떎�뙣�떆 �떎�뙣�럹�씠吏�濡� 蹂대궡湲�
	@GetMapping("/regist_fail")
	public String regist_fail() {
		return "member/regist_fail";
	}

	// �븘�씠�뵒 以묐났�솗�씤
	@GetMapping("/id_check")
	public void id_check(@RequestParam String id, HttpServletResponse resp) throws IOException {
		System.out.println("�젒�냽�뻽�뒿�땲�떎.");
		resp.setContentType("text/plain");
		MemberDto mdto = memberDao.id_check(id);
		System.out.println("�뀒�뒪�듃�떆�옉");
		if (mdto == null) {
			resp.getWriter().print("Y");
			System.out.println("Y");
		} 
		else {
			resp.getWriter().print("N");
			System.out.println("N");
		}
	}

	// 濡쒓렇�씤 湲곕뒫(GET)
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	// 濡쒓렇�씤 湲곕뒫(POST)
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto memberDto, @RequestParam(required = false) String remember,
			HttpSession session, HttpServletResponse response,Model model) {
		// �븫�샇�솕 �쟻�슜 �쟾
		MemberDto result = memberDao.login(memberDto);
		if (result != null) {
			session.setAttribute("ok", result.getId());
			session.setAttribute("type", result.getType());

			// �븘�씠�뵒 ���옣
			// 荑좏궎 媛앹껜瑜� 留뚮뱾怨� 泥댄겕 �뿬遺��뿉 �뵲�씪 �떆媛� �꽕�젙 �썑 response�뿉 異붽�
			Cookie cookie = new Cookie("saveID", memberDto.getId());
			if (remember == null) {// 泥댄겕 �븞�뻽�쓣 �븣
				cookie.setMaxAge(0);
			} 
			else {// 泥댄겕 �뻽�쓣 �븣
				cookie.setMaxAge(4 * 7 * 24 * 60 * 60);// 4二�
			}

			response.addCookie(cookie);
			return "redirect:/";
		} 
		else {
			model.addAttribute("fail", "fail");
			return "member/login";
		}
	}

	// ----------------------------------//

	// 濡쒓렇�씤 湲곕뒫(POST)
//	@PostMapping("/login")
//	public String login(
//				@ModelAttribute MemberDto memberDto,
//				@RequestParam(required=false) String remember,
//				HttpSession session,
//				HttpServletResponse response
//			) {
//		//�븫�샇�솕 �쟻�슜 �썑
//		// 1. id濡� DB�뿉�꽌 �쉶�썝�젙蹂대�� 遺덈윭�삩�떎.
//		MemberDto result = memberDao.get(memberDto.getId());
//		// 2. BCrypt�쓽 鍮꾧탳 紐낅졊�쓣 �씠�슜�븯�뿬 鍮꾧탳 �썑 泥섎━
//		if(BCrypt.checkpw(memberDto.getPw(), result.getPw())) {
//			session.setAttribute("ok", result.getId());
//			session.setAttribute("type", result.getType());
//			
//			//�븘�씠�뵒 ���옣
//			//荑좏궎 媛앹껜瑜� 留뚮뱾怨� 泥댄겕 �뿬遺��뿉 �뵲�씪 �떆媛� �꽕�젙 �썑 response�뿉 異붽�
//			Cookie cookie = new Cookie("saveID", memberDto.getId());
//			if(remember == null) {//泥댄겕 �븞�뻽�쓣 �븣
//				cookie.setMaxAge(0);
//			}
//			else {//泥댄겕 �뻽�쓣 �븣
//				cookie.setMaxAge(4 * 7 * 24 * 60 * 60);//4二�
//			}
//			
//			response.addCookie(cookie);
//			return "redirect:/";			
//		}
//		else {
//			return "member/login_fail";
//		}
//	}
	
	//濡쒓렇�씤 �떎�뙣 alert

	
	//濡쒓렇�븘�썐 湲곕뒫
//	@GetMapping("/logout")
//	public String logout() {
//		
//	}

	
	@PostMapping("/like")
	public void like(@ModelAttribute MyshopDto myshopDto) {
		memberDao.like(myshopDto);
	}
	
	
	@PostMapping("/unlike")
	public void unlike(@ModelAttribute MyshopDto myshopDto) {
		memberDao.unlike(myshopDto);
	}

}
