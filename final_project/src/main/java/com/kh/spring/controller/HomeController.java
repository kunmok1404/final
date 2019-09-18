package com.kh.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.repository.TermsDao;


@Controller
public class HomeController {
	
	@Autowired
	TermsDao termsDao;
	@Autowired
	ShopDao shopDao;
	@Autowired
	CategoryDao categoryDao;
	
	// 메인화면
	@GetMapping({"","/"})
	public String home(Model model) {
		model.addAttribute("category", shopDao.catList());
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms2", termsDao.terms2());
		model.addAttribute("shop_list", shopDao.shop());
		return "client/home";
	}
	
	// 주소검색
	@GetMapping("/search")
	public String search(Model model, @RequestParam(required = false) String keyword) {
		if(keyword != null) {
			model.addAttribute("keyword", keyword); //검색 키워드
		}
		model.addAttribute("cat_no", 0);
		return "redirect:/shop/list";
	}
	
}
