package com.kh.spring.controller.superadmin;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.entity.QnaDto;
import com.kh.spring.repository.OnoDao;
import com.kh.spring.repository.QnaDao;
import com.kh.spring.service.ServiceService;

@Controller
@RequestMapping("/super_admin/qna")
public class SuperQnaController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ServiceService serviceService;
	
	@Autowired
	private OnoDao onoDao;
	
	@Autowired
	private QnaDao qnaDao;
	
	//목록
	@GetMapping("/qna_list")
	public String list(Model model,
			@RequestParam(required = false, defaultValue ="1") int page
			) {
		int pagesize = 10;
		int start = pagesize * page -(pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 5;
		int startBlock =(page -1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = qnaDao.supercount();
		int pageCount = (count - 1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		//답변대기 개수
		int count_reply_ceo = qnaDao.count_reply_ceo();
		model.addAttribute("count_reply_ceo",count_reply_ceo);
		
		//답변대기 개수
		int count_reply = qnaDao.count_reply();
		model.addAttribute("count_reply",count_reply);
		
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		
		List<QnaDao> list = qnaDao.superlist(start, end);
		model.addAttribute("list", list);
		return "admin/super/service/qna/qna_list";
	}
	
	// qna 글 상세보기
	@GetMapping("/qna_content")
	public String content( Model model, @RequestParam int no) {
		QnaDto qnaDto = serviceService.qnaInfo(no);
		model.addAttribute("qdto", qnaDto);
		
		//답변대기 개수
		int count_reply_ceo = qnaDao.count_reply_ceo();
		model.addAttribute("count_reply_ceo",count_reply_ceo);
				
		//답변대기 개수
		int count_reply = qnaDao.count_reply();
		model.addAttribute("count_reply",count_reply);
				
		return "admin/super/service/qna/qna_content";
	}
	
	//qna 글 쓰기
	@GetMapping("/qna_write")
	public String write(Model model) {
		//답변대기 개수
		int count_reply_ceo = qnaDao.count_reply_ceo();
		model.addAttribute("count_reply_ceo",count_reply_ceo);
				
		//답변대기 개수
		int count_reply = qnaDao.count_reply();
		model.addAttribute("count_reply",count_reply);
		
		return "admin/super/service/qna/qna_write";
	}
	
	@PostMapping("/qnd_write")
	public String write(HttpSession session, @ModelAttribute QnaDto qnaDto,
			Model model) {
		//글등록
		//int super_code = (int)session.getAttribute("member_code");
		int super_code = 64;
		int no = serviceService.write(qnaDto);
		
		model.addAttribute("no",no);
		

		
		return "redirect:qna_content";
	}
	
	@GetMapping("qna_delete")
	public String delete(@RequestParam int no) {
		qnaDao.qnadelete(no);
		return "redirect:qna_list";
	}
	
	@GetMapping("qna_edit")
	public String edit(@RequestParam int no, Model model) {
		model.addAttribute("qdto", qnaDao.qnaInfo(no));
		//답변대기 개수
				int count_reply_ceo = qnaDao.count_reply_ceo();
				model.addAttribute("count_reply_ceo",count_reply_ceo);
						
				//답변대기 개수
				int count_reply = qnaDao.count_reply();
				model.addAttribute("count_reply",count_reply);
		return "admin/super/service/qna/qna_edit";
	}
	
	@PostMapping("qna_edit")
	public String edit(@ModelAttribute QnaDto qnaDto, RedirectAttributes model) {
		qnaDao.edit(qnaDto);
		model.addAttribute("no", qnaDto.getNo());
		

		return "redirect:qna_content";
	}
}
