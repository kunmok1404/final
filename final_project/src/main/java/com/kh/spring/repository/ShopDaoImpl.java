package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.Food_categoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;

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

	// 서브메뉴 목록
	@Override
	public List<SubMenuDto> subMenuList(int menu_no) {
		return sqlSession.selectList("shop.sub_menu", menu_no);
	}

	// 서브메뉴 메뉴명
	@Override
	public MenuDto menuName(int menu_no) {
		return sqlSession.selectOne("shop.menu_name",menu_no );
	}

//	사업자등록신청
	@Override
	public void regist(ShopDto shopDto) {
		sqlSession.insert("shop.regist", shopDto);
	}

//	shop_seq.nextval출력
	@Override
	public int getSeq() {
		return sqlSession.selectOne("shop.seq");
	}
	
//	파일등록
	@Override
	public void files_regist(FilesDto filesDto) {
		sqlSession.insert("shop.files_regist",filesDto);
	}

//	사업자개인정보수정
	@Override
	public void edit(ShopDto shopDto) {
		sqlSession.update("shop.edit", shopDto);
	}


	@Override
	public List<ShopDto> listAll(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("shop.listAll",map);
	}

	@Override
	public List<ShopDto> countArticle(String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectList("shop.list_shop",map);
		
	}

	@Override
	public List<Food_categoryDto> categoryno() {
		return sqlSession.selectList("shop.category_no");
	}

	@Override
	public Food_categoryDto categoryname(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", keyword);
		return sqlSession.selectOne("shop.category_name", keyword);
	}

}
