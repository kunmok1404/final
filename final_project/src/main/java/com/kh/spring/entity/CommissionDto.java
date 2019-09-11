package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CommissionDto {
	private int no;
	private int commission_rate;
	private String commission_date;
}
