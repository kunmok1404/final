package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 서브메뉴Dto
@Data @Builder @ AllArgsConstructor @NoArgsConstructor
public class SubMenuDto {
	private int no; // 서브메뉴코드
	private int shop_code; // 매장코드
	private int menu_code; // 메뉴코드
	private String title; // 제목
	private String name; //서브메뉴명
	private String type; // 구분(필수 or 선택)
	private int price; //서브메뉴가격

}
