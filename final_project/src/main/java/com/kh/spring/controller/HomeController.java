package com.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

// 메인화면
@Controller
public class HomeController {
	
	//메인화면 이동
	@GetMapping({"","/"})
	public String home(Model model) {
		return "client/home";
	}

}
