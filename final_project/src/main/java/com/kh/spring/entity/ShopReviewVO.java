package com.kh.spring.entity;

import lombok.Data;

// Shop + Order + Review VIEW
@Data
public class ShopReviewVO {
	private int shop_code; // 매장코드
	private String shop_name; // 매장명
	private int no; // 리뷰코드
	private int member_code; // 회원코드
	private int order_code; // 주문코드
	private String title; // 리뷰제목
	private String content; // 리뷰내용
	private int read; // 조회수
	private int score; // 점수
	private String write_status; // 작성상태
	private String reply_status; // 답변상태
	private String reply_content; // 답변내용
	private String regist_date; // 작성일
	private String edit_date; // 수정일
}
