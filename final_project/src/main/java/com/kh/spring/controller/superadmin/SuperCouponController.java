package com.kh.spring.controller.superadmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.CouponDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.repository.CouponDao;
import com.kh.spring.repository.MemberDao;
@Controller
@RequestMapping("/super_admin/coupon")
public class SuperCouponController {

	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private MemberDao memberDao;
	
	// 쿠폰 등록
	@GetMapping("/regist")
	public String regist() {
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
		public String all(@RequestParam int coupon_code) {
			System.out.println(coupon_code);
			List<MemberDto> list = memberDao.member_code();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getNo());
				couponDao.all(list.get(i).getNo(), coupon_code);
			}
		return "admin/super/promotion/coupon_list";
	}
	
}
