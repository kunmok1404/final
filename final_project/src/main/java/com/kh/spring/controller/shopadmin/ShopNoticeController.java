package com.kh.spring.controller.shopadmin;

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
@RequestMapping("/shop_admin/notice")
public class ShopNoticeController {
	
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
		
		/*
		 * 1.중요 공지사항만 조회 하도록 추가
		 * 2.중요 공지사항을 제외한 글목록 조회
		 * 3.model 에 list 다른명칭으로 추가
		 * 
		 */
		String status="업주";
		List<NoticeDto> list3 = noticeDao.list3(keyword, status, start, end );
		model.addAttribute("list3", list3);
		
		List<NoticeDto> list4 = noticeDao.list4();
//		System.out.println("list4"+list4.size());
		model.addAttribute("list4", list4);
		
	return "admin/shop/service/notice/list";
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
		
		return "admin/shop/service/notice/content";
		
	}
	

}