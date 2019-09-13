package com.kh.spring.controller.superadmin;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.entity.Pageing;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.AdminService;
import com.kh.spring.service.ShopService;

@Controller
@RequestMapping("/super_admin/shop")
public class SuperShopController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	ShopDao shopDao;
	
	@Autowired
	private ShopService shopService;
	
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
        
		return "admin/super/shop/list";
	}
	
	// 매장관리에서 승인버튼 클릭시
	@GetMapping("/apply")
	@ResponseBody
	public String apply(@RequestParam int shop_code) {
		shopService.apply(shop_code);
		return "승인이 완료되었습니다.";
	}
	
	// 매장관리에서 삭제버튼 클릭시
	@GetMapping("/delete_shop")
	@ResponseBody
	public String delete(@RequestParam int shop_code) {
		shopService.deleteShop(shop_code);
		return "매장이 삭제되었습니다.";
	}
	
	// 매장정보수정
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
        
		return "admin/super/shop/shop_info";
	}
	
	
	@GetMapping("/detail")
	public String detail(
					@RequestParam int no,
					Model model	) {
		model.addAttribute("shop", shopDao.shopInfo(no));
		
		return "admin/super/shop/detail";
	}
	
	//	매장정보수정확인
	@PostMapping("/detail")
	public String shop_info(
				ShopDto shopDto,
				@RequestParam MultipartFile img,
				Model model
			) throws IllegalStateException, IOException {
		shopService.edit(shopDto,img);
		
		model.addAttribute("shop",shopDao.shopInfo(shopDto.getNo()));
		model.addAttribute("no", shopDto.getNo());
		return  "redirect:detail";
	}
	
}
