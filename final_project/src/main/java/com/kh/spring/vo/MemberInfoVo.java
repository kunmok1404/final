package com.kh.spring.vo;

import lombok.Data;

//member + cupon + riview + ono
@Data
public class MemberInfoVo {
	private int no; //회원번호
	private String id; //회원 아이디
	private String email; //회원 이메일
	private String email_address; //회원 이메일 주소
	private String phone; //회원 전화번호
	private String basic_addr; //회원 기본 주소
	private String detail_addr; //회원 상세 주소
	private String grade; //회원 등급
	private String status;//회원 상태
	private int coupon; //보유 쿠폰 개수
	private int point; //포인트
	private int total_price; //총 구매 금액
	private int ono; //1:1 문의 수
	private int review; //리뷰 수
	private String regist_date; //회원 가입일
	private String latest_login; //회원 최종 접속일
	//private String apply_status; //승인상태
}
