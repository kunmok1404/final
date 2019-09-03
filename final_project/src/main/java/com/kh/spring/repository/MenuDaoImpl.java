package com.kh.spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.MenuDto;

@Repository
public class MenuDaoImpl implements MenuDao {

	@Autowired
	private SqlSession sqlSession;
	
	// super_admin 메뉴관리 목록
	@Override
	public List<MenuDto> menuList() {
		return sqlSession.selectList("menu.list");
	}

	// super_admin 메뉴카테고리 조회
	@Override
	public CategoryDto getCategoryInfo(MenuDto menuDto) {
		return sqlSession.selectOne("menu.menu_category",menuDto);
	}

}
