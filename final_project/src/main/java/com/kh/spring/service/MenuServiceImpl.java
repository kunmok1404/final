package com.kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.MenuDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.vo.ShopMenuVO;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	
	// super_admin 메뉴관리 목록
	@Override
	public List<ShopMenuVO> list() {
		List<MenuDto> list = menuDao.menuList();
		List<ShopMenuVO> menu_list = new ArrayList<>();
		// 내용 다시 세팅
		for(MenuDto menuDto : list) {
			//메뉴 카테고리
			CategoryDto categoryDto = menuDao.getCategoryInfo(menuDto);
			// 매장이름
			ShopDto shopDto = shopDao.shopInfo(menuDto.getShop_code());
			ShopMenuVO shopVO = ShopMenuVO.builder().no(menuDto.getNo())
																					.name(menuDto.getName())
																					.menu_category(categoryDto.getName())
																					.shop_name(shopDto.getShop_name())
																					.apply_status(menuDto.getApply_status())
																					.sale_status(menuDto.getSale_status())
																					.regist_date(menuDto.getRegist_date())
																					.build();
			menu_list.add(shopVO);
		}
		return menu_list;
	}
	
}
