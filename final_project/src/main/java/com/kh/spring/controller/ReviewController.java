package com.kh.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ReviewImgDto;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ReviewDao;
import com.kh.spring.service.OrderService;
import com.kh.spring.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ReviewService reviewService;
	
	//나의 리뷰 목록
	@GetMapping("/list")
	public String my_review(HttpSession session,Model model) {
		//int member_code = (int)session.getAttribute("member_code");
		int member_code = 1;
		model.addAttribute("list", reviewService.list(member_code));
		return "client/member/info_review_list";
	}
	
	// 나의 리뷰 작성화면(get)
	@GetMapping("/write")
	public String review_regist(Model model, @RequestParam int order_code) {
		//매장정보 조회
		model.addAttribute("shopDto", orderService.orderInfo(order_code));
		// 주문상세 목록
		model.addAttribute("order_detail_list",ordersDao.myOrderDetailList(order_code));
		// 주문정보
		model.addAttribute("orderDto", ordersDao.orderInfo(order_code));
		// 주문메뉴명
		model.addAttribute("order_distinct", ordersDao.orderDistinct(order_code));
		model.addAttribute("order_code",order_code);
		return "client/member/info_review_write";
	}
	
	@PostMapping("/write")
	// 나의 리뷰 등록(post)
	public String review_regist(@ModelAttribute ReviewDto reviewDto,
			@RequestParam List<MultipartFile> images,
			@RequestParam int order_code,
			HttpSession session, Model model) throws IllegalStateException, IOException {
		//int member_code = (int)session.getAttribute("member_code");
		int member_code = 1;
		reviewDto.setMember_code(member_code);
		reviewDto.setOrder_code(order_code);
		
		// 리뷰정보 등록
		int review_no = reviewService.ReviewRegist(reviewDto);
		reviewDto.setNo(review_no);
		
		//images의 정보를 꺼내어 DB에 저장하면서 파일로도 저장
		for(MultipartFile file : images) {
			reviewService.fileRegist(file, reviewDto);
		}
		model.addAttribute("review_no",review_no);
		return "redirect:content";
	}
	
	@GetMapping("/content")
	// 나의 리뷰 상세
	public String review_detail(@RequestParam int review_code, Model model) {
		//리뷰정보 조회
		ReviewDto reviewDto = reviewService.reviewInfo(review_code);
		model.addAttribute("reviewDto", reviewDto);
		//매장정보 조회
		model.addAttribute("shopDto", orderService.orderInfo(reviewDto.getOrder_code()));
		// 주문상세 목록
		model.addAttribute("order_detail_list",ordersDao.myOrderDetailList(reviewDto.getOrder_code()));
		// 주문정보
		model.addAttribute("orderDto", ordersDao.orderInfo(reviewDto.getOrder_code()));
		// 주문메뉴명
		model.addAttribute("order_distinct", ordersDao.orderDistinct(reviewDto.getOrder_code()));
		model.addAttribute("order_code",reviewDto.getOrder_code());
		// 이미지코드 조회
		model.addAttribute("img_list", reviewDao.reviewImg(review_code));
		return "client/member/info_review_content";
	}
	
	// 리뷰이미지 불러오기
	@GetMapping("/review_img")
		public ResponseEntity<ByteArrayResource> reviewImg(
						@RequestParam int files_code) throws IOException{
		return reviewService.reviewImg(files_code);
		}
	
	// 리뷰 수정
	@GetMapping("/edit")
	public String edit(@RequestParam int review_code,Model model) {
		
		return "";
	}
	
}
