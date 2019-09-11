package com.kh.spring.test;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class TestSubVO {
	private String sub1, sub2, sub3, sub4, sub5;
}
