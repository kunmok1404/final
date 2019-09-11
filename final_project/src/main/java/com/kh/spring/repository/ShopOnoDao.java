package com.kh.spring.repository;

import java.util.List;

//import com.kh.spring.entity.OnoDto;
import com.kh.spring.entity.ShopOnoDto;

public interface ShopOnoDao {
	List<ShopOnoDto> superlist_ceo(String apply_status, String keyword_type, String keyword, String start_date, String end_date, int i, int j, String type);

	List<ShopOnoDto> superlist2_ceo(String apply_status, String keyword_type, String keyword, String reply_status,
			 String start_date, String end_date, int i, int j, String type);
	

	
}


