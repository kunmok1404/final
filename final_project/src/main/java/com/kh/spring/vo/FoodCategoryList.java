package com.kh.spring.vo;

import java.util.List;

import com.kh.spring.entity.FoodCategoryDto;

import lombok.Data;

// 음식카테고리 등록VO
@Data
public class FoodCategoryList {
	List<FoodCategoryVO> category;
}
