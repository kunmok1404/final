package com.kh.spring.repository;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.vo.FoodCategoryVO;

public interface FilesDao {

	FilesDto getFilesInfo(int img);
	int getFileSeq();
	void insertFilesInfo(FoodCategoryVO foodDto);
	void updateFileInfo(FilesDto build);
	void fileRegist(FilesDto filesDto);
	void deleteFile(int basic_img);
}
