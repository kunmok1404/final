package com.kh.spring.controller.shopadmin;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.FilesDao;
import com.kh.spring.repository.MenuDao;
import com.kh.spring.service.CategoryService;
import com.kh.spring.service.MenuService;
import com.kh.spring.vo.CheckMenuVOList;
import com.kh.spring.vo.FoodCategoryList;
import com.kh.spring.vo.MenuRegistVO;
import com.kh.spring.vo.RadioMenuVOList;
@RequestMapping("/shop_admin/menu")
@Controller
public class ShopMenuController {

	@Autowired
	private MenuService menuService;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private FilesDao filesDao;
	@Autowired
	private CategoryService categoryService;
	
	// 메뉴 목록화면
	@GetMapping("/list")
	public String list(
			@RequestParam(required = false) String sale_status,
			@RequestParam(required = false) String apply_status,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") 
			int page,HttpSession session, Model model) {
		int member_code = (int)session.getAttribute("member_code");
		int shop_code = menuDao.getshopcode(member_code);
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		int count = menuDao.shopMenuCount(shop_code,sale_status,apply_status,type, keyword);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		//메뉴목록 조회
		model.addAttribute("menuCount",menuDao.shopMenuCount(shop_code,sale_status,apply_status,type, keyword));
		model.addAttribute("menu", menuDao.shopMenuList(shop_code,sale_status, apply_status, type, keyword,start,end));
		return "admin/shop/menu/list";
	}
	
	// 메뉴등록화면 이동
	@GetMapping("/regist")
	public String regist(HttpSession session, Model model) {
		int shop_code = (int)session.getAttribute("shop_code");
		// Menu_category 조회
		model.addAttribute("menu_list", categoryDao.getMenuCategory(shop_code));
		return "admin/shop/menu/regist";
	}
	
	// 메뉴 등록(post)
	@PostMapping("/regist")
	public String regist(@ModelAttribute MenuRegistVO menuRegistVO,
					@ModelAttribute RadioMenuVOList radioMenuVOList,
					@ModelAttribute CheckMenuVOList checkMenuVOList,
					HttpSession session
			) throws IllegalStateException, IOException {
		int shop_code = (int)session.getAttribute("shop_code");
		menuRegistVO.setShop_code(shop_code);
		menuService.menuRegist(menuRegistVO,radioMenuVOList,checkMenuVOList);
		
		return "redirect:list";
	}
	
	// 메뉴 수정(post)
	@PostMapping("/update")
	public String update(@ModelAttribute MenuRegistVO menuRegistVO,
					@ModelAttribute RadioMenuVOList radioMenuVOList,
					@ModelAttribute CheckMenuVOList checkMenuVOList,
					@RequestParam int menu_code,
					HttpSession session
			) throws IllegalStateException, IOException {
		int shop_code = (int)session.getAttribute("shop_code");
		menuRegistVO.setShop_code(shop_code);
		
		menuService.menuUpdate(menu_code, menuRegistVO,radioMenuVOList,checkMenuVOList);
		
		return "redirect:list";
	}
	
	// 메뉴카테고리 관리 이동
	@GetMapping("/category")
	public String category(Model model,HttpSession session) {
		int shop_code = (int)session.getAttribute("shop_code");
		model.addAttribute("cat_list",categoryDao.getMenuCategory(shop_code));
		return "admin/shop/menu/category";
	}
	
	// 메뉴카테고리 수정/등록
	@PostMapping("/category")
	public String registCategory(Model model, HttpSession session,
			@ModelAttribute FoodCategoryList food_list) {
		int shop_code = (int)session.getAttribute("shop_code");
		categoryService.updateMenuCategory(food_list,shop_code);
		return "redirect:list";
	}
	
	// 메뉴 삭제버튼 클릭시
	@GetMapping("/delete_menu")
	@ResponseBody
	public String deleteMenu(@RequestParam int menu_code) {
		menuService.deleteMenu(menu_code);
		return "삭제되었습니다.";
	}
	
	// 메뉴 상세화면 이동
	@GetMapping("/detail")
	public String detail(@RequestParam int menu_code,
						 Model model,HttpSession session) {
		int shop_code = (int)session.getAttribute("shop_code");
		// 메뉴코드 넘기기
		model.addAttribute("menu_code", menu_code);
		
		// 메뉴정보 조회
		model.addAttribute("menuDto", menuDao.getMenuInfo(menu_code));
		
		// food_category 목록 조회
		model.addAttribute("food_category", categoryDao.getFoodCategoryList());
		
		// menu_category 목록 조회
		model.addAttribute("menu_category", categoryDao.getMenuCategory(shop_code));
		
		// 메뉴 기본정보 조회(food_cat, menu_cat, menu_name, menu_price, 이미지)
		model.addAttribute("menuDetailVO", menuService.getMenuDetailInfo(shop_code,menu_code));
		
		//서브메뉴제목 조회
		model.addAttribute("sub_title", menuService.getSubTitle(shop_code,menu_code));
		
		//필수메뉴목록 조회
		model.addAttribute("radio_list", menuDao.getSubMenuRadioList(shop_code,menu_code));
		
		//선택메뉴목록 조회
		model.addAttribute("check_list", menuDao.getSubMenuCheckList(shop_code,menu_code));
		
		return "admin/shop/menu/detail";
	}
}
