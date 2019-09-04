package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.OnoDto;
import com.kh.spring.entity.OnoImgDto;
import com.kh.spring.entity.ReviewImgDto;

public interface OnoDao {

	List<OnoDto> list(int i, int j);

	int count();

	void write(OnoDto onoDto);

	OnoDto get(int no);

	void edit(OnoDto onoDto);

	
	
	int getOnoSeq();

	void fileRegist(FilesDto build);

	int getFilesSeq();

	void writeOnoImg(int ono_no, int files_no);

	OnoDto onoInfo(int ono_code);

	List<OnoImgDto> onoImg(int ono_code);

	FilesDto getFileInfo(int files_code);

	int supercount(String apply_status, String keyword_type, String keyword);

	List<OnoDto> superlist(String apply_status, String keyword_type, String keyword, int i, int j);

	void superedit(OnoDto onoDto);

	void updateReplyStatus(OnoDto onoDto);




//	void read(int ono_code);







	




	


	

}
