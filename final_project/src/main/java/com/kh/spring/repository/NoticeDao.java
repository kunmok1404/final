package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.NoticeDto;

public interface NoticeDao {

	List<NoticeDto> list(String keyword, String status, int i, int j);
	
	List<NoticeDto> list2();
	
	int count(String keyword);

	NoticeDto get(int no);

	void read(int no);

	List<NoticeDto> list3(String keyword, String status, int i, int j);
	
	List<NoticeDto> list4();


	void write(NoticeDto noticeDto);

	void delete(int no);

	int getSequenceNumber();

	void insert(NoticeDto noticeDto);

	void edit(NoticeDto noticeDto);





	


	

}
