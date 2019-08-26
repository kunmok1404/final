package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.OnoDto;

public interface OnoDao {

	List<OnoDto> list(int i, int j);

	int count();

	void write(OnoDto onoDto);

	OnoDto get(int no);

	int getSeq();


	void image(FilesDto filesDto);

	void edit(OnoDto onoDto);

	FilesDto getfile(int no);




	




	


	

}
