package com.kh.spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.vo.FoodCategoryVO;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 파일 seq 생성
	@Override
	public int getFileSeq() {
		return sqlSession.selectOne("review.review_seq");
	}

	// FoodCategory 조회
	@Override
	public FoodCategoryDto getFoodCategoryInfo(int category_code) {
		return sqlSession.selectOne("category.getFoodCategory",category_code);
	}

	// FoodCategory 업데이트(이미지 빼고)
	@Override
	public void updateFoodCategoryInfo(FoodCategoryVO foodDto) {
		sqlSession.update("category.updateFoodCategory", foodDto);
	}

	// FoodCategory 신규정보추가
	@Override
	public void insertFoodCategryInfo(FoodCategoryVO foodDto) {
		sqlSession.insert("category.insertFoodCategoryInfo",foodDto);
	}

	// Food_categry 업데이트(이미지만)
	@Override
	public void updateFoodCategory(FoodCategoryDto foodCategoryDto) {
		sqlSession.update("category.updateCategoryImg", foodCategoryDto);
	}

	// Food_category 전체목록
	@Override
	public List<FoodCategoryDto> getFoodCategoryList() {
		return sqlSession.selectList("category.foodCategoryList");
	}

	// Menu_category 목록 조회( 매장코드로)
	@Override
	public List<CategoryDto> getMenuCategory(int shop_code) {
		return sqlSession.selectList("category.menuCategoryList", shop_code);
	}

	// Menu_categry Dto 조회(메뉴코드로)
	@Override
	public CategoryDto getMenuCategoryInfo(int menu_code) {
		return sqlSession.selectOne("category.menuCategoryInfo", menu_code);
	}

}
