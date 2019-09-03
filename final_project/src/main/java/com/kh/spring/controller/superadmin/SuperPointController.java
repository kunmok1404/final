package com.kh.spring.controller.superadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/super_admin/point")
@Controller
public class SuperPointController {

	// 포인트 목록
	@GetMapping("/list")
	public String list() {
		return "admin/super/promotion/point_list";
	}
}
