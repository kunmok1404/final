package com.kh.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String list(Model model, HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page) {
		//나의 1대1 목록 불러오기
		int member_code = (int)session.getAttribute("member_code");
//		int member_code = 1;
		System.out.println(member_code);
		
		
		//페이징
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 5;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		int count = onoDao.count();
//		System.out.println(count);
		int pageCount = (count -1) / pagesize +1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}

		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		
		List<OnoDto> list = onoDao.list(start, end, member_code);
		
//		System.out.println(list.size());
		model.addAttribute("list", list);
		
	return "client/service/ono/list";
	}
	
	//[2]글쓰기 및 파일업로드
	@GetMapping("/write")
	public String write() {
		return "client/service/ono/write";
	}
	
//	@PostMapping("/write")
//	public String write(HttpSession session,
//								@ModelAttribute OnoDto onoDto,
//								@RequestParam List<MultipartFile> images,
//								Model model) throws IllegalStateException, IOException {
////		String id = (String)session.getAttribute("ok");
//		int member_code = 1;
//		int shop_code = 1;
//		onoDto.setMember_code(member_code);
//		onoDto.setShop_code(shop_code);
//		int no = onoDao.getSeq();
//		onoDto.setNo(no);
//		
//		model.addAttribute("no", no);
//		onoDao.write(onoDto);
//		//파일 업로드
//		for(MultipartFile image : images) {
//			if(image.isEmpty()) {
//				break;
//			}
//			else {
//				serviceService.regist(no, image);
//			}
//		}
////		return "client/service/ono/content";//forward : 화면만 바꾸는것(데이터를 첨부해야함)
//		return "redirect:content";
//	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute OnoDto onoDto,
								@RequestParam List<MultipartFile> images,
								
								HttpSession session, Model model) throws IllegalStateException, IOException {
		//int member_code = (int)session.getAttribute("member_code");
		int member_code = 1;
		int shop_code = 1;
		onoDto.setMember_code(member_code);
		onoDto.setShop_code(shop_code);
		//글등록
		int ono_no = serviceService.OnoRegist(onoDto);
		onoDto.setNo(ono_no);
		//이미지 등록(이미지가 여러장이니깐)
		for(MultipartFile file : images) {
			serviceService.fileRegist(file,onoDto);
		}
		model.addAttribute("ono_code", ono_no);
		return "redirect:content";
	}
	
	@GetMapping("/content")
	public String ono_detail(@RequestParam int ono_code, Model model) {
		//글정보 조회
		OnoDto onoDto = serviceService.onoInfo(ono_code);
		model.addAttribute("onoDto", onoDto);
		
		//이미지코드 조회
		model.addAttribute("img_list", onoDao.onoImg(ono_code));
		return "client/service/ono/content";
	}
	
	//이미지 불러오기
	@GetMapping("/ono_img")
	public ResponseEntity<ByteArrayResource> onoImg(
				@RequestParam int files_code) throws IOException{
		return serviceService.onoImg(files_code);
	}
	
	//[4] 글 수정하기
	@GetMapping("/edit")
	public String edit(@RequestParam int ono_code, Model model) {
		model.addAttribute("odto",onoDao.onoInfo(ono_code));
		return "client/service/ono/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute OnoDto onoDto, RedirectAttributes model) {
		onoDao.edit(onoDto);
		model.addAttribute("ono_code",onoDto.getNo());
		return "redirect:content";
	}
	

	
	
	
	
	
//	@GetMapping("/download")
//	public ResponseEntity<ByteArrayResource> download(@RequestParam String save_name) throws IOException {
//		FilesDto filesDto = serviceService.get(save_name);
////		System.out.println(filesDto);
//		
//		if(filesDto == null) {
//			return ResponseEntity.notFound().build();
//		}
//		
//		File target = new File("D:/upload/kh15", filesDto.getSave_name());
////		System.out.println(target.getAbsolutePath());
////		System.out.println(target.exists());
//		byte[]data = FileUtils.readFileToByteArray(target);
//		ByteArrayResource resource = new ByteArrayResource(data);
//		
//		return ResponseEntity.ok()
//											.contentType(MediaType.APPLICATION_OCTET_STREAM)
//											.header(HttpHeaders.CONTENT_DISPOSITION,
//													"attachment; filename="+URLEncoder.encode(filesDto.getUpload_name(), "UTF-8"))
//											.contentLength(data.length)
//											.body(resource);
//	}

}