package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class OrderSubDetail {
	private int order_no;//orders no의 외래키
	private String title;//추가메뉴제목
	private String sub_name;//추가 메뉴이름
	private String sub_type;//추가 메뉴 유형
	private int sub_amount;//추가 메뉴수량
	private int sub_price;//추가 메뉴가격

}
