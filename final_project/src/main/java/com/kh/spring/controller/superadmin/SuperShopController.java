package com.kh.spring.controller.superadmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.entity.Pageing;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.AdminService;


@Controller
@RequestMapping("/super_admin/shop")
public class SuperShopController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	ShopDao shopDao;
	
//	매장목록페이지
	@GetMapping("/shop_info")
	public String shop_info(Model model,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "all") String searchOption
			) {
		// 전체매장 개수
        int count = adminService.countArticle(searchOption, keyword);
        
        //페이지 나누기 관련 처리 
        Pageing pageing = new Pageing(count, curPage);
        int start = pageing.getPageBegin();
        int end = pageing.getPageEnd();
        List<ShopDto> list = adminService.listAll(start, end, searchOption, keyword);
        List<FoodCategoryDto> name = shopDao.categoryno();
        
        //데이터를 전달
        model.addAttribute("list", list);
        model.addAttribute("name", name);
        model.addAttribute("count", count);
        model.addAttribute("searchOption", searchOption);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageing", pageing);
        
		return "super_admin/super/shop_info";
	}
	
	@PostMapping("/shop_info")
	public String shop_inf(Model model,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "all") String searchOption
			) {
		// 전체매장 개수
        int count = adminService.countArticle(searchOption, keyword);
        
        //페이지 나누기 관련 처리 
        Pageing pageing = new Pageing(count, curPage);
        int start = pageing.getPageBegin();
        int end = pageing.getPageEnd();
        List<ShopDto> list = adminService.listAll(start, end, searchOption, keyword);
        List<FoodCategoryDto> name = shopDao.categoryno();
        
        
        
        //데이터를 전달
        model.addAttribute("list", list);
        model.addAttribute("name", name);
        model.addAttribute("count", count);
        model.addAttribute("searchOption", searchOption);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageing", pageing);
        
		return "super_admin/super/shop_info";
	}
	
}
