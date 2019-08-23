package com.kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.entity.ReviewDto;
import com.kh.spring.repository.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	//나의 리뷰 목록
	@GetMapping("/info_review_list")
	public String my_review(Model model) {
		model.addAttribute("list", reviewDao.list());
		return "client/member/info_review_list";
	}
	
	// 나의 리뷰 작성화면(get)
	@GetMapping("info_review_regist")
	public String review_regist() {
		
		return "client/member/info_review_regist";
	}
	
	@PostMapping("info_review_content")
	// 나의 리뷰 등록(post)
	public String review_regist(@ModelAttribute ReviewDto reviewDto,Model model) {
		reviewDao.regist(reviewDto);
		return "client/member/info_review_content";
	}
	
	@GetMapping("info_review_detail")
	// 나의 리뷰 상세
	public String review_detail() {
		
		return "client/member/info_review_detail";
	}
	
}
