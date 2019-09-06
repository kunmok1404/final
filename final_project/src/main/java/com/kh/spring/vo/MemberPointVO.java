package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberPointVO {

	private int member_code; // 회원번호
	private String id; // 아이디
	private String grade; // 회원등급
	private String status; // 회원분류
	private int total_point; // 총적립포인트
	private int use_point; // 총 사용 포인트
	private int present_point; // 현재 포인트
}
