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

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.FilesDao;
import com.kh.spring.repository.MenuDao;
import com.kh.spring.service.MenuService;
import com.kh.spring.vo.CheckMenuVOList;
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
	
	// 메뉴 목록화면
	@GetMapping("/list")
	public String list(HttpSession session, Model model) {
		//메뉴목록 조회
		//int member_code = (int)session.getAttribute("member_code");
		int member_code = 64;
		model.addAttribute("list", menuService.shopMenuList(member_code));
		return "admin/shop/menu/list";
	}
	
	// 메뉴등록화면 이동
	@GetMapping("/regist")
	public String regist(HttpSession session, Model model) {
		//int shop_code = (int)session.getAttribute("shop_code");
		int shop_code = 1;
		// Food_categry 조회
		model.addAttribute("food_list", categoryDao.getFoodCategoryList());
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
		//int shop_code = (int)session.getAttribute("shop_code");
		int shop_code = 1;
		menuRegistVO.setShop_code(shop_code);
		menuService.menuRegist(menuRegistVO,radioMenuVOList,checkMenuVOList);
		
		return "redirect:list";
	}
	
	// 메뉴 승인버튼 클릭
	@GetMapping("/apply_menu")
	@ResponseBody
	public String applyMenu(@RequestParam int menu_code) {
		menuDao.applyMenu(menu_code);
		return "승인이 완료되었습니다.";
	}
	
	// 메뉴 삭제버튼 클릭시
	@GetMapping("/delete_menu")
	@ResponseBody
	public String deleteMenu(@RequestParam int menu_code) {
		menuDao.deleteMenu(menu_code);
		return "삭제되었습니다.";
	}
	
	// 메뉴 상세화면
	@GetMapping("/detail")
	public String detail(@RequestParam int menu_code,Model model,HttpSession session) {
		//int shop_code = (int)session.getAttribute("shop_code");
		int shop_code = 1;
		
		// 메뉴 기본정보 조회(food_cat, menu_cat, menu_name, menu_price)
		MenuDto menuDto = menuDao.getMenuInfo(shop_code,menu_code);
		
		// 메뉴 이미지정보 조회(목록이미지 + 상세이미지)
		//FilesDto filesDto = filesDao.getFilesInfo();
		
		// 추가메뉴정보 조회
		
		return "admin/shop/menu/detail";
	}
}