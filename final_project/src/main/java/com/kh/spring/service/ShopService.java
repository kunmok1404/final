package com.kh.spring.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.ShopDto;

public interface ShopService {

	Object menuList(int no);
	void regist(ShopDto shopDto, MultipartFile business_regist, MultipartFile sale_regist) throws IllegalStateException, IOException;

}
