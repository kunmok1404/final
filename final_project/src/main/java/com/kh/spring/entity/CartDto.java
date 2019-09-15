package com.kh.spring.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
//카트 관련 Dto
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CartDto {
	private int no;//장바구니번호
	private int member_code;//member-no의 외래키
	private int shop_code;//매장코드
	private String title;//메뉴제목
	private String menu_name;//메뉴명
	private int menu_amount;//메뉴수량
	private int menu_price;//메뉴가격
	private String regist_date;//등록일
	
	private List<CartSubDto> list;
}
