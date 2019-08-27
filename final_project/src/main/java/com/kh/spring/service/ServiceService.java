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

	void regist(int no, MultipartFile image) throws IllegalStateException, IOException;

	FilesDto get(String save_name);

	int OnoRegist(OnoDto onoDto);

	void fileRegist(MultipartFile file, OnoDto onoDto) throws IllegalStateException, IOException;

	ResponseEntity<ByteArrayResource> onoImg(int files_code) throws UnsupportedEncodingException, IOException;

}
