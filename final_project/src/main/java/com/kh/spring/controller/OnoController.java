package com.kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
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

import com.kh.spring.entity.FilesDto;
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
	public String list(Model model,
			@RequestParam(required = false, defaultValue = "1") int page) {
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = onoDao.count();
		int pageCount = (count -1) / pagesize +1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}

		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		
		List<OnoDto> list = onoDao.list(start, end);
		model.addAttribute("list", list);
		
	return "client/service/ono/list";
	}
	
	//[2]글쓰기 및 파일업로드
	@GetMapping("/write")
	public String write() {
		return "client/service/ono/write";
	}
	
	@PostMapping("/write")
	public String write(HttpSession session,
								@ModelAttribute OnoDto onoDto,
								@RequestParam List<MultipartFile> images,
								Model model) throws IllegalStateException, IOException {
//		String id = (String)session.getAttribute("ok");
		int member_code = 1;
		int shop_code = 1;
		onoDto.setMember_code(member_code);
		onoDto.setShop_code(shop_code);
		int no = onoDao.getSeq();
		onoDto.setNo(no);
		
		model.addAttribute("no", no);
		onoDao.write(onoDto);
		//파일 업로드
		for(MultipartFile image : images) {
			if(image.isEmpty()) {
				break;
			}
			else {
				serviceService.regist(no, image);
			}
		}
//		return "client/service/ono/content";//forward : 화면만 바꾸는것(데이터를 첨부해야함)
		return "redirect:content";
	}
	
	//[3] 글 상세보기
	@GetMapping("/content")
	public String content(Model model, @RequestParam int no) {
			model.addAttribute("odto", onoDao.get(no));
			FilesDto fielsDto = onoDao.getfile(no);
			model.addAttribute("filesDto", onoDao.getfile(no));
		return "client/service/ono/content";
	}
	
	//[4] 글 수정하기
	@GetMapping("/edit")
	public String edit(@RequestParam int no, Model model) {
		model.addAttribute("odto",onoDao.get(no));
		return "client/service/ono/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute OnoDto onoDto, RedirectAttributes model) {
		onoDao.edit(onoDto);
		model.addAttribute("no",onoDto.getNo());
		return "redirect:content";
	}
	
	//[5]파일 다운로드(상세보기에 띄우기)
	
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(@RequestParam String save_name) throws IOException {
		FilesDto filesDto = serviceService.get(save_name);
//		System.out.println(filesDto);
		
		if(filesDto == null) {
			return ResponseEntity.notFound().build();
		}
		
		File target = new File("D:/upload/kh15", filesDto.getSave_name());
//		System.out.println(target.getAbsolutePath());
//		System.out.println(target.exists());
		byte[]data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
											.contentType(MediaType.APPLICATION_OCTET_STREAM)
											.header(HttpHeaders.CONTENT_DISPOSITION,
													"attachment; filename="+URLEncoder.encode(filesDto.getUpload_name(), "UTF-8"))
											.contentLength(data.length)
											.body(resource);
		
	}

}