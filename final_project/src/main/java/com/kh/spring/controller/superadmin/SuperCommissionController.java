package com.kh.spring.controller.superadmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.CommissionListDto;

@Controller
@RequestMapping("/super_admin/commission")
public class SuperCommissionController {
	
	@Autowired
	SqlSession sqlsession;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<CommissionListDto> list = sqlsession.selectList("commission.list");
		model.addAttribute("list", list);
		return "admin/super/commission/commission_list";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "admin/super/commission/commission_regist";
	}
	
	@PostMapping("/regist")
	public String regist(
			@RequestParam String commission_date,
			@RequestParam String commission_rate) {
		Map<String, Object> map = new HashMap<>();
		map.put("commission_date", commission_rate);
		map.put("commission_rate", commission_date);
		sqlsession.update("commission.update", map);
		return "admin/super/commission/commission_regist";
	}
}
