package com.kh.spring.controller.shopadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 매장관리자
@Controller
@RequestMapping("/shop_admin")
public class ShopHomeController {

	//메인화면
	@RequestMapping({"","/"})
	public String home() {
		return "admin/shop/home";
	}
}
	
