package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class QnaCategoryVO {
	 private int no; 				//글번호
	 private int category; 	//카테고리
	 private String question; 	//질문
	 private String answer;	//답변
	 private String regist_date; 		//작성날짜
	 private String edit_date;			//수정날짜
	 private String use_yn;		//보여주기 여부
	 private String writer;		//작성자
	 private String editor;		//수정자
	 private String categoryName; // 카테고리 이름
}
