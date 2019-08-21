package com.kh.spring.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.NoticeDto;
import com.kh.spring.repository.NoticeDao;
import com.kh.spring.service.ServiceService;

//공지사항
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private ServiceService serviceService;
	
	//[1] 목록
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int page) {
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = noticeDao.count(keyword);
		int pageCount = (count - 1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		
		
		List<NoticeDto> list = noticeDao.list(keyword, start, end);
		model.addAttribute("list", list);
		
	return "client/service/notice/list";
	}

	@GetMapping("/content")
	public String content(HttpSession session, Model model, @RequestParam int no) {
		//조회수 중복 방지
		@SuppressWarnings("unchecked")
		Set<Integer> set = (Set<Integer>)session.getAttribute("read");
		if(set == null)
			set = new HashSet<>();
		
		boolean first = set.add(no); 
		
		session.setAttribute("read", set);
		
		if(first)
			model.addAttribute("ndto", serviceService.read(no));
		else
			model.addAttribute("ndto", noticeDao.get(no));
		
		return "client/service/notice/content";
		
	}
	

}