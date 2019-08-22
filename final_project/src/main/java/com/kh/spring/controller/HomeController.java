package com.kh.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.spring.repository.ShopDao;
import com.kh.spring.repository.TermsDao;


@Controller
public class HomeController {
	
	@Autowired
	TermsDao termsDao;
	@Autowired
	ShopDao shopDao;
	
	@GetMapping({"","/"})
	public String home(Model model) {
		model.addAttribute("category", shopDao.catList());
		return "client/home";
	}
	
	@GetMapping("/terms")
	public String terms(Model model) {
		model.addAttribute("terms1", termsDao.list1());
		model.addAttribute("terms2", termsDao.list2());
		return "client/terms";
	}
	
	
}
