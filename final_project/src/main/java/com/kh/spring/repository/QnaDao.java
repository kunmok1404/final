package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.QnaDto;

public interface QnaDao {

	List<QnaDto> list(String type);

	int count(String type);
	
	void delete(int no);

	void write(QnaDto qnaDto);


	

}
