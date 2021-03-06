package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class FoodCategoryDto {
	private int no; //카테고리번호
	private String name; //카테고리 명
	private String sort_seq; //노출순서
	private int img; //카테고리 이미지코드
}
