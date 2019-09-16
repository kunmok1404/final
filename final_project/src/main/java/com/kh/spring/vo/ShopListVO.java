package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ShopListVO {

	private int no; // 매장번호
	private String shop_name; // 매장명
	private int min_price; // 최소주문금
	private String min_time; // 예상배달시간
	private double score; //평균평점
	private int review; //리뷰갯수
	private int shop_img; // 매장로고 이미지코드
	
}
