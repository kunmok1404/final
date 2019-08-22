package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ShopDto {
	private int no;
	private int category;
	private String company_name;
	private String company_code; 
	private String ceo; 	
	private String ceo_phone;
	private String bank; 
	private String account_number; 
	private String account_name; 
	private String shop_name; 
	private String shop_phone; 
	private String zip_code; 
	private String basic_addr; 
	private String detail_addr; 
	private String content; 
	private String regist_date; 
	private String contract_date;
	private String finish_date; 
	private String contract_status; 
	private String apply_status; 
	private int min_price; 
	private String min_time; 
	private int delivery_price; 
	private String start_time; 
	private String finish_time;
	private String reason; 
	private double location_x,location_y;
}
