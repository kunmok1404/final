package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.QnaDto;

public interface QnaDao {

	List<QnaDto> list(String type,int i, int j);
	


	int count(String type);
	
	void delete(int no);

	void write(QnaDto qnaDto);


	

}
