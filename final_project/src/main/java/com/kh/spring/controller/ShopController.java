package com.kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.ShopService;

//매장
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@Autowired
	private ShopDao shopDao;
	
	// 매장목록화면
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("shop_list", shopDao.list());
		return "client/shop/shop_list";
	}
	
	// 매장상세화면
	@GetMapping("/detail")
	public String detail(@RequestParam int no, Model model) {
		
		return "client/shop/shop_detail";
	}
}
