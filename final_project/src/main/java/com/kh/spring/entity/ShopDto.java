package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//매장Dto
@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ShopDto {
	private int no; //매장번호
	private int category; // 음식카테고리
	private String company_name; // 상호
	private String company_code; // 사업자번호
	private String ceo; // 사업주명
	private String ceo_phone; // 사업주 휴대폰번호
	private String bank; // 은행명
	private String account_number; // 계좌번호
	private String account_name; // 예금자명
	private String shop_name; // 매장명
	private String shop_phone; // 매장전화번호
	private String zip_code; //우편번호
	private String basic_addr; //기본주소
	private String detail_addr; // 상세주소
	private String content; // 매장소개
	private String regist_date; //가입신청일
	private String contract_date; //계약일(승인완료일)
	private String finish_date; //계약종료일
	private String contract_status; // 계약상태
	private String apply_status; // 승인상태
	private int min_price; // 최소주문금액
	private String min_time; // 최소배달시간
	private int delivery_price; //배달비
	private String start_time; //영업시작시간
	private String finish_time; // 영업종료시간
	private String reason; // 계약종료사유
}
