package com.kh.spring.controller.superadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.UsergradeDto;
import com.kh.spring.repository.MemberDao;

@Controller
@RequestMapping("/super_admin/member")
public class SuperMemberController {
	
	@Autowired
	MemberDao memberDao;
	
	@GetMapping("/usergrade")
	public String grade(Model model) {
		model.addAttribute("grade", memberDao.grade());
		return "admin/super/member/setgrade";
	}
	
	@PostMapping("/usergrade_edit")
	public String grade(
						Model model,
						@RequestParam String name1,
						@RequestParam String name2,
						@RequestParam String name3,
						@RequestParam String min_order1,
						@RequestParam String min_order2,
						@RequestParam String max_order2,
						@RequestParam String max_order3){
		memberDao.usergrade_edit1(name1, min_order1);
		memberDao.usergrade_edit2(name2, min_order2,max_order2);
		memberDao.usergrade_edit3(name3, max_order3);
		
		model.addAttribute("grade", memberDao.grade());
		return "admin/super/member/setgrade";
	}
	
	
	
	
}
