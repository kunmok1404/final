package com.kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.service.PointService;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	private PointService pointService;
	
	// 포인트 리스트
	@GetMapping("/list")
	public String list(HttpSession session, Model model) {
		int member_code = (int)session.getAttribute("member_code");
		model.addAttribute("point_list", pointService.list(member_code));
		return "client/member/info_point_list";
	}
}
