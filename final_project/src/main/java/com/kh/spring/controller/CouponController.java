package com.kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.service.CouponService;

@Controller
@RequestMapping("/coupon")
public class CouponController {

	@Autowired
	private CouponService couponService;
	
	// 나의 쿠폰 목록
	@GetMapping("/list")
	public String list(HttpSession session, Model model) {
		int member_code = (int)session.getAttribute("member_code");
		model.addAttribute("coupon_list", couponService.list(member_code));
		return "client/member/info_coupon_list";
	}
	
}
