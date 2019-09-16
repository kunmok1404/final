package com.kh.spring.controller.superadmin;

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
import com.kh.spring.repository.MenuDao;
import com.kh.spring.service.MenuService;
import com.kh.spring.vo.CheckMenuVOList;
import com.kh.spring.vo.MenuRegistVO;
import com.kh.spring.vo.RadioMenuVOList;

@Controller
@RequestMapping("/super_admin/menu")
public class SuperMenuController {

	@Autowired
	private MenuService menuService; 
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private CategoryDao categoryDao;
	
	// 메뉴 목록화면
	@GetMapping("/list")
	public String list(Model model) {
		//메뉴목록 조회
		model.addAttribute("list", menuService.list());
		return "admin/super/menu/list";
	}
	
	// 메뉴 상세화면 이동
		@GetMapping("/detail")
		public String detail(@RequestParam int menu_code,Model model,HttpSession session) {
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
		
		return "admin/super/menu/detail";
	}
	
	// 메뉴 등록화면(get)
	@GetMapping("/regist")
	public String regist() {
		return "admin/super/menu/regist";
	}
	
	// 메뉴 수정(post)
	@PostMapping("/update")
	public String update(@ModelAttribute MenuRegistVO menuRegistVO,
					@ModelAttribute RadioMenuVOList radioMenuVOList,
					@ModelAttribute CheckMenuVOList checkMenuVOList,
					@RequestParam int menu_code,
					@RequestParam int shop_code,
					HttpSession session
			) throws IllegalStateException, IOException {
		menuRegistVO.setShop_code(shop_code);
		
		menuService.menuUpdate(menu_code, menuRegistVO,radioMenuVOList,checkMenuVOList);
		
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
		System.out.println("menu_code="+menu_code);
		menuService.deleteMenu(menu_code);
		return "삭제되었습니다.";
	}
	
}
