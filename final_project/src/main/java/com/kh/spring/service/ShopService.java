package com.kh.spring.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ReviewImgDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.vo.ShopListVO;

public interface ShopService {

	Map<String, List<MenuDto>> menuList(int no);
	Map<String, List<SubMenuDto>> sub_menu(int menu_no);
	void regist(ShopDto shopDto, MultipartFile business_file,MultipartFile sale_file, MultipartFile logo) throws IllegalStateException, IOException;
	void edit(ShopDto shopDto, MultipartFile img) throws IllegalStateException, IOException;
	void deleteShop(int shop_code);
	void apply(int shop_code);
	List<ShopListVO> ajaxPaging(int start, int end, int cat_no, String keyword);
	ShopListVO shopInfoVO(int no);
	ResponseEntity<ByteArrayResource> download(int files_code) throws IOException;
	Map<ReviewDto, List<ReviewImgDto>> reviewList(int no);

}
