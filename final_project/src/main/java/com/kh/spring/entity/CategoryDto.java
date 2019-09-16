package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 카테고리Dto
@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class CategoryDto {
	private int no; //카테고리번호
	private int shop_code; //매장코드
	private String name; //카테고리 명
	private String sort_seq; //노출순서
	private String work_type; //업무구분
}
