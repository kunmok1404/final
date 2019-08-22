package com.kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.entity.MyshopDto;
import com.kh.spring.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberDao memberDao;
	
	@PostMapping("/like")
	public void like(@ModelAttribute MyshopDto myshopDto) {
		memberDao.like(myshopDto);
	}
	
	
	@PostMapping("/unlike")
	public void unlike(@ModelAttribute MyshopDto myshopDto) {
		memberDao.unlike(myshopDto);
	}
}
