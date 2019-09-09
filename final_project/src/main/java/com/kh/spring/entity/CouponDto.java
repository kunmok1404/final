package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CouponDto {

	private int no; //쿠폰 코드
	private String name; // 쿠폰명
	private String issue_type; // 발급방식(수동/자동)
	private String discount_type; //할인방식(율/금액)
	private int discount_price; // 할인금액
	private int max_price; // 최대 할인금액
	private String start_date; // 사용시작일
	private String finish_date; // 사용종료일
	private String issue_status; // 발급구분(즉시사용, 매주, 매월)
	private String regist_date; // 쿠폰등록일
	private String edit_date; // 쿠폰 수정일
	private String auto_type; // 자동발급 구분(회원가입 축하쿠폰, 첫구매 감사쿠폰, 구매감사쿠폰)
	private String issue_date;// 발급 시기
}
