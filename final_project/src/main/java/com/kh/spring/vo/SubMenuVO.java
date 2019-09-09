package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class SubMenuVO {
	private String radio_title; // 필수메뉴제목
	private String check_title; // 선택메뉴 제목
}
