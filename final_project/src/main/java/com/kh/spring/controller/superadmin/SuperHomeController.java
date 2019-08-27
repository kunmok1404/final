package com.kh.spring.controller.superadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 슈퍼관리자
@Controller
@RequestMapping("/super_admin")
public class SuperHomeController {

	// 메인
	@RequestMapping({"","/"})
	public String home() {
		return "admin/super/home";
	}
}
