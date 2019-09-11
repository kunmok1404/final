package com.kh.spring.test;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
@ToString(exclude = {"list"})
public class TestVO {
	private String test1, test2, test3, test4, test5;
	private List<TestSubVO> list;
}
