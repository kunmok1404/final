package com.kh.spring.repository;

import com.kh.spring.entity.FilesDto;

public interface CategoryDao {

	int getFileSeq();
	void fileRegist(FilesDto filesDto);

}
