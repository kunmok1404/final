package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CartSubDto {
	private int no;
	private String sub_type;
	private String sub_title;
	private String sub_name;
	private int sub_pirce;
	

}
