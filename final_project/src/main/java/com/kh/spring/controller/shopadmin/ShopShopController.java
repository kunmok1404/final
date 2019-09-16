package com.kh.spring.controller.shopadmin;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.ShopService;

@Controller
@RequestMapping("/shop_admin/shop")
public class ShopShopController {
	
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ShopService shopService;
	@Autowired
	private CategoryDao categoryDao;

	// 매장정보 상세화면 이동
		@GetMapping("/detail")
		public String detail(
						HttpSession session,
						Model model	) {
			int shop_code = (int)session.getAttribute("shop_code");
			ShopDto shopDto = shopDao.shopInfo(shop_code);
			model.addAttribute("shop", shopDto);
			// food_category 조회
			model.addAttribute("menu_list", categoryDao.getFoodCategoryList());
			model.addAttribute("categoryDto",categoryDao.getFoodCategoryInfo(shopDto.getCategory()));
			return "admin/shop/shop/detail";
		}
		
		//	매장정보수정확인
		@PostMapping("/detail")
		public String shop_info(
					ShopDto shopDto,
					@RequestParam MultipartFile img
				) throws IllegalStateException, IOException {
		
			shopService.edit(shopDto,img);
			
			return  "redirect:detail";
		}
		
}
