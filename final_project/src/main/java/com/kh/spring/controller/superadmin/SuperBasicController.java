package com.kh.spring.controller.superadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.repository.TermsDao;

@Controller
@RequestMapping("/super_admin/basic")
public class SuperBasicController {

	@Autowired
	private TermsDao termsDao;
	
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
}
