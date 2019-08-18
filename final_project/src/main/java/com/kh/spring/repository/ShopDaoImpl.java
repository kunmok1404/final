package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Autowired
	private SqlSession sqlSession;

	// 매장목록 더보기 페이징
	@Override
	public List<ShopDto> ajaxPaging(int start, int end, int cat_no) {
		Map<String, Integer> map = new HashMap<>();
		System.out.println("임플cat_no="+cat_no);
		System.out.println("임플start=" + start);
		System.out.println("임플end=" + end);
		map.put("start", start);
		map.put("end", end);
		map.put("cat_no", cat_no);
		
		return sqlSession.selectList("shop.list", map);
	}

	// 카테고리 목록조회
	@Override
	public List<CategoryDto> catList() {
		return sqlSession.selectList("shop.category");
	}

	// 매장상세Info
	@Override
	public ShopDto shopInfo(int no) {
		return sqlSession.selectOne("shop.shop_info", no);
	}

	// 매장상세 메뉴목록
	@Override
	public List<MenuDto> menuList(int no) {
		return sqlSession.selectList("shop.menu", no);
	}

}
