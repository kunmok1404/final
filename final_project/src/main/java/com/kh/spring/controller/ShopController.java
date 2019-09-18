package com.kh.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.MenuDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.repository.TermsDao;
import com.kh.spring.service.MenuService;
import com.kh.spring.service.ShopService;

// 매장
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private MenuService menuService;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private TermsDao termsDao;
	@Autowired
	private MemberDao memberDao;
	
	// 매장목록
	@RequestMapping("/list")
	public String list(Model model,@RequestParam int cat_no, @RequestParam(required = false) String keyword) {
		model.addAttribute("cat_no", cat_no);
		model.addAttribute("cat_list", shopDao.catList()); // 음식카테고리 목록
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms2", termsDao.terms2());	
		model.addAttribute("shop_count", shopDao.getShopCount(cat_no)); //매장갯수
		return "client/shop/shop_list";
	}
	
	// 더보기 기능
	@GetMapping("/part")
	public String part(@RequestParam(required = false, defaultValue = "1") int page,
					int cat_no, Model model) {
		int size = 10;
		int end = page * size;
		int start = end - size + 1;
		model.addAttribute("shop_list", shopService.ajaxPaging(start, end, cat_no));
		
		return "client/shop/part";
	}
	
	// 매장상세화면
	@GetMapping("/detail")
	public String detail(@RequestParam int no, Model model) {
		model.addAttribute("cat_list", shopDao.catList()); 
		model.addAttribute("shopDto", shopDao.shopInfo(no));
		model.addAttribute("shopVO", shopService.shopInfoVO(no));
		// 메뉴정보
		model.addAttribute("map", shopService.menuList(no)); 
		// 리뷰정보
		System.out.println("reveiwList="+shopService.reviewList(no));
		model.addAttribute("review_map", shopService.reviewList(no));
		// 약관정보
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms2", termsDao.terms2());	
		model.addAttribute("shop_code", no);
		return "client/shop/shop_detail";
	}
	
	// 메뉴클릭 후 모달창정보
	@GetMapping("/sub_menu")
	public String sub_menu(HttpSession session,
			@RequestParam int menu_code,
			@RequestParam int shop_code,	
			Model model) {
		// 메뉴코드 넘기기
		int member_code = (int) session.getAttribute("member_code");
		model.addAttribute("shop_menu_code",shopDao.getShopCode(member_code));
		model.addAttribute("menu_code", menu_code);
		model.addAttribute("map", shopService.sub_menu(menu_code));
		model.addAttribute("menuDto",shopDao.menuName(menu_code));
		model.addAttribute("list", shopDao.subMenuList(menu_code));
		
		//서브메뉴제목 조회
		model.addAttribute("sub_title", menuService.getSubTitle(shop_code,menu_code));
				
		//필수메뉴목록 조회
		model.addAttribute("radio_list", menuDao.getSubMenuRadioList(shop_code,menu_code));
				
		//선택메뉴목록 조회
		model.addAttribute("check_list", menuDao.getSubMenuCheckList(shop_code,menu_code));
		return "client/shop/sub_menu";
	}

	// 입점문의 페이지
	@GetMapping("/explan")
	public String explan(Model model) {
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms2", termsDao.terms2());	
		return "client/order/shop_explan";
	}
	

	// 입점문의 신청페이지(get)
	@GetMapping("/shop_regist")
	public String order_regist(Model model) {
		model.addAttribute("category", shopDao.catList());
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms2", termsDao.terms2());	
		return "client/order/shop_regist";
	}

	// 입점문의 신청페이지(post)
	@PostMapping("/shop_regist")
	public String order_regist(
								@ModelAttribute ShopDto shopDto,
								@ModelAttribute MemberDto memberDto,
								@RequestParam MultipartFile business_regist,
								@RequestParam MultipartFile sale_regist,
								@RequestParam MultipartFile logo) throws IllegalStateException, IOException {
		
		// shop_code 생성
		int shop_code = shopDao.getShopSeq();
		memberDto.setShop_code(shop_code);
		shopDto.setNo(shop_code);
		
		//memberDto 안에 있는 pw를 변경(BCrypt)
		String origin = memberDto.getPw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		memberDto.setPw(encrypt);
		
		// 회원가입(승인상태는 '승인대기'로)
		memberDao.shopMemberApply(memberDto);
		
		// 매장정보 등록
		shopService.regist(shopDto,business_regist,sale_regist,logo);
		
		return "client/order/shop_regist_result";
		
	}
}
