package com.kh.spring.service;

import java.util.List;

import com.kh.spring.entity.ShopDto;

public interface AdminService {

	public int countArticle(String searchOption, String keyword);
	public List<ShopDto> listAll(int start, int end, String searchOption, String keyword);
}
