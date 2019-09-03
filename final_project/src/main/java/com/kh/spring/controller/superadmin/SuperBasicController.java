package com.kh.spring.controller.superadmin;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.repository.ShopDao;
import com.kh.spring.repository.TermsDao;
import com.kh.spring.service.CategoryService;
import com.kh.spring.vo.FoodCategoryList;

@Controller
@RequestMapping("/super_admin/basic")
public class SuperBasicController {

	@Autowired
	private TermsDao termsDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private CategoryService categoryService;
	
	//약관관리
	@GetMapping("/terms")
	public String terms(Model model) {
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms2", termsDao.terms2());
		return "admin/super/basic/terms";
	}
	
	//이용약관 등록
	@PostMapping("/update1")
	public String regist1(@RequestParam String terms_content1) {
		termsDao.update1(terms_content1);
		return "redirect:terms";
	}
	
	//개인정보처리방침 등록
	@PostMapping("/update2")
	public String regist2(@RequestParam String terms_content2) {
		termsDao.update2(terms_content2);
		return "redirect:terms";
	}
	
	// Food_category 이동
	@GetMapping("/food_category")
	public String category(Model model) {
		// 카테고리 정보 조회
		model.addAttribute("cat_list", shopDao.categoryno());
		return "admin/super/basic/food_category";
	}
	
	// Food_category 등록
	@PostMapping("/food_category")
	public String categoryRegist(Model model, 
					@ModelAttribute FoodCategoryList food_list) throws IllegalStateException, IOException {
		// 카테고리 정보 등록
		System.out.println("컨트롤러"+food_list);
		categoryService.updateFoodCategory(food_list);
		return "redirect:food_category";
	}
	
}
