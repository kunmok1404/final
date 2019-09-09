package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MenuDetailVO {
	
	private String food_cat; // 음식카테고리명
	private String menu_cat; // 메뉴카테고리명
	private String menu_name; // 메뉴명
	private int menu_price; // 메뉴가격
	private int basic_img; // 목록이미지코드
	private int detail_img; //상세 이미지 코드
	
}
