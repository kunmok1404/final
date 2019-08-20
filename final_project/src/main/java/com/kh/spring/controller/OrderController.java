package com.kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//주문 관련 컨트롤러

import com.kh.spring.repository.OrdersDao;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrdersDao orderDao;
	
	@GetMapping("/order")
	public String order() {
		return "order/order";
	}
	
	@GetMapping("/cart")
	public String cart(@RequestParam int member_code,
					   @RequestParam int shop_code,
					   Model model) {
		model.addAttribute("shopDto",orderDao.shopInfo(shop_code));
		model.addAttribute("cartDto",orderDao.cartlist(member_code));
		return "order/cart";
	}

}
