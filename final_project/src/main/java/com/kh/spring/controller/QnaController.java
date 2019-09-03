package com.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.QnaDto;
import com.kh.spring.repository.QnaDao;

//자주하는질문
@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private QnaDao qnaDao;
	
	//[1] 목록
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false) String category,
			@RequestParam(required = false, defaultValue = "1") int page) {
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = qnaDao.count(category);
		int pageCount = (count - 1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		
		List<QnaDto> list = qnaDao.list(category, start, end);
		model.addAttribute("list", list);
	return "client/service/qna/list";
	}
	
	//[2]글쓰기
	@GetMapping("/write")
	public String write() {
		return "client/service/qna/write";
	}
	
	@PostMapping("/write")
	public String write(HttpSession session,
								@ModelAttribute QnaDto qnaDto,
								Model model) {
//		int member_code = (int)session.getAttribute("member_code");
		String id = "test1";
		qnaDto.setWriter(id);
		qnaDao.write(qnaDto); 
		model.addAttribute("no", qnaDto.getNo());
		return "redirect:list";
	}
	//[3]글 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int no, Model model) {
	qnaDao.delete(no);
		return "redirect:list";
	}
}