package com.kh.spring.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;

public interface ShopService {

	Map<String, List<MenuDto>> menuList(int no);
	Map<String, List<SubMenuDto>> sub_menu(int menu_no);
	void regist(ShopDto shopDto, MultipartFile business,MultipartFile img, MultipartFile sale) throws IllegalStateException, IOException;
	void edit(ShopDto shopDto, MultipartFile img) throws IllegalStateException, IOException;

}
