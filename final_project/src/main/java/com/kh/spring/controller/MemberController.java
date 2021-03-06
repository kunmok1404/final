package com.kh.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.entity.CertDto;
import com.kh.spring.entity.CouponDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MyshopDto;
import com.kh.spring.entity.OrderDetailDto;
import com.kh.spring.entity.OrderSubDetail;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.CertDao;
import com.kh.spring.repository.CouponDao;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.repository.TermsDao;
import com.kh.spring.service.EmailService;
import com.kh.spring.service.OrderService;
import com.kh.spring.service.PointService;
import com.kh.spring.service.ReviewService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private EmailService emailService;
	@Autowired
	private OrderService oderService;
	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private TermsDao termsDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private PointService pointService;
	@Autowired
	private SqlSession sqlsession;
	
	// 회원가입 기능(GET)
	@GetMapping("/regist")
	public String regist(
				Model model
			) {
		
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms1", termsDao.terms2());
		
		return "client/member/regist";
	}

	// 회원가입 기능(POST)
	@PostMapping("/regist")
	public String regist(
				@ModelAttribute MemberDto memberDto
			) {
		//memberDto 안에 있는 pw를 변경(BCrypt)
		String origin = memberDto.getPw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		memberDto.setPw(encrypt);

		boolean result = memberDao.regist(memberDto);
		if (result) {
			MemberDto mdto = memberDao.id_check(memberDto.getId());
			List<CouponDto> coupon = sqlsession.selectList("coupon.couponregist");
			if (coupon != null) {
				String sysdate = sqlsession.selectOne("coupon.sysdate");
				Map<String, Object> map = new HashMap<>();
				for (int i = 0; i < coupon.size(); i++) {					
					map.put("period", coupon.get(i).getPeriod());
					String period = sqlsession.selectOne("coupon.period", map);
					couponDao.auto(mdto.getNo(), coupon.get(i).getNo(),sysdate,period);
				}
			}
			return "redirect:regist_result";
		} 
		else {
			return "redirect:regist_fail";
		}
	}

	// 회원가입 성공 시 성공페이지로 넘기기
	@GetMapping("/regist_result")
	public String regist_result() {
		return "client/member/regist_result";
	}

	// 회원가입 실패 시 실패 페이지로 넘기기
	@GetMapping("/regist_fail")
	public String regist_fail() {
		return "client/member/regist_fail";
	}

	// 아이디 중복확인 체크
	@GetMapping("/id_check")
	public void id_check(
				@RequestParam String id, 
				HttpServletResponse resp
			) throws IOException {
		resp.setContentType("text/plain");
		MemberDto mdto = memberDao.id_check(id);
		if (mdto == null) {
			resp.getWriter().print("Y");
		} 
		else {
			resp.getWriter().print("N");
		}
	}

	// 로그인(GET)
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("terms1", termsDao.terms1());
		model.addAttribute("terms1", termsDao.terms2());
		return "client/member/login";
	}

	// 로그인(POST)
	@PostMapping("/login")
	public String login(
				@ModelAttribute MemberDto memberDto,
				@RequestParam(required=false) String remember,
				HttpSession session,
				HttpServletResponse response
			) {
		//암호화 적용 후
		// 1. id를 DB에서 회원정보를 불러온다.
		MemberDto result = memberDao.get(memberDto.getId());
		if(result != null) {
			// 2. BCrypt의 비교명령을 이용하여 비교 후 처리
			//입력한 비밀번호
			//암호화된 비밀번호
			//로그인 성공 여부
			boolean ok = BCrypt.checkpw(memberDto.getPw(), result.getPw());
			if(BCrypt.checkpw(memberDto.getPw(), result.getPw())) {
				session.setAttribute("member_code", result.getNo());
				if(result.getShop_code() > 0) {
					session.setAttribute("shop_code", result.getShop_code());
				}
				if(result.getType().equals("관리자")) {
					session.setAttribute("member_type", result.getType());
				}
				
				// 아이디 저장
				//쿠키 객체를 만들고 체크 여부에 따라 시간 설정 후 response에 추가
				Cookie cookie = new Cookie("saveID", memberDto.getId());
				if(remember == null) {//체크 안했을 때
					cookie.setMaxAge(0);
				}
				else {//체크 했을 때
					cookie.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				}
				
				response.addCookie(cookie);
				return "redirect:/";			
			}
			else {
				return "client/member/login_fail";
			}
		}
		else {
			return "client/member/login_fail";
		}
	}
	
	// 테스트 로그인
	@GetMapping("/testLogin")
	public String testLogin(HttpSession session) {
		MemberDto result = memberDao.get("whehdrms");
		System.out.println("result="+result);
		session.setAttribute("member_code", result.getNo());
		return "redirect:/";
	}
	
	//로그아웃 기능
	@GetMapping("/logout")
	public String logout(
				HttpSession session
			) {//데이터 받아와서 지우기
		session.removeAttribute("member_code");
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
	@PostMapping("/find_id")
	public String findId(
				@ModelAttribute MemberDto memberDto
			) throws MessagingException {
		boolean exist = memberDao.findId(memberDto);
		if(exist) {
			emailService.sendCertificationid(memberDto.getId());
			return "redirect:find_id_result";//새로운 기능으로 전송(?이게 뭐야?)
		}
		else {
			return "redirect:find_id?error";//실패시 오류
		}
	}
	
	//아이디 찾기 결과
	@GetMapping("/find_id_result")
	public String findIdResult() {
		return "client/member/find_id_result";
	}
	
	
	
	//비밀번호 찾기 기능(GET)
	//목표 : 아이디, 이메일 정보 입력 페이지로 전달
	@GetMapping("/find_pw")
	public String findPw() {
		return "client/member/find_pw";
	}
	
	//비밀번호 찾기 기능(POST)
	//목표 : 전달받은 정보(아이디, 이메일)를 조회하여 일치할 경우 이메일로 아이디 전송
	@PostMapping("/find_pw")
	public String findPw(
				@ModelAttribute MemberDto memberDto
			) throws MessagingException {
		boolean exist = memberDao.findPw(memberDto);
		if(exist) {
//			emailService.sendCertificationpw(memberDto.getEmail());
			emailService.find_pw(memberDto);
			return "redirect:find_pw_result";
		}
		else {
			return "redirect:find_pw?error";//실패시 오류
		}
	}
	
	//비밀번호 찾기 결과
	@GetMapping("/find_pw_result")
	public String findPwResult() {
		return "client/member/find_pw_result";
	}
	
	
	//참고
//	@PostMapping("find_pw")
//	public String findpw(
//				@ModelAttribute MemberDto memberDto,
//				Model model
//			) {
//		MemberDto memberDto = memberDao.findPassword(memberDto);
//		if(memberDto != null) {
//			emailService.find_pw(memberDto);
//			return "redirect:find_pw_result";
//		}
//		else {
//			model.addAttribute("error", "error");
//			return "redirect:find_pw?";
//		}
//	}
//	
//	@GetMapping("/find_pw_result")
//	public String findpwresult() {
//		return "member/find_pw_result";
//	}
	
	
	
	
	//
	
	
	@Autowired
	private CertDao certDao;
	
	//비밀번호 변경 처리(GET)
	//목표 : 입력페이지로 전달
	@GetMapping("/new_pw")
	public String newPw(
				@RequestParam String email, 
				@RequestParam String no, 
				Model model, 
				HttpServletResponse response
			) throws IOException {
		//검증
		CertDto certDto = CertDto.builder()
									.who(email)
									.no(no)
								.build();
		boolean result = certDao.validate(certDto);
		certDao.delete(certDto);
		
		if(result) {
			model.addAttribute("email", email);
			return "client/member/new_pw";
		}
		else {
			response.sendError(401);
			return null;
		}
	}
	
	//비밀번호 변경 처리(POST)
	//목표 : 변경 처리 수행
	@PostMapping("/new_pw")
	public String newPw(
				@ModelAttribute MemberDto memberDto
			) {
		//비밀번호 암호화 처리(bcrypt)
		String origin = memberDto.getPw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		memberDto.setPw(encrypt);
		
		memberDao.changePw(memberDto);
		return "client/member/new_pw_result";
	}
	
	//회원정보 수정 전 비밀번호 확인
	//아이디를 보여줘야 함
	@GetMapping("/info_check")
	public String info_check(
				HttpSession session,
				Model model
			) {
		//회원번호 받아서 회원정보를 불러와 view에 전달
		int member_code = (int)session.getAttribute("member_code");
		MemberDto memberDto = memberDao.take(member_code);
		model.addAttribute("memberDto", memberDto);
		return "client/member/info_check";
	}
	
	//회원정보 수정 전 비밀번호 확인
	@PostMapping("/info_check")
	public String info_check(
				@ModelAttribute MemberDto memberDto,
				@RequestParam(required=false) String remember,
				HttpSession session,
				HttpServletResponse response
			) {
		//암호화 적용 후
		// 1. id를 DB에서 회원정보를 불러온다.
		MemberDto result = memberDao.get(memberDto.getId());
		// 2. BCrypt의 비교명령을 이용하여 비교 후 처리
		if(BCrypt.checkpw(memberDto.getPw(), result.getPw())) {
			session.setAttribute("member_code", result.getNo());
			return "redirect:info_change";
		}
		else {
			return "client/member/info_check_fail";			
		}
	}

	//내 정보 보기&수정 기능(GET)
	//요청 -> 수정입력 -> 수정처리 -> 내정보
	@GetMapping("/info_change")
	public String info_change(
				HttpSession session,
				Model model
			) {
		int member_code = (int)session.getAttribute("member_code");
		MemberDto memberDto = memberDao.take(member_code);
		model.addAttribute("memberDto", memberDto);
		return "client/member/info_change";
	}
	
	//내 정보 보기&수정 기능(POST)
	@PostMapping("/info_change")
	public String info_change(
				@ModelAttribute MemberDto memberDto			
			) {
		if(memberDto.getPw() != null) {
			String origin = memberDto.getPw();
			String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
			memberDto.setPw(encrypt);
		}
		memberDao.change(memberDto);
		return "redirect:info_change";
	}	
	
	//회원 탈퇴 기능
	//DB에서 데이터 삭제 + 세션 정보 초기화(로그아웃)
	//필요한 객체 : 세션 -> 회원고윧번호(member_code) -> 삭제 ->로그아웃
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		int member_code = (int)session.getAttribute("member_code");
		memberDao.member_delete(member_code);
		session.removeAttribute("member_code");
		return "client/member/delete";
	}
	
	// 나의정보 클릭시 나의주문내역
	@GetMapping("/info_order_list")
	public String infoOrderList(HttpSession session, Model model) {
		int member_code = (int)session.getAttribute("member_code");
		model.addAttribute("order_list",oderService.myOrderList(member_code));
		// 회원정보(상단메뉴용)
		model.addAttribute("memberDto", memberDao.getInfo(member_code));
		// 쿠폰갯수(상단메뉴용)
		model.addAttribute("coupon", couponDao.getCouponCount(member_code));
		// 현재포인트(상단메뉴용)
		model.addAttribute("point", pointService.getMyPoint(member_code));
		return "client/member/info_order_list";
	}
	
	
	// 주문내역 상세화면
	@GetMapping("/info_order_detail")
	public String infoOrderDetail(HttpSession session, Model model,
					@RequestParam int order_code) {
		int member_code = (int)session.getAttribute("member_code");
		// 주문정보
		OrdersDto ordersDto = ordersDao.orderInfo(order_code);
		model.addAttribute("orderDto", ordersDto);
		// 메인메뉴 목록
		List<OrderDetailDto> orderDetailList = ordersDao.myOrderDetailList(order_code);
		model.addAttribute("order_detail_list",orderDetailList);
		// 서브메뉴 목록
		for(OrderDetailDto orderDetailDto : orderDetailList) {
			List<OrderSubDetail> orderSubList = ordersDao.myOrderSubDetailList(orderDetailDto.getNo());
		}
		//model.addAttribute("map", orderService.getOrderSubList());
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
	
	@GetMapping("/like")
	public String like(@RequestParam String shop_code,@RequestParam String member_code) {
		int member = Integer.parseInt(member_code);
		int shop = Integer.parseInt(shop_code);
		memberDao.like(MyshopDto.builder().member_code(member).shop_code(shop).build());
		return "client/shop/shop_detail";
	}
	
	@PostMapping("/like")
	public void like(@ModelAttribute MyshopDto myshopDto) {
		memberDao.like(myshopDto);
	}
	
	
	
	@PostMapping("/unlike")
	public void unlike(@ModelAttribute MyshopDto myshopDto) {
		memberDao.unlike(myshopDto);
	}
	
	@GetMapping("/unlike")
	public String unlike(@RequestParam String shop_code,@RequestParam String member_code) {
		int member = Integer.parseInt(member_code);
		int shop = Integer.parseInt(shop_code);
		memberDao.unlike(MyshopDto.builder().member_code(member).shop_code(shop).build());
		return "client/shop/shop_detail";
	}
	
//	찜한매장 목록 불러오기
	@GetMapping("/myshop")
	public String myshop(Model model,HttpSession session) {
	int member_code = (int) session.getAttribute("member_code");
		
	List<MyshopDto> list = memberDao.myshop(member_code);
	List<Integer> shop_code = new ArrayList<>();
	List<ShopDto> shop = new ArrayList<>();
	for (int i = 0; i < list.size(); i++) {
		shop_code.add(list.get(i).getShop_code());
		for (int j = 0; j < shop_code.size(); j++) {
			shop.add(shopDao.myshop(shop_code.get(j)));
		}
	}
	model.addAttribute("list", list);
	model.addAttribute("shop", shop);
	// 회원정보(상단메뉴용)
	model.addAttribute("memberDto", memberDao.getInfo(member_code));
	// 쿠폰갯수(상단메뉴용)
	model.addAttribute("coupon", couponDao.getCouponCount(member_code));
	// 현재포인트(상단메뉴용)
	model.addAttribute("point", pointService.getMyPoint(member_code));

		return "client/member/myshop";
	}
	
//	메장이미지 불러오기
	@GetMapping("/shop_img")
	public ResponseEntity<ByteArrayResource> shopImg(
					@RequestParam int files_code) throws IOException{
		return reviewService.shopimg(files_code);
	}
	
	// 나의정보 주문취소 클릭시
	@GetMapping("/cancel")
	@ResponseBody
	public String cancel(@RequestParam int order_code) {
		ordersDao.orderCancel(order_code);
		return "주문이 취소되었습니다.";
	}
	
	
	
	
	
	
	
	
}
