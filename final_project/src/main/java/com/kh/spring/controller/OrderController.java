package com.kh.spring.controller;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//주문 관련 컨트롤러
import org.springframework.web.client.RestTemplate;

import com.kh.spring.KakaoPay.KakaoPaySuccessVO;
import com.kh.spring.KakaoPay.KakaopayReturnVo;
import com.kh.spring.entity.CartListVO;
import com.kh.spring.entity.OrderDetailListVo;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.repository.OrdersDao;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrdersDao orderDao;
	
	@GetMapping("/cart")
	public String cart(@RequestParam int shop_code, HttpSession session, Model model) {
		int member_code = (int) session.getAttribute("member_code");
		model.addAttribute("shopDto", orderDao.shopInfo(shop_code));
		model.addAttribute("cartDto", orderDao.cartlist(member_code));
		session.setAttribute("shop_code", shop_code);
		session.setAttribute("member_code", member_code);
		return "client/order/cart";
	}

	@PostMapping("/orderinput")
	public String cart(@ModelAttribute CartListVO vo, HttpSession session, Model model, @RequestParam int total_price) {
		int member_code = (int) session.getAttribute("member_code");
		int shop_code = (int) session.getAttribute("shop_code");
		model.addAttribute("shopDto", orderDao.shopInfo(shop_code));
		model.addAttribute("cartList", orderDao.cartlist(member_code));
		model.addAttribute("memberDto", orderDao.memberSearch(member_code));
		model.addAttribute("total_price", total_price);
		orderDao.cartinput(vo);
		session.setAttribute("total_price", total_price);
		return "client/order/order";
	}

	@PostMapping("/credit_order")
	public String order(@ModelAttribute OrdersDto ordersDto, @ModelAttribute OrderDetailListVo vo,
			HttpSession session,Model model) {

		int member_code = (int) session.getAttribute("member_code");
		int shop_code = (int) session.getAttribute("shop_code");
		int total_price = (int) session.getAttribute("total_price");
		int no = orderDao.getseq();
		OrdersDto orderDto = OrdersDto.builder().no(no).member_code(member_code).shop_code(shop_code)
				.request(ordersDto.getRequest()).discount_price(ordersDto.getDiscount_price()).total_price(total_price)
				.pay_method(ordersDto.getPay_method()).build();
		orderDao.orderinput(orderDto);
		orderDao.orderDetailInput(no, vo);
		orderDao.cartDelete(member_code);
		
		model.addAttribute("shop_info", orderDao.shopInfo(shop_code));
		model.addAttribute("orders", orderDao.orderResult(no));
		model.addAttribute("order_detail", orderDao.myOrderDetailList(no));
		model.addAttribute("memberDto", orderDao.memberSearch(member_code));

		return "/client/order/success";
	}

	// 카카오 페이로 결제를 요청 할 경우
	@PostMapping("/kakao")
	public String kakaopay(@RequestParam String item_name, @RequestParam String partner_user_id,
			@RequestParam int total_amount, @ModelAttribute OrdersDto ordersDto, @ModelAttribute OrderDetailListVo vo,
			HttpSession session, Model model) throws URISyntaxException {
		// 미리 구해 올 정보
		int total_price = (int) session.getAttribute("total_price");
		int member_code = (int) session.getAttribute("member_code");
		int shop_code = (int) session.getAttribute("shop_code");
		int no = orderDao.getseq();
		int quantity = orderDao.getQuantity(member_code);

//		사용자가 보낸 정보에 추가 정보를 작성하여 api 호출
//		추가할 정보:가맹점 코드,주문번호,회원id,비과세,성공취소실패주소

//		서버에서 다른 서버를 호출하려면 RestTemplate이 필요
		RestTemplate template = new RestTemplate();
//		template에 headears와 params를 추가하여 전송->응답발생
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 1f9e84a716e8a4d3402e2206a6efad1e");
		headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "1000");// 결제 고유 번호_db저장[취소용]
		params.add("partner_user_id", partner_user_id);// 사용자 PK
		params.add("item_name", item_name);
		params.add("quantity", String.valueOf(quantity));
		params.add("total_amount", String.valueOf(total_amount));
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8082/spring/order/success");
		params.add("cancel_url", "http://localhost:8082/sts27/pay/kakao/fail");
		params.add("fail_url", "http://localhost:8082/sts27/pay/kakao/cancel");
		params.add("shop_code", String.valueOf(shop_code));

//		headers와 params를 합쳐서 전송할 객체를 생성
		HttpEntity<MultiValueMap<String, String>> send = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");

//		전송:반환값을 저장할수 있는 객체가 필요
		KakaopayReturnVo kakaopay = template.postForObject(uri, send, KakaopayReturnVo.class);

//		vo안에 있는 tid를 결제 최종 승인 요청에서 사용할수 있도록 저장하고
//		결제 승인시 나머지를 db에 저장 처리
		session.setAttribute("total_price", total_price);// 총액
		session.setAttribute("shop_code", shop_code);// 샵 코드 저장
		session.setAttribute("member_code", member_code);// 멤버 코드 저장
		session.setAttribute("order_no", no);// 주문 번호 저장
		session.setAttribute("OrderDetailListVo", vo);// 주문 상세정보 저장
		session.setAttribute("ordersDto", ordersDto);
		session.setAttribute("payInfo", kakaopay);
		session.setAttribute("partner_user_id", partner_user_id);

//		결제 페이지로 연동시킴

		return "redirect:" + kakaopay.getNext_redirect_pc_url();
	}

	// 결제에 성공 했을때,받은 데이터를 처리함
	@GetMapping("/success")
	public String success(@RequestParam String pg_token, HttpSession session, Model model) throws URISyntaxException {
		int total_price = (int) session.getAttribute("total_price");
		int shop_code = (int) session.getAttribute("shop_code");
		int no = (int) session.getAttribute("order_no");
		int member_code = (int) session.getAttribute("member_code");
		OrderDetailListVo vo = (OrderDetailListVo) session.getAttribute("OrderDetailListVo");
		OrdersDto ordersDto = (OrdersDto) session.getAttribute("ordersDto");
		OrdersDto orderDto = OrdersDto.builder().no(no).member_code(member_code).shop_code(shop_code)
				.request(ordersDto.getRequest()).discount_price(ordersDto.getDiscount_price()).total_price(total_price)
				.pay_method(ordersDto.getPay_method()).build();
		orderDao.orderinput(orderDto);
		orderDao.orderDetailInput(no, vo);
		orderDao.cartDelete(member_code);

		model.addAttribute("shop_info", orderDao.shopInfo(shop_code));
		model.addAttribute("orders", orderDao.orderResult(no));
		model.addAttribute("order_detail", orderDao.myOrderDetailList(no));
		model.addAttribute("memberDto", orderDao.memberSearch(member_code));

		RestTemplate template = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 1f9e84a716e8a4d3402e2206a6efad1e");
		headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);

		KakaopayReturnVo vo2 = (KakaopayReturnVo) session.getAttribute("payInfo");
		session.removeAttribute("payInfo");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", vo2.getTid());
		params.add("partner_order_id", "1000");
		params.add("partner_user_id", (String) session.getAttribute("partner_user_id"));
		params.add("pg_token", pg_token);

		HttpEntity<MultiValueMap<String, String>> send = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");

//최종 승인 요청
		KakaoPaySuccessVO success = template.postForObject(uri, send, KakaoPaySuccessVO.class);

//success에 들어있는 정보를 db에 저장하고 사용자에게 알려줄 정보를 전달

		model.addAttribute("success", success);

		return "/client/order/success";
	}
	
	@GetMapping("card_success")
	public String card_success(HttpSession session, Model model) {
		int total_price = (int) session.getAttribute("total_price");
		int shop_code = (int) session.getAttribute("shop_code");
		int no = (int) session.getAttribute("order_no");
		int member_code = (int) session.getAttribute("member_code");
		OrderDetailListVo vo = (OrderDetailListVo) session.getAttribute("OrderDetailListVo");
		OrdersDto ordersDto = (OrdersDto) session.getAttribute("ordersDto");
		OrdersDto orderDto = OrdersDto.builder().no(no).member_code(member_code).shop_code(shop_code)
				.request(ordersDto.getRequest()).discount_price(ordersDto.getDiscount_price()).total_price(total_price)
				.pay_method(ordersDto.getPay_method()).build();
		orderDao.orderinput(orderDto);
		orderDao.orderDetailInput(no, vo);
		orderDao.cartDelete(member_code);
		
		model.addAttribute("shop_info", orderDao.shopInfo(shop_code));
		model.addAttribute("orders", orderDao.orderResult(no));
		model.addAttribute("order_detail", orderDao.myOrderDetailList(no));
		model.addAttribute("memberDto", orderDao.memberSearch(member_code));
		
		return "/client/order/success";
	}

}
