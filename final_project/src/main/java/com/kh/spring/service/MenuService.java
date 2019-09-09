package com.kh.spring.service;

import java.io.IOException;
import java.util.List;

import com.kh.spring.vo.CheckMenuVOList;
import com.kh.spring.vo.MenuRegistVO;
import com.kh.spring.vo.RadioMenuVOList;
import com.kh.spring.vo.ShopMenuVO;

public interface MenuService {

	List<ShopMenuVO> list();
	List<ShopMenuVO> shopMenuList(int member_code);
	void menuRegist(MenuRegistVO menuRegistVO, RadioMenuVOList radioMenuVOList, CheckMenuVOList checkMenuVOList) throws IllegalStateException, IOException;

}
