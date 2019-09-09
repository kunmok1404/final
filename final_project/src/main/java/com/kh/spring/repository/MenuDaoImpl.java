package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.vo.MenuRegistVO;

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
	public CategoryDto getCategoryInfo(int menu_category) {
		return sqlSession.selectOne("menu.menu_category",menu_category);
	}

	// shop_admin 메뉴목록 구하기
	@Override
	public List<MenuDto> shopMenuList(int shop_code) {
		return sqlSession.selectList("menu.shopList",shop_code);
	}

	// 메뉴승인버튼 클릭시
	@Override
	public void applyMenu(int menu_code) {
		sqlSession.update("menu.apply_menu",menu_code);
	}

	// 메뉴삭제버튼 클릭시
	@Override
	public void deleteMenu(int menu_code) {
		sqlSession.delete("menu.delete_menu",menu_code);
	}

	// 메뉴시퀀스 조회
	@Override
	public int getMenuSeq() {
		return sqlSession.selectOne("menu.menu_seq");
	}

	// 메뉴카테고리 코드 조회(메뉴명+매장코드로)
	@Override
	public int getMenuCategoryCode(MenuRegistVO menuRegistVO) {
		return sqlSession.selectOne("menu.getMenuCatCode",menuRegistVO);
	}

	// 메뉴 기본정보 등록
	@Override
	public void registMenuInfo(MenuDto menuDto) {
		sqlSession.insert("menu.registMenuInfo",menuDto);
	}

	// 메뉴 테이블에 목록이미지 코드 저장
	@Override
	public void updateListImg(int files_seq, int menu_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("files_seq", files_seq);
		map.put("menu_code", menu_code);
		sqlSession.update("menu.updateListImg",map);
	}

	// 메뉴 테이블에 상세이미지 코드 저장
	@Override
	public void updateDetailImg(int files_seq, int menu_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("files_seq", files_seq);
		map.put("menu_code", menu_code);
		sqlSession.update("menu.updateDetailImg",map);
	}

	// 서브메뉴 테이블에 필수메뉴 등록
	@Override
	public void registRadioSubMenu(SubMenuDto subMenuDto) {
		sqlSession.insert("menu.registRadioSubMenu",subMenuDto);
	}

	// 서브메뉴 테이블에 선택메뉴 등록
	@Override
	public void registCheckSubMenu(SubMenuDto subMenuDto) {
		sqlSession.insert("menu.registCheckSubMenu",subMenuDto);
	}

	// 메뉴상세기본정보 구하기
	@Override
	public MenuDto getMenuInfo(int shop_code, int menu_code) {
		
		return null;
	}

}
