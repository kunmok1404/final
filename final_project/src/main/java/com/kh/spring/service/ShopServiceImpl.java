package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.repository.ShopDao;


@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;
	
	//留ㅼ옣�긽�꽭�젙蹂�
	@Override
	public Map<String, List<MenuDto>> menuList(int no) {
		List<MenuDto> menu_list = shopDao.menuList(no);
		
		Map<String, List<MenuDto>> map = new TreeMap<>();
		
		// �궎 �엯�젰, 由ъ뒪�듃�깮�꽦
		for(MenuDto menuDto : menu_list) {
			map.put(menuDto.getMenu_category(), new ArrayList<>());
		}
		
		// �궎�뿉�떎媛� Dto���옣
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


	@Override
	public void regist(ShopDto shopDto, MultipartFile business_regist, MultipartFile sale_regist) throws IllegalStateException, IOException {
		
		int no = shopDao.getSeq();
		
		shopDto.setNo(no);
		
		shopDao.regist(shopDto);
		
		String savename = business_regist.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto filesDto = new FilesDto();
		filesDto.setSave_name(savename);
//		filesDto.setShop_code(no);
		filesDto.setUpload_name(business_regist.getOriginalFilename());
//		filesDto.setSize(business_regist.getSize());
		filesDto.setFile_type(business_regist.getContentType());
		shopDao.business_regist(filesDto);
		
		String savename2 = sale_regist.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto filesDto2 = new FilesDto();
		filesDto2.setSave_name(savename2);
//		filesDto2.setShop_code(no);
		filesDto2.setUpload_name(sale_regist.getOriginalFilename());
//		filesDto2.setSize(sale_regist.getSize());
		filesDto2.setFile_type(sale_regist.getContentType());
		shopDao.sale_regist(filesDto2);
		
		File dir = new File("D:\\upload\\kh15");
		File target = new File(dir, savename);
		business_regist.transferTo(target);
		
		File target2 = new File(dir, savename2);
		sale_regist.transferTo(target2);
	}

	


}
