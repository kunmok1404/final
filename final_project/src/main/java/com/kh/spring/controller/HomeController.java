package com.kh.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
		return "client/home";
	}
	
}
