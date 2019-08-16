package com.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// Admin관리자
@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping({"","/"})
	public String home() {
		return "admin/home";
	}
}
