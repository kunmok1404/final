package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.QnaDto;

public interface QnaDao {

	List<QnaDto> list(String type,int i, int j);
	


	int count(String type);
	
	void delete(int no);

	void write(QnaDto qnaDto);



	int supercount();



	List<QnaDao> superlist(int i, int j);



	int count_reply_ceo();



	int count_reply();



	QnaDto qnaInfo(int no);



	int getSequenceNumber();



	void insert(QnaDto qnaDto);



	void edit(QnaDto qnaDto);



	void qnadelete(int no);


	

}
