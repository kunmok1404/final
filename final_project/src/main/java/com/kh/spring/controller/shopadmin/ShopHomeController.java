package com.kh.spring.controller.shopadmin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.NoticeDao;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.ShopService;
import com.kh.spring.vo.OrderCountVO;

// 매장관리자
@Controller
@RequestMapping("/shop_admin")
public class ShopHomeController {
	
	@Autowired
	ShopDao shopDao;
	@Autowired
	OrdersDao orderDao;
	@Autowired
	private ShopService shopService;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private NoticeDao noticeDao;

	//메인화면
	@GetMapping({"","/"})
	public String home(Model model) {
		model.addAttribute("notice_List", noticeDao.shopHomeNotice());
		return "admin/shop/home";
	}
	
	// 로그인화면 이동
	@GetMapping("/login")
	public String login() {
		return "admin/shop/login";
	}
	
	//관리 홈에서 받을 정보를 뿌려주는 비동기 컨트롤러
	@GetMapping("/update_orders_status")
	@ResponseBody
	public List<OrderCountVO> getCount(HttpSession session){
		int shop_code = (int)session.getAttribute("shop_code");
		List<OrderCountVO> result = orderDao.getCount(shop_code);
		return result;
	}

}
	





