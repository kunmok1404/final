package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class CheckMenuVO {

	private String check_name; //선택메뉴명
	private int check_price; // 선택메뉴가격
}
