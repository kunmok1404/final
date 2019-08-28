package com.kh.spring.controller.superadmin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/super_admin/order")
public class SuperOrderController {
	
	
	
	@GetMapping("/list")
	public String order_list(Model model) {
		
		return "admin/super/order/list";
	}

}
