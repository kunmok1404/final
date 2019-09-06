package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder @Data @AllArgsConstructor @NoArgsConstructor
public class RadioMenuVO {
	private String radio_name; //필수메뉴명
	private int radio_price; // 필수메뉴가격
}
