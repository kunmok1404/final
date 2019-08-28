package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ReviewDto {

	private int no; //리뷰번호
	private int member_code; //회원코드
	private int order_code; // 주문번호
	private String title; // 제목
	private String content; // 내용
	private int read; //조회수
	private double score; // 평점
	private String write_status; // 작성상태
	private String reply_status; // 답변상태
	private String reply_content; // 답변내용
	private String regist_date; //등록일
	private String edit_date; // 수정일
}
