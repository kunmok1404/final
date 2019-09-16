package com.kh.spring.service;

import java.io.IOException;

import com.kh.spring.vo.FoodCategoryList;

public interface CategoryService {

	void updateFoodCategory(FoodCategoryList food_list) throws IllegalStateException, IOException;
	void updateMenuCategory(FoodCategoryList food_list, int shop_code);
	void updateQnaCategory(FoodCategoryList food_list);

}
