package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class PointDetailDto {

	private int member_code; //회원코드
	private String use_yn; // 사용/적립 여부
	private int point; // 포인트금액
	private String when; // 사용날짜
	private String content; // 내역
}
