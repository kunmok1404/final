package com.kh.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.repository.ShopDao;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;
	
	//매장상세정보
	@Override
	public Map<String, List<MenuDto>> menuList(int no) {
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

	// 모달창정보 불러오기
	@Override
	public Map<String, List<SubMenuDto>> sub_menu(int menu_no) {
		List<SubMenuDto> subMenuList = shopDao.subMenuList(menu_no);
		
		Map<String, List<SubMenuDto>> map = new TreeMap<>();
		
		// 키 입력, 리스트생성(필수, 선택으로 나눠서 키저장)
		for(SubMenuDto subMenuDto : subMenuList) {
			if(subMenuDto.getType().equals("필수")) {
				map.put(subMenuDto.getTitle(), new ArrayList<>());	
			} else {
				map.put(subMenuDto.getTitle(), new ArrayList<>());	
			}	
		}
		
		// 키에다가 Dto저장
		for(SubMenuDto subMenuDto : subMenuList) {
			if(map.get(subMenuDto.getTitle()).equals("필수")) {
				map.get(subMenuDto.getTitle()).add(subMenuDto);
			} else {
				map.get(subMenuDto.getTitle()).add(subMenuDto);
			}
		}
		return map;
	}

}
