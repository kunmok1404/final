package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.MenuDto;

public interface MenuDao {

	List<MenuDto> menuList();
	CategoryDto getCategoryInfo(MenuDto menuDto);

}
