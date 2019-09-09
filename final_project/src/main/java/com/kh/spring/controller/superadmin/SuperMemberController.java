package com.kh.spring.controller.superadmin;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.vo.MemberInfoVO;

@Controller
@RequestMapping("/super_admin/member")
public class SuperMemberController {
	
	@Autowired
	MemberDao memberDao;
	
	
	@GetMapping("/usergrade")
	public String grade(Model model) {
		model.addAttribute("grade", memberDao.grade());
		return "admin/super/member/setgrade";
	}
	
	@PostMapping("/usergrade_edit")
	public String grade(
						Model model,
						@RequestParam String name1,
						@RequestParam String name2,
						@RequestParam String name3,
						@RequestParam String min_order1,
						@RequestParam String min_order2,
						@RequestParam String max_order2,
						@RequestParam String max_order3){
		memberDao.usergrade_edit1(name1, min_order1);
		memberDao.usergrade_edit2(name2, min_order2,max_order2);
		memberDao.usergrade_edit3(name3, max_order3);
		
		model.addAttribute("grade", memberDao.grade());
		return "admin/super/member/setgrade";
	}
	
	//로그인(GET)
	@GetMapping("/login")
	public String login() {
		return "admin/super/member/login";
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
				session.setAttribute("member_code", result.getNo());
				
				//아이디 저장
				//쿠키 객체를 만들고 체크 여부에 따라 시간 설정 후 response에 추가
				Cookie cookie = new Cookie("saveID", memberDto.getId());
				if(remember == null) {//체크 안했을 때
					cookie.setMaxAge(0);
				}
				else {//체크 했을 때
					cookie.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				}
				
				response.addCookie(cookie);
				return "redirect:/super_admin";//관리자 메인페이지로 이동
			}
			else {
				return "admin/super/member/login_fail";
			}			
		}
		else {
			return "admin/super/member/login_fail";
		}
	}
	
	//로그아웃 기능
	@GetMapping("/logout")
	public String logout(
				HttpSession session
			) {
		//세션으로 데이터 받아와서 지우기
		session.removeAttribute("member_code");
		return "redirect:/super_admin";
	}
	
	//회원 목록(회원 검색 기능)
	//목표 : 회원 검색어를 받아서 검색한 뒤 목록을 전달
	@GetMapping("/search")
	public String search(
			@RequestParam(required = false) String status,
			@RequestParam(required = false) String grade,
			@RequestParam(required = false) String start_date,
			@RequestParam(required = false) String end_date,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			Model model
			) {
		List<MemberInfoVO> list = memberDao.search(status, grade, start_date, end_date, type, keyword);
		model.addAttribute("list", list);
		return "admin/super/member/search";
	}
	
	//회원 정보 상세 보기 기능
	//회원 아이디를 이용하여 회원정보를 불러온 뒤 view로 전달
	@GetMapping("/info")
	public String info(
				Model model,
				HttpSession session,
				@RequestParam int no
			) {
//		int member_code = 23;
//		System.out.println(no);
		List<MemberInfoVO> list = memberDao.info(no);
		model.addAttribute("membervo", list.get(0));
		return "admin/super/member/info";
	}
	
	//회원 탈퇴 기능
	@GetMapping("/delete")
	public String delete(
				HttpSession session,
				@RequestParam int no
			) {
//		System.out.println("탈퇴 : "+ no);
		memberDao.delete(no);
		return "redirect:search";
	}
	
	//회원 정보 수정 기능(GET)
	@GetMapping("/edit")
	public String edit(
				@RequestParam int no,
				HttpSession sessioln,
				Model model
			) {
		List<MemberInfoVO> list = memberDao.info(no);
		model.addAttribute("membervo", list.get(0));
		return "admin/super/member/edit";
	}
	
	//회원 정보 수정 기능(POST)
	@PostMapping("/edit")
	public String edit(
				@ModelAttribute MemberInfoVO memberInfoVO,
				Model model
			) {
		memberDao.edit(memberInfoVO);
		model.addAttribute("membervo", memberInfoVO.getNo());
		return "redirect:info";
	}
	
	
	
	
}
