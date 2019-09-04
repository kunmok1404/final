package com.kh.spring.controller.superadmin;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

import com.kh.spring.entity.NoticeDto;
import com.kh.spring.repository.NoticeDao;
import com.kh.spring.service.ServiceService;

@Controller // 클래스를 생성한다
@RequestMapping("/super_admin/notice") // view의 요청 경로 지정한다.
public class SuperNoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private ServiceService serviceService;
	
	//목록
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false) String keyword, @RequestParam(required = false) String status,
			@RequestParam(required = false, defaultValue ="1") int page) {
		
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
		
		String status1 ="고객";
		List<NoticeDto> list = noticeDao.list(keyword, status, start, end);
		model.addAttribute("list", list);
		
		List<NoticeDto> list2 = noticeDao.list2();
//		System.out.println("list2"+list2.size());
		model.addAttribute("list2", list2);
		
		String status2 ="업주";
		List<NoticeDto> list3 = noticeDao.list3(keyword, status2, start, end );
		model.addAttribute("list3", list3);
		
		List<NoticeDto> list4 = noticeDao.list4();
//		System.out.println("list4"+list4.size());
		model.addAttribute("list4", list4);
		
	return "admin/super/service/notice/list"; //뷰 파일 리턴
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
		
		return "admin/super/service/notice/content";
		
	}
	
	//글쓰기
	@GetMapping("/write")
	public String write() {
		return "admin/super/service/notice/write";
	}
	
	@PostMapping("/write")
	public String write(HttpSession session, @ModelAttribute NoticeDto noticeDto,
			Model model) {
		//글등록
		String id = "test1";
		noticeDto.setWriter(id);
		int no = serviceService.write(noticeDto);
		
//		noticeDao.write(noticeDto); 
		model.addAttribute("no", no);
		return "redirect:content";
	}
	
	//글 삭제
		@GetMapping("/delete")
		public String delete(@RequestParam int no, Model model, @RequestParam String status) {
			model.addAttribute("status", status);
			noticeDao.delete(no);
			return "redirect:list";
		}
		

	//글 수정
	@GetMapping("/edit")
	public String edit(@RequestParam int no, Model model) {
		model.addAttribute("sndto", noticeDao.get(no));
		return "admin/super/service/notice/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto, RedirectAttributes model) {
		noticeDao.edit(noticeDto);
		model.addAttribute("no", noticeDto.getNo());
		return "redirect:content";
	}
}
