package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;

public interface ShopDao {

	List<ShopDto> ajaxPaging(int start, int end, int cat_no);
	List<CategoryDto> catList();
	ShopDto shopInfo(int no);
	List<MenuDto> menuList(int no);
}
