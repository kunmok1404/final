package com.kh.spring.controller.superadmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.PointDetailDto;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.PointDao;
import com.kh.spring.service.PointService;

@RequestMapping("/super_admin/point")
@Controller
public class SuperPointController {

	@Autowired
	private PointService pointService;
	@Autowired
	private PointDao pointDao;
	@Autowired
	private MemberDao memberDao;
	
	// 포인트 목록
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("point_list", pointService.getPointList());
		return "admin/super/promotion/point_list";
	}
	
	// 포인트 증정
	@PostMapping("/send_point")
	public String sendPoint(
			@ModelAttribute PointDetailDto pointDto) {
		System.out.println("pointDto="+pointDto);
		pointDao.sendPoint(pointDto);
		return "redirect:list";
	}
	
	// 포인트 상세
	@GetMapping("/detail")
	public String pointDetail(@RequestParam int member_code, Model model) {
		//회원정보
		model.addAttribute("memberDto", memberDao.getInfo(member_code));
		//포인트 상세목록
		model.addAttribute("point_list", pointService.list(member_code));
		// 총포인트 합계
		model.addAttribute("pointVO",pointService.getPointInfo(member_code));
		return "admin/super/promotion/point_detail";
	}
}
