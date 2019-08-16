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
	public String list(Model model) {
	List<QnaDto> list = qnaDao.list();
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
		String id = (String)session.getAttribute("ok");
		qnaDto.setWriter(id);
		model.addAttribute("no", qnaDto.getNo());
		return "client/service/qna/list";
	}
	
}