package com.kh.spring.controller.admin.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.ShopDao;

//매장관리자
@Controller
@RequestMapping("/shop_admin")
public class ShopAdminController {
	
	@Autowired
	ShopDao shopDao;
	
	//메인화면
	@RequestMapping({"","/"})
	public String home() {
		return "super_admin/shop/home";
	}

	
	
	@GetMapping("/shop_info")
	public String shop_info(Model model) {
		int no = 1;
		model.addAttribute("shop",shopDao.shopInfo(no));
		return "super_admin/shop/shop_info";
	}
	
	@PostMapping("/shop_info")
	public String shop_info(
				ShopDto shopDto,
				Model model
			) {
		shopDao.edit(shopDto);
		
		model.addAttribute("shop",shopDao.shopInfo(shopDto.getNo()));
		return  "super_admin/shop/shop_info";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
