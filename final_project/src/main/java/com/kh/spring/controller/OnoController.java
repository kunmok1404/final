package com.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.OnoDto;
import com.kh.spring.repository.OnoDao;
import com.kh.spring.service.ServiceService;

//1:1 문의
@Controller
@RequestMapping("/ono")
public class OnoController {
	
	@Autowired
	private OnoDao onoDao;
	
	@Autowired
	private ServiceService serviceService;
	
	
	//[1] 목록
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false, defaultValue = "1") int page) {
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = onoDao.count();
		int pageCount = (count -1) / pagesize +1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}

		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		
		List<OnoDto> list = onoDao.list(start, end);
		model.addAttribute("list", list);
		
	return "client/service/ono/list";
	}
	
	//[2]글쓰기
	@GetMapping("/write")
	public String write() {
		return "client/service/ono/write";
	}
	
	@PostMapping("/write")
	public String write(HttpSession session,
								@ModelAttribute OnoDto onoDto,
								Model model) {
//		String id = (String)session.getAttribute("ok");
		int member_code = 1;
		int shop_code = 1;
		onoDto.setMember_code(member_code);
		onoDto.setShop_code(shop_code);
		onoDao.write(onoDto);
		model.addAttribute("no",onoDto.getNo());
		return "redirect:list";
	}
	
	
	@GetMapping("/content")
	public String content(Model model, @RequestParam int no) {
			model.addAttribute("odto", onoDao.get(no));
		return "client/service/ono/content";
		
	}
	

}