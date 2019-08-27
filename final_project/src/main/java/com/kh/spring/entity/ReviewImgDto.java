package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ReviewImgDto {

	// 리뷰+이미지 중간테이블
	private int review_no; // 리뷰코드
	private int files_no; //파일코드
}
