package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//member + cupon + review + ono VO
@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class MemberInfoVO {
	private int no; //회원번호
	private String id; //회원 아이디
	private String phone; //회원 전화번호
	private String grade; //회원 등급
	private String status;//회원 상태
	private String regist_date; //회원 가입일
	private String latest_login; //최종접속일
	private int coupon; //보유 쿠폰 개수
	private int point; //포인트
	private String email; //이메일
	private String email_address; //이메일 주소
	private int post; //우편번호
	private String basic_addr; //기본주소
	private String detail_addr; //상세주소
	private int total_price; //총 사용 금액
	private int ono; //1:1문의 수
	private int review; //리뷰 수
}
