package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.vo.FoodCategoryVO;

public interface CategoryDao {

	int getFileSeq();
	void fileRegist(FilesDto filesDto);
	FoodCategoryDto getFoodCategoryInfo(int category_code);
	void updateFoodCategoryInfo(FoodCategoryVO foodDto);
	void insertFoodCategryInfo(FoodCategoryVO foodDto);
	void updateFileInfo(FilesDto build);
	void updateFoodCategory(FoodCategoryDto build);
	List<FoodCategoryDto> getFoodCategoryList();
	List<CategoryDto> getMenuCategory(int shop_code);

}
