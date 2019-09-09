package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.OnoDto;

public interface ShopOnoDao {
	List<OnoDto> superlist_ceo(String apply_status, String keyword_type, String keyword, int i, int j, String type);

	List<OnoDto> superlist2_ceo(String apply_status, String keyword_type, String keyword, String reply_status,
			int i, int j, String type);
	

	
}


