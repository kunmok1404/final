package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CartSubDto {
	private int no;
	private String sub_type; // 필수or선택
	private String sub_title; // 제목
	private String sub_name; // 메뉴명
	private int sub_price; // 메뉴가격
	private int sub_amount; // 수량
	

}
