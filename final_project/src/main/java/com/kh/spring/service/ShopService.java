package com.kh.spring.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.SubMenuDto;

public interface ShopService {

	Map<String, List<MenuDto>> menuList(int no);
	Map<String, List<SubMenuDto>> sub_menu(int menu_no);

}
