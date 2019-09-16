package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.vo.MenuRegistVO;
import com.kh.spring.vo.ShopMenuVO;

public interface MenuDao {

	List<MenuDto> menuList();
	CategoryDto getCategoryInfo(int menu_category);
	List<ShopMenuVO> shopMenuList(int shop_code, String sale_status, String apply_status, String type, String keyword,int start,int end);
	void applyMenu(int menu_code);
	void deleteMenu(int menu_code);
	int getMenuSeq();
	int getMenuCategoryCode(MenuRegistVO menuRegistVO);
	void registMenuInfo(MenuDto menuDto);
	void updateListImg(int files_seq, int menu_code);
	void updateDetailImg(int files_seq, int menu_code);
	void registRadioSubMenu(SubMenuDto subMenuDto);
	void registCheckSubMenu(SubMenuDto subMenuDto);
	MenuDto getMenuInfo(int menu_code);
	List<SubMenuDto> getSubMenuRadioList(int shop_code, int menu_code);
	List<SubMenuDto> getSubMenuCheckList(int shop_code, int menu_code);
	void updateMenuInfo(MenuDto menuDto);
	void SubMenuDelete(int menu_code, int shop_code);
	int menuCount(String sale_status, String apply_status, String type, String keyword);
	List<ShopMenuVO> menulist(String sale_status, String apply_status, String type, String keyword, int start, int end);
	int getshopcode(int member_code);
	int shopMenuCount(int shop_code, String sale_status, String apply_status, String type, String keyword);
	List<MenuDto> sMenuList(int shop_code);

}
