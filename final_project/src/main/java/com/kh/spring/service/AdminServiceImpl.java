package com.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.Food_categoryDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.ShopDao;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	ShopDao shopDao;
	
	@Override
	public int countArticle(String searchOption, String keyword) {
		List<ShopDto> list = shopDao.countArticle(searchOption,keyword);
		return list.size();
	}

	@Override
	public List<ShopDto> listAll(int start, int end, String searchOption, String keyword) {
		if (searchOption.equals("category")) {
			Food_categoryDto category = shopDao.categoryname(keyword);
			 keyword = Integer.toString(category.getNo());
	}
		return shopDao.listAll(start,end,searchOption,keyword);
	}
	
}
