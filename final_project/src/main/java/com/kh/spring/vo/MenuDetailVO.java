package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MenuDetailVO {
	
	private String food_cat; // 음식카테고리명
	private String menu_cat; // 메뉴카테고리명
	
}
