package com.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//주문 관련 컨트롤러

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@GetMapping("/order")
	public String order() {
		return "order/order";
	}
	
	@GetMapping("/cart")
	public String cart(Model model) {
		return "order/cart";
	}

}
