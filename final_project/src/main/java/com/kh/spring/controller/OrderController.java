package com.kh.spring.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//주문 관련 컨트롤러

import com.kh.spring.entity.CartListVO;
import com.kh.spring.entity.OrderDetailListVo;
import com.kh.spring.repository.OrdersDao;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrdersDao orderDao;
	
	
	@GetMapping("/cart")
	public String cart(@RequestParam int shop_code,
					   HttpSession session,
					   Model model) {
		int member_code = (int) session.getAttribute("member_code");
		model.addAttribute("shopDto",orderDao.shopInfo(shop_code));
		model.addAttribute("cartDto",orderDao.cartlist(member_code));
		session.setAttribute("shop_code",shop_code);
		return "client/order/cart";
	}
	
	@PostMapping("/orderinput")
	public String cart(@ModelAttribute CartListVO vo,HttpSession session,Model model,
					   @RequestParam int total_price) {
		int member_code = (int) session.getAttribute("member_code");
		int shop_code = (int) session.getAttribute("shop_code");
		model.addAttribute("shopDto",orderDao.shopInfo(shop_code));
		model.addAttribute("cartList",orderDao.cartlist(member_code));
		model.addAttribute("memberDto",orderDao.memberSearch(member_code));
		model.addAttribute("total_price", total_price);
		orderDao.cartinput(vo);
		return "client/order/order";
	}
	
	@PostMapping("/order")
	public String order(@ModelAttribute OrderDetailListVo vo,
						HttpSession session) {
		return "client/order/order";
	}
}
