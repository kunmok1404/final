package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class OrdersListVo {
	private int no;
	private int total_price;
	private String order_status;
	private String pay_method;
	private String order_date;
	private String id;
	private String name;
	private String title;
	private String company_name;
}
