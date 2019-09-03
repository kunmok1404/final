package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
//주문상세 Dto
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class OrderDetailDto {
	private int order_no;//orders no의 외래키
	private String title;//메뉴제목
	private String menu_name;//메뉴이름
	private int menu_amount;//메뉴수량
	private int menu_price;//메뉴가격

}
