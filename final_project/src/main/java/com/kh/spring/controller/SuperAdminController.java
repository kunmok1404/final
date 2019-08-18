package com.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 슈퍼관리자
@Controller
@RequestMapping("/admin")
public class SuperAdminController {

	// 메인
	@RequestMapping({"","/"})
	public String home() {
		return "admin/super/home";
	}
}
