package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class IssueDto {
	
	private int coupon_code; // 쿠폰	코드
	private int member_code; // 회원코드
	private int amount; // 쿠폰수량
	private String issue_date; // 발급일
}
