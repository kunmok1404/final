package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//메뉴 + 서브메뉴 VIEW
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Menu_SubMenuView {

	private String menu_category; // 메뉴카테고리명
	private String shop_code; // 매장코드
	private String menu_name; // 메뉴명
	private int menu_price; // 메뉴가격
	
	private String subMenu_title; // 서브메뉴 제목
	private String subMenu_name; // 서브메뉴 명
	private String subMenu_type; // 서브메뉴 구분(필수,선택)
	private int subMenu_price; // 서브메뉴 가격
}
