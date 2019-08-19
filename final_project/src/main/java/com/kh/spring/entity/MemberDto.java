package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 회원정보
@Data
@Builder 
@AllArgsConstructor 
@NoArgsConstructor
public class MemberDto {
	private int no; //회원번호
	private int shop_code; //매장코드
	private String name; //이름
	private String id; // 아이디
	private String pw; // 비밀번호
	private String email; // 이메일
	private String phone; // 전화번호
	private String post; //우편번호
	private String basic_addr; //기본주소
	private String detail_addr; //상세주소
	private String status; //회원상태(일반/탈퇴/휴면)
	private String type; // 회원구분(고객/업주/관리자)
	private String grade; //회원등급(일반/gold/vip)
	private String regist_date;// 등록일
	private String edit_date;//수정일
	private String latest_login;// 최종접속일
	private int point; //포인트
	private String apply_status; //승인상태(고객, 업주)
}
