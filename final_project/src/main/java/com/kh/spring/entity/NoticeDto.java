package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class NoticeDto {
	 private int no; 						//글번호
	 private String title; 				//제목
	 private String content; 			//내용
	 private String status;				//구분(중요)
	 private String type;					//지위(일반, 관리자)
	 private String regist_date; 		//작성날짜
	 private String edit_date;			//수정날짜
	 private int read;						//조회수
	 private String writer;				//작성자
	 private String editor;				//수정자

	 
}
