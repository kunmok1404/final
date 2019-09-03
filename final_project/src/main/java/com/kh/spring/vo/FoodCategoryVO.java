package com.kh.spring.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

// Food_category Dto
@Data
public class FoodCategoryVO {
	private String cat_name; // 카테고리명
	private int sort_no; // 노출순서
	private int category_code; // 카테고리 코드
	private int image_code;
	private MultipartFile category_img; // 이미지 정보
}
