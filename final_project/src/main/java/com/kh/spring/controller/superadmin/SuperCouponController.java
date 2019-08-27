package com.kh.spring.controller.superadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.entity.CouponDto;
import com.kh.spring.repository.CouponDao;
@Controller
@RequestMapping("/super_admin/coupon")
public class SuperCouponController {

	@Autowired
	private CouponDao couponDao;
	
	@GetMapping("/regist")
	public String regist(@ModelAttribute CouponDto couponDto) {
		couponDao.regist(couponDto);
		return "";
	}
}
