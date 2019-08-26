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
//	업주신청 서비스
	@Override
	public void regist(ShopDto shopDto, MultipartFile business, MultipartFile img,
			MultipartFile sale) throws IllegalStateException, IOException {
		int no1 = shopDao.getSeq();
		int no2 = shopDao.getSeq();
		int no3 = shopDao.getSeq();
		
		String savename = img.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto filesDto = new FilesDto();
		filesDto.setNo(no1);
		filesDto.setSave_name(savename);
		filesDto.setUpload_name(img.getOriginalFilename());
		filesDto.setSize(img.getSize());
		filesDto.setFile_type(img.getContentType());
		shopDao.files_regist(filesDto);
		
		
		
		String savename2 = business.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto filesDto2 = new FilesDto();
		filesDto2.setNo(no2);
		filesDto2.setSave_name(savename2);
		filesDto2.setUpload_name(business.getOriginalFilename());
		filesDto2.setSize(business.getSize());
		filesDto2.setFile_type(business.getContentType());
		shopDao.files_regist(filesDto2);
		
		
		
		String savename3 = sale.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto filesDto3 = new FilesDto();
		filesDto3.setNo(no3);
		filesDto3.setSave_name(savename3);
		filesDto3.setUpload_name(sale.getOriginalFilename());
		filesDto3.setSize(sale.getSize());
		filesDto3.setFile_type(sale.getContentType());
		shopDao.files_regist(filesDto3);
		
		shopDto.setShop_img(no1);
		shopDto.setBusiness_regist(no2);
		shopDto.setSale_regist(no3);
		
		File dir = new File("D:\\upload\\kh15");
		File target = new File(dir, savename);
		img.transferTo(target);
		
		File target2 = new File(dir, savename2);
		sale.transferTo(target2);
		
		File target3 = new File(dir, savename3);
		business.transferTo(target3);
		
		
		shopDao.regist(shopDto);
	}

	@Override
	public void edit(ShopDto shopDto, MultipartFile img) throws IllegalStateException, IOException {
		
		int no1 = shopDao.getSeq();
		
		String savename = img.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto filesDto = new FilesDto();
		filesDto.setNo(no1);
		filesDto.setSave_name(savename);
		filesDto.setUpload_name(img.getOriginalFilename());
		filesDto.setSize(img.getSize());
		filesDto.setFile_type(img.getContentType());
		shopDao.files_regist(filesDto);
		
		File dir = new File("D:\\upload\\kh15");
		File target = new File(dir, savename);
		img.transferTo(target);
		
		shopDto.setShop_img(no1);
		
		
		shopDao.edit(shopDto);
		
	}

	


}
