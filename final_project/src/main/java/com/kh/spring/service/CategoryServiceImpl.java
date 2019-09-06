package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.repository.CategoryDao;
import com.kh.spring.vo.FoodCategoryList;
import com.kh.spring.vo.FoodCategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	// 음식카테고리 리스트 저장
	@Override
	public void updateFoodCategory(FoodCategoryList food_list) throws IllegalStateException, IOException {

		List<FoodCategoryVO> list = food_list.getCategory();
		for(FoodCategoryVO foodDto: list) {
			System.out.println("임플"+foodDto);
			
			// 카테고리 조회후 있으면 업데이터 없으면 추가
			
			
			// 파일테이블에 정보 저장
			if(foodDto.getCategory_img() != null) {
			MultipartFile file = foodDto.getCategory_img();
			String save_name = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
			categoryDao.fileRegist(FilesDto.builder()
					.no(foodDto.getCategory_code())
					.file_type(file.getContentType())
					.upload_name(file.getOriginalFilename())
					.save_name(save_name)
					.file_size(file.getSize()).build()
			);
			// 실제 파일 저장 코드
			File target = new File("D:/upload/kh15", save_name);
			file.transferTo(target); //물리적 위치에 저장하는 명령
			}
			
			// 카테고리 테이블에 정보업데이트
			
		}
		
		
	}
	
}
