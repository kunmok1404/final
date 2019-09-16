package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.QnaDto;

public interface QnaDao {

	List<QnaDto> list(String type,int i, int j, String use_yn);
	


	int count(String type);
	
	void delete(int no);

	void write(QnaDto qnaDto);



	int supercount(String apply_status, String keyword_type, String keyword, String start_date, String end_date, String yn);



	List<QnaDto> superlist(String apply_status, String keyword_type, String keyword, String start_date, String end_date, String yn, int i, int j);



	int count_reply_ceo();



	int count_reply();



	QnaDto qnaInfo(int no);



	int getSequenceNumber();



	void insert(QnaDto qnaDto);



	void edit(QnaDto qnaDto);



	void qnadelete(int no);


	

}
