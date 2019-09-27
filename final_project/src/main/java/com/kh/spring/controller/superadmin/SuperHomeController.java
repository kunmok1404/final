package com.kh.spring.controller.superadmin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.MenuDao;
import com.kh.spring.repository.NoticeDao;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.AdminService;
import com.kh.spring.service.MemberService;
import com.kh.spring.service.MenuService;
import com.kh.spring.service.SuperHomeService;
import com.kh.spring.vo.MemberInfoVO;
import com.kh.spring.vo.ShopMenuVO;

// 슈퍼관리자
@Controller
@RequestMapping("/super_admin")
public class SuperHomeController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	OrdersDao orderDao;
	
	@Autowired
	SuperHomeService superHomeService;
	
	@Autowired
	ShopDao shopDao;
	
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
	private NoticeDao noticeDao;
	
	// 메인
	@RequestMapping({"","/"})
	public String home(@RequestParam(value="no", required=false)  String no,
			@RequestParam(required = false) String status,
			@RequestParam(required = false) String grade,
			@RequestParam(required = false) String start_date,
			@RequestParam(required = false) String end_date,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			Model model) {
		//메뉴목록 조회
		List<ShopMenuVO> all = menuService.list();
		List<ShopMenuVO> dagi = new ArrayList<ShopMenuVO>();
		List<ShopMenuVO> sus = new ArrayList<ShopMenuVO>();
		for (int i = 0; i < all.size(); i++) {
			if (all.get(i).getApply_status().equals("승인대기")) {
				dagi.add(all.get(i));
			}else if (all.get(i).getApply_status().equals("승인완료")) {
				sus.add(all.get(i));
			}
		}
		
		List<MemberDto> memberall = memberDao.getMemberList() ;
		List<MemberDto> membernagam = new ArrayList<MemberDto>();
		List<MemberDto> memberday = new ArrayList<MemberDto>();
		for (int i = 0; i < memberall.size(); i++) {
			if (memberall.get(i).getStatus().equals("블랙")) {
				membernagam.add(memberall.get(i));
			}else {
				memberday.add(memberall.get(i));
			}
		}
		String today = sqlsession.selectOne("order.today");
		String yesterday = sqlsession.selectOne("order.yesterday");
		String month_ago = sqlsession.selectOne("order.month_ago");
		String week_ago = sqlsession.selectOne("order.week_ago");
		String end=today.substring(0, 10);
		String yesterdaydate=yesterday.substring(0, 10);
		String start=month_ago.substring(0, 10);
		String week_agodate=week_ago.substring(0, 10);
		model.addAttribute("day",superHomeService.today(no, yesterdaydate, end));
		model.addAttribute("month",superHomeService.month(no, start, end));
		model.addAttribute("week",superHomeService.week(no, week_agodate, end));
		model.addAttribute("apply_all",superHomeService.apply_all());
		model.addAttribute("apply_dagi",superHomeService.apply_dagi());
		model.addAttribute("apply_sus",superHomeService.apply_sus());
		model.addAttribute("date_day",superHomeService.date_today(no, yesterdaydate, end));
		model.addAttribute("date_month",superHomeService.date_month(no, start, end));
		model.addAttribute("date_week",superHomeService.date_week(no, week_agodate, end));
		model.addAttribute("memberday", memberday);
		model.addAttribute("membernagam", membernagam);
		model.addAttribute("memberall", memberall);
		model.addAttribute("all", all);
		model.addAttribute("dagi", dagi);
		model.addAttribute("sus", sus);
		
		// 공지사항
		model.addAttribute("notice_List", noticeDao.superHomeNotice());
		
		return "admin/super/home";
	}
	
	@RequestMapping("/date")
	@ResponseBody
	public String date(HttpSession httpsession,Model model) {
		int no = (int) httpsession.getAttribute("member_code");
		MemberInfoVO memberInfoVO = memberService.detail(no);
		
		String week_agodate=memberInfoVO.getLatest_login().substring(0, 16);
		return week_agodate;
	}

	
	
}
