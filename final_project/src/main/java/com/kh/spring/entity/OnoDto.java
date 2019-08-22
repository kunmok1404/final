package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class OnoDto {
	 private int no; 						//글번호
	 private int member_code;		//회원번호
	 private int shop_code;			//매장번호
	 private String title; 				//제목
	 private String content; 			//내용
	 private String regist_date; 		//작성날짜
	 private String edit_date;			//수정날짜
	 private String reply_status;	//답변상태
	 private String reply_content;	//답변내용
	 private String type;					//문의구분(고객/업주)
	 private String category;			//카테고리
}
