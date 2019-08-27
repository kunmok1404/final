package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.NoticeDto;

public interface NoticeDao {

	List<NoticeDto> list(String keyword,int i, int j);
	
	List<NoticeDto> list2();
	
	int count(String type);

	NoticeDto get(int no);

	void read(int no);



	


	

}
