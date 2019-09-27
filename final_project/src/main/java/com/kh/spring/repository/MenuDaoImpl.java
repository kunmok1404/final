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
import com.kh.spring.vo.MenuListVO;
import com.kh.spring.vo.MenuRegistVO;
import com.kh.spring.vo.ShopMenuVO;

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

	// 메뉴 기본정보 수정
	@Override
	public void updateMenuInfo(MenuDto menuDto) {
		sqlSession.update("menu.updateMenuInfo",menuDto);
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

	// 메뉴 DTO조회(메뉴코드로)
	@Override
	public MenuDto getMenuInfo(int menu_code) {
		return sqlSession.selectOne("menu.getMenuInfo",menu_code);
	}

	// 필수메뉴 목록
	@Override
	public List<SubMenuDto> getSubMenuRadioList(int shop_code, int menu_code) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("shop_code", shop_code);
		map.put("menu_code", menu_code);
		return sqlSession.selectList("menu.getSubMenuRadioInfo",map);
	}

	// 선택메뉴 목록
	@Override
	public List<SubMenuDto> getSubMenuCheckList(int shop_code, int menu_code) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("shop_code", shop_code);
		map.put("menu_code", menu_code);
		return sqlSession.selectList("menu.getSubMenuCheckInfo",map);
	}

	// 서브메뉴 데이터 삭제
	@Override
	public void SubMenuDelete(int menu_code, int shop_code) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("shop_code", shop_code);
		map.put("menu_code", menu_code);
		sqlSession.delete("menu.subMenuDelete",map);
	}

	@Override
	public int menuCount(String sale_status, String apply_status, String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("apply_status", apply_status);
		param.put("sale_status", sale_status);			
		param.put("type", type);
		param.put("keyword", keyword);
		return sqlSession.selectOne("menu.menuCount",param);
	}

	@Override
	public List<MenuListVO> menulist(String sale_status, String apply_status, String type, String keyword, int start,
			int end, String start_date, String end_date) {
		Map<String, Object> param = new HashMap<>();
			param.put("sale_status", sale_status);			
			param.put("apply_status", apply_status);
			param.put("type", type);
			param.put("keyword", keyword);
			param.put("start", start);
			param.put("end", end);
			param.put("start_date", start_date);
			param.put("end_date", end_date);
			
		return sqlSession.selectList("menu.menuList",param);
	}

	@Override
	public int getshopcode(int member_code) {
		return sqlSession.selectOne("menu.getshopcode",member_code);
	}

	@Override
	public int shopMenuCount(int shop_code, String sale_status, String apply_status, String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("shop_code", shop_code);
		try {
		if(apply_status!=null) {
		param.put("apply_status", apply_status);
		}
		if(sale_status!=null) {
		param.put("sale_status", sale_status);			
		}
		if(type!=null && keyword!=null) {
		param.put("type", type);
		param.put("keyword", keyword);
		}	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sqlSession.selectOne("menu.shopmenuCount",param);
	}

	@Override
	public List<ShopMenuVO> shopMenuList(int shop_code, String sale_status, String apply_status, String type, String keyword,int start,int end) {
		Map<String, Object> param = new HashMap<>();
		//검색일경우 검색어를 mybatis에 전달
		param.put("shop_code",shop_code);
		if(sale_status!=null) {
			param.put("sale_status", sale_status);			
		}
		if(apply_status!=null){
			param.put("apply_status", apply_status);
		}
		if(type!=null && keyword!=null) {
		param.put("type", type);
		param.put("keyword", keyword);
		}	
		param.put("start", start);
		param.put("end", end);
		return sqlSession.selectList("menu.shopmenuList",param);

}

	@Override
	public List<MenuDto> sMenuList(int shop_code) {
		return sqlSession.selectList("menu.shopList",shop_code);
	}

	@Override
	public List<MenuDto> menulist() {
		return sqlSession.selectList("menu.list");
	}
}