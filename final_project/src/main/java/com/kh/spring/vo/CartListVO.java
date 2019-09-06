package com.kh.spring.vo;

import java.util.List;

import com.kh.spring.entity.CartDto;

import lombok.Data;

/**
 *	CartDto가 여러개 넘어올 경우 받기 위한 저장 클래스
 *	넘어와야 하는 데이터 형식은 다음과 같음
 *	list[n].변수명 
 */

@Data
public class CartListVO {
	private List<CartDto> list;
}
