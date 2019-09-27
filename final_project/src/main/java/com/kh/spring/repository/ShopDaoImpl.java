package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.vo.ShopListVO;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ShopListVO> ajaxPaging(int start, int end, int cat_no, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("cat_no", cat_no);
		map.put("keyword", keyword);
		System.out.println("keyword="+keyword);
		return sqlSession.selectList("shop.list", map);
	}

	@Override
	public List<FoodCategoryDto> catList() {
		return sqlSession.selectList("shop.category");
	}

	// 留매장정보 구하기
	@Override
	public ShopDto shopInfo(int no) {
		return sqlSession.selectOne("shop.shop_info", no);
	}

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
	public List<FoodCategoryDto> categoryno() {
		return sqlSession.selectList("shop.category_no");
	}

	@Override
	public FoodCategoryDto categoryname(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", keyword);
		return sqlSession.selectOne("shop.category_name", keyword);
	}

	@Override
	public ShopDto myshop(int shop_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", shop_code);
		return sqlSession.selectOne("shop.myshop",map);
	}

	@Override
	public List<ShopDto> shop() {
		return sqlSession.selectList("shop.all");
	}

	@Override
	public List<ShopDto> search_name(String sh_name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shop_name", sh_name);
		return  sqlSession.selectList("shop.search_name",map);
	}

	// 매장관리에서 승인버튼 클릭시
	@Override
	public void apply(int shop_code) {
		sqlSession.update("shop.apply_shop", shop_code);
	}

	// shop_seq 생성
	@Override
	public int getShopSeq() {
		return sqlSession.selectOne("shop.shop_seq");
	}

	// 매장정보 삭제
	@Override
	public void deleteShop(int shop_code) {
		sqlSession.delete("shop.deleteShop",shop_code);
	}

	// 매장 갯수
	@Override
	public int getShopCount(int cat_no) {
		return sqlSession.selectOne("shop.getShopCount",cat_no);
	}


	@Override
	public int getShopCode(int member_code) {
		int value = 0;
		try {
			value = sqlSession.selectOne("shop.getShopCode",member_code);			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return value;
			
	}

}
