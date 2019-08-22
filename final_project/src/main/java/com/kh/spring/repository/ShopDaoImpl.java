package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Autowired
	private SqlSession sqlSession;

	// 留ㅼ옣紐⑸줉 �뜑蹂닿린 �럹�씠吏�
	@Override
	public List<ShopDto> ajaxPaging(int start, int end, int cat_no) {
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("cat_no", cat_no);
		
		return sqlSession.selectList("shop.list", map);
	}

	// 移댄뀒怨좊━ 紐⑸줉議고쉶
	@Override
	public List<CategoryDto> catList() {
		return sqlSession.selectList("shop.category");
	}

	// 留ㅼ옣�긽�꽭Info
	@Override
	public ShopDto shopInfo(int no) {
		return sqlSession.selectOne("shop.shop_info", no);
	}

	// 留ㅼ옣�긽�꽭 硫붾돱紐⑸줉
	@Override
	public List<MenuDto> menuList(int no) {
		return sqlSession.selectList("shop.menu", no);
	}

	@Override
	public void regist(ShopDto shopDto) {
		sqlSession.insert("shop.regist", shopDto);
	}

	@Override
	public int getSeq() {
		return sqlSession.selectOne("shop.seq");
	}

	@Override
	public void business_regist(FilesDto filesDto) {
		sqlSession.insert("shop.business_regist",filesDto);
	}

	@Override
	public void sale_regist(FilesDto filesDto) {
		sqlSession.insert("shop.sale_regist",filesDto);
		
	}
	
	
}
