package com.kh.spring.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.ShopService;


// 매장
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@Autowired
	private ShopDao shopDao;
	
	// 매장목록
	@RequestMapping("/list")
	public String list(Model model,@RequestParam int cat_no, @RequestParam(required = false) String keyword) {
		model.addAttribute("cat_no", cat_no);
		model.addAttribute("cat_list", shopDao.catList()); // 음식카테고리 목록
		model.addAttribute("shop_list", shopDao.shop()); // 검색 주소목록
		
		return "client/shop/shop_list";
	}
	
	// 더보기 기능
	@GetMapping("/part")
	public String part(@RequestParam(required = false, defaultValue = "1") int page,
					int cat_no, Model model) {
		int size = 10;
		int end = page * size;
		int start = end - size + 1;
		List<ShopDto> shop_list = shopDao.ajaxPaging(start, end, cat_no);	
		model.addAttribute("shop_list", shop_list);
		
		return "client/shop/part";
	}
	
	// 매장상세화면
	@GetMapping("/detail")
	public String detail(@RequestParam int no, Model model) {
		model.addAttribute("cat_list", shopDao.catList()); 
		model.addAttribute("shopDto", shopDao.shopInfo(no));
		model.addAttribute("map", shopService.menuList(no)); 
		return "client/shop/shop_detail";
	}
	
	// 메뉴클릭 후 모달창정보
	@GetMapping("/sub_menu")
	public String sub_menu(@RequestParam int menu_no,Model model) {
		model.addAttribute("map", shopService.sub_menu(menu_no));
		model.addAttribute("menuDto",shopDao.menuName(menu_no));
		model.addAttribute("list", shopDao.subMenuList(menu_no));
		return "client/shop/sub_menu";
	}
	

	// 입점문의 페이지

	@GetMapping("/explan")
	public String explan() {
		return "client/order/shop_explan";
	}
	

	// 입점문의 신청페이지(get)
	@GetMapping("/shop_regist")
	public String order_regist() {
		return "client/order/shop_regist";
	}

	// 입점문의 신청페이지(post)
	@PostMapping("/shop_regist")
	public String order_regist(
								@ModelAttribute ShopDto shopDto,
								@RequestParam MultipartFile business,
								@RequestParam MultipartFile img,
								@RequestParam MultipartFile sale) throws IllegalStateException, IOException {
		shopService.regist(shopDto,business,img,sale);
		return "client/order/shop_regist";
		
	}
}
