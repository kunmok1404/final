package com.kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.MenuDto;
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
	public String list(Model model,@RequestParam int cat_no) {
		model.addAttribute("cat_no", cat_no);
		model.addAttribute("cat_list", shopDao.catList()); // 상단 Food카테고리목록조회
		return "client/shop/shop_list";
	}
	
	// 페이지 조각
	@GetMapping("/part")
	public String part(@RequestParam(required = false, defaultValue = "1") int page,
					int cat_no, Model model) {
		int size = 10;
		int end = page * size;
		int start = end - size + 1;
		System.out.println("페이지="+page);
		System.out.println("조각start="+ start);
		System.out.println("조각end="+ start);
		System.out.println("조각cat_no="+ start);
		List<ShopDto> shop_list = shopDao.ajaxPaging(start, end, cat_no);	
		model.addAttribute("shop_list", shop_list);
		
		return "client/shop/part";
	}
	
	// 매장상세화면
	@GetMapping("/detail")
	public String detail(@RequestParam int no, Model model) {
		model.addAttribute("cat_list", shopDao.catList()); // 상단 Food카테고리목록조회
		model.addAttribute("shopDto", shopDao.shopInfo(no)); //매장정보
		model.addAttribute("menu_list", shopDao.menuList(no)); // 메뉴리스트
		return "client/shop/shop_detail";
	}
}
