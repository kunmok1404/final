package com.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// 메인화면
@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "client/home";
	}

}
