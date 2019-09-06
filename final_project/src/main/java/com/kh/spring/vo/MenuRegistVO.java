package com.kh.spring.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MenuRegistVO {
	private int shop_code; // 매장코드
	private String food_category; //음식카테고리
	private String menu_category; //메뉴카테고리
	private String menu_name; //메뉴명
	private int menu_price; //메뉴가격
	private String radio_title; // 필수제목
	private String check_title; // 선택제목
	private MultipartFile menu_list_img; // 목록 이미지
	private MultipartFile menu_detail_img; // 목록 이미지
}
