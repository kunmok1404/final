package com.kh.spring.controller.shopadmin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.MenuDao;
import com.kh.spring.repository.NoticeDao;
//github.com/kunmok1404/final
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.AdminService;
import com.kh.spring.service.MemberService;
import com.kh.spring.service.MenuService;
import com.kh.spring.service.ShopService;
import com.kh.spring.service.SuperHomeService;
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
	private NoticeDao noticeDao;
	@Autowired
	AdminService adminService;	
	@Autowired
	private MenuService menuService; 
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	private SuperHomeService superHomeService;
	//메인화면
	@GetMapping({"","/"})
	public String home(HttpSession httpsession,
			@RequestParam(required = false) String status,
			@RequestParam(required = false) String grade,
			@RequestParam(required = false) String start_date,
			@RequestParam(required = false) String end_date,
			@RequestParam(required = false) String sale_status,
			@RequestParam(required = false) String apply_status,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			Model model) {
		
		String no = String.valueOf(httpsession.getAttribute("shop_code"));
		int shop_code = (int)httpsession.getAttribute("shop_code");			
				String today = sqlsession.selectOne("order.today");
				String yesterday = sqlsession.selectOne("order.yesterday");
				String month_ago = sqlsession.selectOne("order.month_ago");
				String week_ago = sqlsession.selectOne("order.week_ago");
				String end=today.substring(0, 10);
				String yesterdaydate=yesterday.substring(0, 10);
				String start=month_ago.substring(0, 10);
				String week_agodate=week_ago.substring(0, 10);
				
				model.addAttribute("notice_List", noticeDao.shopHomeNotice());
				model.addAttribute("day",superHomeService.today(no, yesterdaydate, end));
				model.addAttribute("month",superHomeService.month(no, start, end));
				model.addAttribute("week",superHomeService.week(no, week_agodate, end));
				
				model.addAttribute("date_day",superHomeService.date_today(no, yesterdaydate, end));
				model.addAttribute("date_month",superHomeService.date_month(no, start, end));
				model.addAttribute("date_week",superHomeService.date_week(no, week_agodate, end));
				//메뉴 정보
				model.addAttribute("all", superHomeService.shopMenuCount_all(shop_code));
				model.addAttribute("dagi", superHomeService.shopMenuCount_dagi(shop_code));
				model.addAttribute("sus", superHomeService.shopMenuCount_sus(shop_code));
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
	





