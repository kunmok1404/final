package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.vo.MenuRegistVO;

public interface MenuDao {

	List<MenuDto> menuList();
	CategoryDto getCategoryInfo(int menu_category);
	List<MenuDto> shopMenuList(int shop_code);
	void applyMenu(int menu_code);
	void deleteMenu(int menu_code);
	int getMenuSeq();
	int getMenuCategoryCode(MenuRegistVO menuRegistVO);
	void registMenuInfo(MenuDto menuDto);
	void updateListImg(int files_seq, int menu_code);
	void updateDetailImg(int files_seq, int menu_code);
	void registRadioSubMenu(SubMenuDto subMenuDto);
	void registCheckSubMenu(SubMenuDto subMenuDto);
	MenuDto getMenuInfo(int shop_code, int menu_code);

}
