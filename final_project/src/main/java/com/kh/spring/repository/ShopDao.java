package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.vo.ShopListVO;

public interface ShopDao {
	List<ShopListVO> ajaxPaging(int start, int end, int cat_no, String keyword);
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
	ShopDto myshop(int shop_code);
	List<ShopDto> shop();
	List<ShopDto> search_name(String sh_name);
	void apply(int shop_code);
	int getShopSeq();
	void deleteShop(int shop_code);
	int getShopCount(int cat_no);
	int getShopCode(int member_code);
}
