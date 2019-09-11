package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CommissionListDto {
	private int no;
	private int shop_code;
	private String shop_name;
	private String cartegory;
	private int total_sum;
	private int commission_rate;
	private int commission_charge;
	private int commission_sum;
	private String start_date;
	private String end_date;
}
