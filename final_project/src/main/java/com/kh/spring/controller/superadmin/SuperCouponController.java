package com.kh.spring.controller.superadmin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.CouponDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.UsergradeDto;
import com.kh.spring.repository.CouponDao;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.vo.MemberInfoVO;
@Controller
@RequestMapping("/super_admin/coupon")
public class SuperCouponController {

	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSession sqlsession;
	
	// 쿠폰 등록
	@GetMapping("/regist")
	public String regist(Model model) {
		List<UsergradeDto> grade = sqlsession.selectList("member.usergrade"); 
		model.addAttribute("grade",grade);
		return "admin/super/promotion/coupon_regist";
	}
	
	// 쿠폰 등록
	@PostMapping("/regist")
	public String regist(CouponDto couponDto) {
		couponDao.regist(couponDto);
		return "admin/super/promotion/coupon_regist";
	}
	
	// 쿠폰 목록
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("coupon",couponDao.getCoupon());
		return "admin/super/promotion/coupon_list";
	}
	
	// 발급 중지
		@GetMapping("/stop")
		public String stop(@RequestParam int no) {
			couponDao.finish(no);
			return "admin/super/promotion/coupon_list";
		}
	// 전체 발급
		@GetMapping("/all")
		public String all(@RequestParam int coupon_code,String start_date,String finish_date) {
			List<MemberDto> list = memberDao.member_code();
			for (int i = 0; i < list.size(); i++) {
				couponDao.all(list.get(i).getNo(), coupon_code,start_date,finish_date);
			}
		return "admin/super/promotion/coupon_list";
	}
		
	//회원 목록(회원 검색 기능)
	//목표 : 회원 검색어를 받아서 검색한 뒤 목록을 전달
	@GetMapping("/search")
	public String search(
			@RequestParam(required = false) String status,
			@RequestParam(required = false) String grade,
			@RequestParam(required = false) String start_date,
			@RequestParam(required = false) String end_date,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false) String coupon_code,
			@RequestParam(required = false, defaultValue = "1")int page,
			Model model
			) {
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		int count = memberDao.memberCount(status,grade,type, keyword,start_date,end_date);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		List<MemberInfoVO> list = memberDao.search(status, grade, start_date, end_date, type, keyword,start,end);
		model.addAttribute("coupon_code", coupon_code);
		model.addAttribute("list", list);
		return "admin/super/promotion/search";
	}	
	
	@PostMapping("/search")
	public String search(
			@RequestParam(required = false) int coupon_code,
			@RequestParam String member_code,
			@RequestParam(required = false)String start_date,
			@RequestParam(required = false)String finish_date
			) {
		String[] test = member_code.split(",");
		for (int i = 0; i < test.length; i++) {		
			int no = Integer.parseInt(test[i]);
			couponDao.all(no, coupon_code,start_date,finish_date);
		}
		return "redirect:/super_admin/coupon/list";
	}	
}
