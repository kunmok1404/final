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
		
		int blocksize = 5;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = noticeDao.count(keyword);
		int pageCount = (count - 1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		model.addAttribute("page", page);  //model 객체 이용해서, view로  data 전달
		model.addAttribute("startBlock", startBlock);//model.addAttribute(변수이름, 변수에 넣을 데이터값);
		model.addAttribute("endBlock", endBlock); // 스피링은 데이터값을 뷰쪽으로 넘겨준다 -> 뷰(.jsp파일)에서는 ${}를 이용해서 값을 가져온다 
		model.addAttribute("pageCount", pageCount);
		/*
		 * 1.중요 공지사항만 조회 하도록 추가
		 * 2.중요 공지사항을 제외한 글목록 조회
		 * 3.model 에 list 다른명칭으로 추가
		 * 
		 */
		
		String status="고객";
		List<NoticeDto> list = noticeDao.list(keyword, status, start, end);
		model.addAttribute("list", list);
		
		List<NoticeDto> list2 = noticeDao.list2();
//		System.out.println("list2"+list2.size());
		model.addAttribute("list2", list2);
		
	return "client/service/notice/list"; //뷰 파일 리턴
	}

	//@RequestParam [데이터타입] [뷰에서 가져온데이터를 담을 변수, jsp랑 이름이 같아야함]->model객체 이용해서 뷰로 값을 넘겨준다
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