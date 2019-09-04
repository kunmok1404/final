package com.kh.spring.controller.superadmin;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.entity.OnoDto;
import com.kh.spring.repository.OnoDao;
import com.kh.spring.service.ServiceService;

@Controller
@RequestMapping("/super_admin/ono")
public class SuperServiceController {

	@Autowired
	private OnoDao onoDao;
	
	@Autowired
	private ServiceService serviceService;
	
	@GetMapping("/ono_list")
	public String list(Model model,
			@RequestParam(required = false) String apply_status,
			@RequestParam(required = false) String keyword_type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1")int page) {
		int pagesize = 10;
		int start = pagesize * page - (pagesize- 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page -1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = onoDao.supercount(apply_status, keyword_type, keyword );
		int pageCount = (count -1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("count",count);
		List<OnoDto> list = onoDao.superlist(apply_status, keyword_type, keyword, start, end);
		model.addAttribute("list", list);
		
		return "admin/super/service/ono/ono_list";
	}
	
	@GetMapping("/super_content")
	public String ono_detail( Model model, @RequestParam int ono_code) {
		//글정보 조회
		OnoDto onoDto = serviceService.onoInfo(ono_code);
		model.addAttribute("onoDto", onoDto);
		
		//이미지코드 조회
		model.addAttribute("img_list", onoDao.onoImg(ono_code));

		// 답글 달기
//		model.addAttribute("onoDto", serviceService.onoInfo(ono_code));
		return "admin/super/service/ono/super_content";
	}

		//이미지 불러오기
	@GetMapping("/ono_img")
	public ResponseEntity<ByteArrayResource> onoImg(
			@RequestParam int files_code) throws IOException{
		return serviceService.onoImg(files_code);
	}

	
	//답변 달기
	@PostMapping("/super_content")
	public String edit(@ModelAttribute OnoDto onoDto, RedirectAttributes model) {
//		System.out.println("dfsfd123");
		onoDao.superedit(onoDto);
		model.addAttribute("ono_code", onoDto.getNo());
		
		//답변 상태 변경
		onoDao.updateReplyStatus(onoDto);
		return "redirect:ono_list";
	}
	
	
}
