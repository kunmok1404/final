package com.kh.spring.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.NoticeDto;
import com.kh.spring.entity.OnoDto;

public interface ServiceService {

	NoticeDto read(int no);

	void fileRegist(MultipartFile file, OnoDto onoDto) throws IllegalStateException, IOException;
	
	int OnoRegist(OnoDto onoDto);

	OnoDto onoInfo(int ono_code);

	ResponseEntity<ByteArrayResource> onoImg(int files_code) throws IOException;

	int write(NoticeDto noticeDto);





}
