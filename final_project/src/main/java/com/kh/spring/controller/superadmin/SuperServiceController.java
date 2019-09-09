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
import com.kh.spring.repository.ShopOnoDao;
import com.kh.spring.service.ServiceService;

@Controller
@RequestMapping("/super_admin/ono")
public class SuperServiceController {

	@Autowired
	private OnoDao onoDao;
	
	@Autowired
	private ShopOnoDao shoponoDao;
	
	@Autowired
	private ServiceService serviceService;
	
// 고객 1:1 문의
	@GetMapping("/ono_list")
	public String list(Model model,@ ModelAttribute OnoDto onoDto,
			@RequestParam(required = false) String apply_status,
			@RequestParam(required = false) String keyword_type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false) String start_date,
			@RequestParam(required = false) String end_date,
			@RequestParam(required = false) String type,
			@RequestParam(required = false, defaultValue = "1")int page) {
		
		//페이징
		int pagesize = 10;
		int start = pagesize * page - (pagesize- 1);
		int end = pagesize * page;
		
		int blocksize = 5;
		int startBlock = (page -1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = onoDao.supercount(apply_status, keyword_type, keyword,start_date, end_date );
		int pageCount = (count -1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("count",count);
		
		List<OnoDto> list = onoDao.superlist(apply_status, keyword_type, keyword, start_date, end_date, start, end, type);
		model.addAttribute("list", list);
		
		String reply_status = "답변대기";
		List<OnoDto> list2 = onoDao.superlist2(apply_status, keyword_type, keyword,  start_date, end_date,reply_status, start, end, type);
		model.addAttribute("list2", list2);
		
		//답변대기 개수(고객)
		int count_reply = onoDao.count_reply();
		model.addAttribute("count_reply",count_reply);
		//총개수(고객)
		int client_count=onoDao.client_count();
		model.addAttribute("client_count", client_count);
		
		//답변대기 개수(업주)
		int count_reply_ceo = onoDao.count_reply_ceo();
		model.addAttribute("count_reply_ceo",count_reply_ceo);
		
		
		
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
		
		//답변대기 개수
		int count_reply = onoDao.count_reply();
		model.addAttribute("count_reply",count_reply);
		//답변대기 개수
		int count_reply_ceo = onoDao.count_reply_ceo();
		model.addAttribute("count_reply_ceo",count_reply_ceo);
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
	
	
	
	
	// 업주 1:1 문의
			@GetMapping("/ono_list_ceo")
			public String list_ceo(Model model,@ ModelAttribute OnoDto onoDto,
					@RequestParam(required = false) String apply_status,
					@RequestParam(required = false) String keyword_type,
					@RequestParam(required = false) String keyword,
					@RequestParam(required = false) String type,
					@RequestParam(required = false, defaultValue = "1")int page) {
				
//				System.out.println("apply_status = " + apply_status);
//				System.out.println("keyword_type = " + keyword_type);
//				System.out.println("keyword = " + keyword);
				
				//페이징
				int pagesize = 10;
				int start = pagesize * page - (pagesize- 1);
				int end = pagesize * page;
				
				int blocksize = 5;
				int startBlock = (page -1) / blocksize * blocksize + 1;
				int endBlock = startBlock + (blocksize - 1);
				
				int count = onoDao.supercount_ceo(apply_status, keyword_type, keyword );
				int pageCount = (count -1) / pagesize + 1;
				if(endBlock > pageCount) {
					endBlock = pageCount;
				}
				
				model.addAttribute("page", page);
				model.addAttribute("startBlock", startBlock);
				model.addAttribute("endBlock", endBlock);
				model.addAttribute("count",count);
				
				List<OnoDto> list = shoponoDao.superlist_ceo(apply_status, keyword_type, keyword, start, end, type);
				model.addAttribute("list", list);
				
				String reply_status = "답변대기";
				List<OnoDto> list2 = shoponoDao.superlist2_ceo(apply_status, keyword_type, keyword, reply_status, start, end, type);
				model.addAttribute("list2", list2);
				
				//답변대기 개수
				int count_reply_ceo = onoDao.count_reply_ceo();
				model.addAttribute("count_reply_ceo",count_reply_ceo);
				
				//총개수(업주)
				int ceo_count=onoDao.ceo_count();
				model.addAttribute("ceo_count", ceo_count);
				
				//답변대기 개수
				int count_reply = onoDao.count_reply();
				model.addAttribute("count_reply",count_reply);
				
				return "admin/super/service/ono/ono_list_ceo";
			}
			
			@GetMapping("/super_content_ceo")
			public String ono_detail_ceo( Model model, @RequestParam int ono_code) {
				//글정보 조회
				OnoDto onoDto = serviceService.onoInfo(ono_code);
				model.addAttribute("onoDto", onoDto);
				
				//이미지코드 조회
				model.addAttribute("img_list", onoDao.onoImg(ono_code));


				
				//답변대기 개수
				int count_reply_ceo = onoDao.count_reply_ceo();
				model.addAttribute("count_reply_ceo",count_reply_ceo);
				
				//답변대기 개수
				int count_reply = onoDao.count_reply();
				model.addAttribute("count_reply",count_reply);
				
				return "admin/super/service/ono/super_content_ceo";
				
			}

				//이미지 불러오기
			@GetMapping("/ono_img_ceo")
			public ResponseEntity<ByteArrayResource> onoImg_ceo(
					@RequestParam int files_code) throws IOException{
				return serviceService.onoImg(files_code);
			}

			
			//답변 달기
			@PostMapping("/super_content_ceo")
			public String edit_ceo(@ModelAttribute OnoDto onoDto, RedirectAttributes model) {
//				System.out.println("dfsfd123");
				onoDao.superedit(onoDto);
				model.addAttribute("ono_code", onoDto.getNo());
				
				//답변 상태 변경
				onoDao.updateReplyStatus(onoDto);
				return "redirect:ono_list_ceo";
				
			}
	
		

}
