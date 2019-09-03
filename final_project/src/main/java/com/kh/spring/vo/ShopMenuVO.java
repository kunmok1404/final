package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 매장 + 메뉴 vo
@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ShopMenuVO {
	
	private int no; //메뉴코드
	private int shop_code; // 매장코드
	private String shop_name; // 매장이름
	private String menu_category; // 메뉴카테고리명
	private String name; // 메뉴명
	private int price; //메뉴가격
	private String regist_date; // 등록일
	private String edit_date; // 수정일
	private String apply_status; // 승인상태
	private String sale_status; // 판매상태
	private int basic_img; // 기본이미지 코드
	private int detail_img; // 상세이미지 코드
	
}
