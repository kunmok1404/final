package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.FilesDao;
import com.kh.spring.vo.FoodCategoryList;
import com.kh.spring.vo.FoodCategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private FilesDao filesDao;
	
	// 음식카테고리 리스트 저장
	@Override
	public void updateFoodCategory(FoodCategoryList food_list) throws IllegalStateException, IOException {

		List<FoodCategoryVO> list = food_list.getCategory();
		for(FoodCategoryVO foodDto: list) {
			// 카테고리 코드가 있으면 업데이트 없으면 추가
			if(foodDto.getCategory_code() != 0) {
				
			    // FoodCategory업데이트(이미지코드 빼고)
			    categoryDao.updateFoodCategoryInfo(foodDto);
			    
			    // 파일이 있다면 저장
			    if(!foodDto.getCategory_img().isEmpty()) {
			    	// 이미지 코드 조회(카테고리 코드로)
				    FoodCategoryDto foodCategoryDto = categoryDao.getFoodCategoryInfo(foodDto.getCategory_code());
			    	// 이미지 코드로 파일정보 조회
			    	FilesDto filesDto = filesDao.getFilesInfo(foodCategoryDto.getImg());
			    	// 이미지 삭제(save_name으로)
			    	File originTarget = new File("D:/upload/kh15", filesDto.getSave_name());
			    	originTarget.delete();
			    	
			    	// 신규이미지 저장
			    	MultipartFile file = foodDto.getCategory_img();
					String save_name = file.getOriginalFilename() + "-" + System.currentTimeMillis();
				
					// 파일 업데이트
					filesDao.updateFileInfo(FilesDto.builder()
							.no(filesDto.getNo())
							.file_type(file.getContentType())
							.upload_name(file.getOriginalFilename())
							.save_name(save_name)
							.file_size(file.getSize()).build()
					);
					
					// Food_category 업데이트(이미지만)
					categoryDao.updateFoodCategory(FoodCategoryDto.builder()
															.no(foodDto.getCategory_code())
															.img(filesDto.getNo()).build()
							);
					
					// 실제 파일 저장 코드
					File newTarget = new File("D:/upload/kh15", save_name);
					file.transferTo(newTarget); //물리적 위치에 저장하는 명령
			    }
			    
			} else {
				
				// Image시퀀스 구하기
				System.out.println("신규");
				int files_seq = filesDao.getFileSeq();
				System.out.println("files_seq="+files_seq);
				foodDto.setImage_code(files_seq);
				// FoodCategory에 신규정보추가
				categoryDao.insertFoodCategryInfo(foodDto);
				// Files정보 등록
				if(foodDto.getCategory_img() != null) {
					MultipartFile file = foodDto.getCategory_img();
					String save_name = file.getOriginalFilename() + "-" + System.currentTimeMillis();
				
					filesDao.fileRegist(FilesDto.builder()
							.no(files_seq)
							.file_type(file.getContentType())
							.upload_name(file.getOriginalFilename())
							.save_name(save_name)
							.file_size(file.getSize()).build()
					);
					
					// 실제 파일 저장 코드
					File target = new File("D:/upload/kh15", save_name);
					file.transferTo(target); //물리적 위치에 저장하는 명령
				}
			}
		}
	}

	// 메뉴카테고리 등록 및 수정
	@Override
	public void updateMenuCategory(FoodCategoryList food_list, int shop_code) {

		List<FoodCategoryVO> list = food_list.getCategory();
		for(FoodCategoryVO foodDto: list) {
			// 카테고리 코드가 있으면 업데이트 없으면 추가
			if(foodDto.getCategory_code() != 0) {
				
			    // MenuCategory업데이트
			    categoryDao.updateMenuCategoryInfo(foodDto);
			} else {
				// MenuCategory에 신규정보추가
				foodDto.setShop_code(shop_code);
				categoryDao.insertMenuCategryInfo(foodDto);
			}
			
		  }
	   }

	// 자주하는질문 카테고리 등록/수정
	@Override
	public void updateQnaCategory(FoodCategoryList food_list) {
		List<FoodCategoryVO> list = food_list.getCategory();
		for(FoodCategoryVO foodDto: list) {
			// 카테고리 코드가 있으면 업데이트 없으면 추가
			if(foodDto.getCategory_code() != 0) {
			    // MenuCategory업데이트
			    categoryDao.updateQnaCategory(foodDto);
			} else {
				// MenuCategory에 신규정보추가
				categoryDao.insertQnaCategory(foodDto);
			}
		  }
		}
	
	
	
	
	}
