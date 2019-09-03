package com.kh.spring.controller.superadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.service.MenuService;

@Controller
@RequestMapping("/super_admin/menu")
public class SuperMenuController {

	@Autowired
	private MenuService menuService; 
	
	// 메뉴 목록화면
	@GetMapping("/list")
	public String list(Model model) {
		
		//메뉴목록 조회
		model.addAttribute("list", menuService.list());
		
		return "admin/super/menu/list";
	}
	
}
