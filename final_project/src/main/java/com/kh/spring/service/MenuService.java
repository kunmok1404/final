package com.kh.spring.service;

import java.io.IOException;
import java.util.List;

import com.kh.spring.vo.CheckMenuVOList;
import com.kh.spring.vo.MenuDetailVO;
import com.kh.spring.vo.MenuRegistVO;
import com.kh.spring.vo.RadioMenuVOList;
import com.kh.spring.vo.ShopMenuVO;
import com.kh.spring.vo.SubMenuVO;

public interface MenuService {

	List<ShopMenuVO> list();
	List<ShopMenuVO> shopMenuList(int member_code);
	void menuRegist(MenuRegistVO menuRegistVO, RadioMenuVOList radioMenuVOList, CheckMenuVOList checkMenuVOList) throws IllegalStateException, IOException;
	MenuDetailVO getMenuDetailInfo(int shop_code, int menu_code);
	SubMenuVO getSubTitle(int shop_code, int menu_code);
	void menuUpdate(int menu_code, MenuRegistVO menuRegistVO, RadioMenuVOList radioMenuVOList, CheckMenuVOList checkMenuVOList) throws IllegalStateException, IOException;
	void deleteMenu(int menu_code);

}
