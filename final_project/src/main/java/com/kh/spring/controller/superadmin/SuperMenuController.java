package com.kh.spring.controller.superadmin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/super_admin/menu")
public class SuperMenuController {

	// 메뉴 목록화면
	@GetMapping("/list")
	public String list(Model model) {
		
		return "admin/super/menu/list";
	}
	
}
