package com.kh.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MenuListVO {

	private int no;
	private int shop_code;
	private String name; 
	private String menu_category;
	private int menu_category_code;
	private String shop_name;
	private String apply_status;
	private String sale_status;
	private String regist_date;
}
