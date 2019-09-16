package com.kh.spring.controller.superadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.entity.ReviewDto;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ReviewDao;
import com.kh.spring.service.OrderService;
import com.kh.spring.service.ReviewService;

@Controller
@RequestMapping("/super_admin/review")
public class SuperReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private OrderService orderService;
	
	//리뷰 목록
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", reviewService.superList());//리뷰목록
		model.addAttribute("search_number",reviewDao.searchNumber()); //리뷰갯수
		return "admin/super/review/list";
	}
	
	//리뷰 상세화면
	@GetMapping("/detail")
	public String content(Model model, @RequestParam int review_code) {
		//리뷰정보 조회
		ReviewDto reviewDto = reviewService.reviewInfo(review_code);
		model.addAttribute("reviewDto", reviewDto);
		//매장정보 조회
		model.addAttribute("shopDto", orderService.orderInfo(reviewDto.getOrder_code()));
		// 주문상세 목록
		//model.addAttribute("order_detail_list",ordersDao.myOrderDetailList(reviewDto.getOrder_code()));
		// 주문정보
		model.addAttribute("orderDto", ordersDao.orderInfo(reviewDto.getOrder_code()));
		// 주문메뉴명
//		model.addAttribute("order_distinct", ordersDao.orderDistinct(reviewDto.getOrder_code()));
		model.addAttribute("order_code",reviewDto.getOrder_code());
		// 이미지코드 조회
		model.addAttribute("img_list", reviewDao.reviewImg(review_code));
		return "admin/super/review/detail";
	}
	
	// 리뷰 답변 등록
	@PostMapping("/reply")
	@ResponseBody
	public String reply(Model model, @RequestParam int review_code,
			@RequestParam String review_content) {
		// 답변 등록
		reviewService.replyRegist(ReviewDto.builder().no(review_code).reply_content(review_content).build());
		// 답변 조회
		ReviewDto reviewDto = reviewDao.reviewInfo(review_code);
		return reviewDto.getReply_content();
	}
}
