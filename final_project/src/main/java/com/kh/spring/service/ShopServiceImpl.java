package com.kh.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.MenuDto;
import com.kh.spring.repository.ShopDao;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;
	
	//매장상세정보
	@Override
	public Object menuList(int no) {
		List<MenuDto> menu_list = shopDao.menuList(no);
		
		Map<String, List<MenuDto>> map = new TreeMap<>();
		
		// 키 입력, 리스트생성
		for(MenuDto menuDto : menu_list) {
			map.put(menuDto.getMenu_category(), new ArrayList<>());
		}
		
		// 키에다가 Dto저장
		for(MenuDto menuDto : menu_list) {
			map.get(menuDto.getMenu_category()).add(menuDto);
		}
		return map;
	}


}
