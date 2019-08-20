package com.kh.spring.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	
//	@Autowired
//	private CategoryDao categoryDao;
//	@Autowired
//	private FileDao fileDao;
	@GetMapping("/")
	public String home() {
//		model.addAttribute("category_list", categoryDao.list());
//		model.addAttribute("file_list", fileDao.list());
		return "client/home";
	}

}
