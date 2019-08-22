package com.kh.spring.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MyshopDto;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.OrderService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private OrderService oderService;
	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private ShopDao shopDao;

	// 회원가입(GET)
	@GetMapping("/regist")
	public String regist() {
		return "client/member/regist";
	}

	// 회원가입(POST)
	@PostMapping("/regist")
	public String regist(@ModelAttribute MemberDto memberDto) {
		boolean result = memberDao.regist(memberDto);
		System.out.println(result);
		if (result) {
			return "redirect:regist_result";
		} 
		else {
			return "redirect:regist_fail";
		}
	}

	@GetMapping("/regist_result")
	public String regist_result() {
		return "client/member/regist_result";
	}

	@GetMapping("/regist_fail")
	public String regist_fail() {
		return "client/member/regist_fail";
	}

	@GetMapping("/id_check")
	public void id_check(@RequestParam String id, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		MemberDto mdto = memberDao.id_check(id);
		if (mdto == null) {
			resp.getWriter().print("Y");
			System.out.println("Y");
		} 
		else {
			resp.getWriter().print("N");
			System.out.println("N");
		}
	}

	@GetMapping("/login")
	public String login() {
		return "client/member/login";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto memberDto, @RequestParam(required = false) String remember,
			HttpSession session, HttpServletResponse response,Model model) {
		MemberDto result = memberDao.login(memberDto);
		if (result != null) {
			session.setAttribute("member_code", result.getNo());
			session.setAttribute("type", result.getType());
			
			// 아이디 저장
			// 쿠키 객체를 만들고 체크 여부에 따라 시간 설정 후 response에 추가
			Cookie cookie = new Cookie("saveID", memberDto.getId());
			if (remember == null) {
				cookie.setMaxAge(0);
			} 
			else {
				cookie.setMaxAge(4 * 7 * 24 * 60 * 60);
			}

			response.addCookie(cookie);
			return "redirect:/";
		} 
		else {
			model.addAttribute("fail", "fail");
			return "client/member/login";
		}
	}
	
	//로그아웃 기능
	@GetMapping("/logout")
	public String logout(HttpSession session) {//데이터 받아와서 지우기
		session.removeAttribute("member_code");
		session.removeAttribute("type");
		return "redirect:/";
	}

	//아이디 찾기 기능(GET)
	//목표 : 아이디 찾기 위한 정보 입력 페이지로 전달
	@GetMapping("/find_id")
	public String findId() {
		return "client/member/find_id";
	}
	
	//아이디 찾기 기능(POST)
	//목표 : 입력받은 이메일정보를 조회하고 일치할 경우 이메일로 아이디 전송
	//	일치하지 않을 경우 alert으로 실패 메세지 노출
//	@PostMapping("/find_id")
//	public String findId(@ModelAttribute MemberDto memberDto) {
//		boolean exist = memberDao.find
//	}

	// 나의정보 클릭시 나의주문내역
	@GetMapping("/info_order_list")
	public String infoOrderList(HttpSession session, Model model) {
		//int member_code = (int)session.getAttribute("member_code");
		int member_code = 1;
		model.addAttribute("order_list",oderService.myOrderList(member_code));
		return "client/member/info_order_list";
	}
	
	//비밀번호 찾기 기능
	
	// 주문내역 상세화면
	@GetMapping("/info_order_detail")
	public String infoOrderDetail(HttpSession session, Model model,
					@RequestParam int order_code) {
		//int member_code = (int)session.getAttribute("member_code");
		int member_code = 1;
		// 주문상세 목록
		model.addAttribute("order_detail_list",ordersDao.myOrderDetailList(order_code));
		// 주문정보
		OrdersDto ordersDto = ordersDao.orderInfo(order_code);
		model.addAttribute("orderDto", ordersDto);
		// 주문메뉴명
		model.addAttribute("order_distinct", ordersDao.orderDistinct(order_code));
		// 매장정보
		ShopDto shopDto = shopDao.shopInfo(ordersDto.getShop_code());
		model.addAttribute("shopDto",shopDto);
		// 회원정보
		model.addAttribute("memberDto", memberDao.getInfo(member_code));
		// 총 결제금액
		int final_price = ordersDto.getTotal_price() - ordersDto.getDiscount_price() + shopDto.getDelivery_price();
		model.addAttribute("final_price",final_price);
		return "client/member/info_order_detail";
	}

	@PostMapping("/like")
	public void like(@ModelAttribute MyshopDto myshopDto) {
		memberDao.like(myshopDto);
	}
	
	@PostMapping("/unlike")
	public void unlike(@ModelAttribute MyshopDto myshopDto) {
		memberDao.unlike(myshopDto);
	}
}
