package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;

public interface ShopDao {
	List<ShopDto> ajaxPaging(int start, int end, int cat_no);
	List<FoodCategoryDto> catList();
	ShopDto shopInfo(int no);
	List<MenuDto> menuList(int no);
	List<SubMenuDto> subMenuList(int menu_no);
	MenuDto menuName(int menu_no);
	void regist(ShopDto shopDto);
	int getSeq();
	void files_regist(FilesDto filesDto);
	void edit(ShopDto shopDto);
	List<ShopDto> listAll(int start, int end, String searchop, String keyword);
	List<ShopDto> countArticle(String searchOption, String keyword);
	List<FoodCategoryDto> categoryno();
	FoodCategoryDto categoryname(String keyword);
}
