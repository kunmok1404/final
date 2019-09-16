package com.kh.spring.service;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.NoticeDto;
import com.kh.spring.entity.OnoDto;
import com.kh.spring.entity.QnaDto;
import com.kh.spring.vo.QnaCategoryVO;

public interface ServiceService {

	NoticeDto read(int no);

	void fileRegist(MultipartFile file, OnoDto onoDto) throws IllegalStateException, IOException;
	
	int OnoRegist(OnoDto onoDto);

	OnoDto onoInfo(int ono_code);

	ResponseEntity<ByteArrayResource> onoImg(int files_code) throws IOException;

	int write(NoticeDto noticeDto);

	QnaDto qnaInfo(int no);

	int write(QnaDto qnaDto);

	int OnoRegist2(OnoDto onoDto);

	List<QnaCategoryVO> superlist(String apply_status, String keyword_type, String keyword, String start_date, String end_date,
			String yn, int start, int end);

	List<QnaCategoryVO> list(String category, int start, int end, String use_yn);













}
