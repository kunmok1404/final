package com.kh.spring.entity;

import java.util.List;

import lombok.Data;


//order_detail을 list로 받기 위한 vo
@Data
public class OrderDetailListVo {
	
	private List<OrderDetailDto> list;
}
