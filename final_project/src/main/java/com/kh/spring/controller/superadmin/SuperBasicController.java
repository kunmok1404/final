package com.kh.spring.controller.superadmin;

import java.io.IOException;

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
import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.repository.TermsDao;
import com.kh.spring.service.CategoryService;
import com.kh.spring.vo.FoodCategoryList;

@Controller
@RequestMapping("/super_admin/basic")
public class SuperBasicController {

	@Autowired
	private TermsDao termsDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CategoryDao CategoryDao;
	
	@Autowired
	private MemberDao memberDao;
	
	//약관관리
	@GetMapping("/terms")
	public String terms(Model model) {
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms2", termsDao.terms2());
		return "admin/super/basic/terms";
	}
	
	//이용약관 등록
	@PostMapping("/update1")
	public String regist1(@RequestParam String terms_content1) {
		termsDao.update1(terms_content1);
		return "redirect:terms";
	}
	
	//개인정보처리방침 등록
	@PostMapping("/update2")
	public String regist2(@RequestParam String terms_content2) {
		termsDao.update2(terms_content2);
		return "redirect:terms";
	}
	
	// Food_category 이동
	@GetMapping("/food_category")
	public String category(Model model) {
		// 카테고리 정보 조회
		model.addAttribute("cat_list", shopDao.categoryno());
		return "admin/super/basic/food_category";
	}
	
	// Food_category 등록
	@PostMapping("/food_category")
	public String categoryRegist(Model model, 
					@ModelAttribute FoodCategoryList food_list) throws IllegalStateException, IOException {
		// 카테고리 정보 등록
		categoryService.updateFoodCategory(food_list);
		return "redirect:food_category";
	}
	//로그인(GET)
	@GetMapping("/login")
	public String login() {
		return "admin/super/basic/login";
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
			return "redirect:/";//관리자 메인페이지로 이동
		}
		else {
			return "admin/super/basic/login";
		}
	}
	
	//로그아웃 기능
	@GetMapping("/logout")
	public String logout(
				HttpSession session
			) {
		//세션으로 데이터 받아와서 지우기
		session.removeAttribute("member_code");
		return "redirect:/";
	}
	
	//회원 목록(회원 검색 기능)
	//목표 : 회원 검색어를 받아서 검색한 뒤 목록을 전달
	//(검색하기 : DB기능, 전달 : Model, 검색어 받기 : @RequestParam)
//	@GetMapping("/member_info_list")	
//	public String member_info_list() {
//		
//	}
	
	//회원 정보 상세 보기 기능
	
	//회원 탈퇴 기능
	
	//회원 정보 수정 기능
	
}
