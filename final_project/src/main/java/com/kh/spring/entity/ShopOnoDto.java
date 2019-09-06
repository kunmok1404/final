package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ShopOnoDto {
	private int shop_no;
	private String company_name;
	private String company_code;
	private int ono_no;
	private int member_code;
	private String title;
	private String content;
	private String regist_date;
	private String edit_date;
	private String reply_status;
	private String reply_content;
	private String type;
	private String category;

}
