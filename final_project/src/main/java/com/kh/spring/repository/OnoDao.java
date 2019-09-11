package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.OnoDto;
import com.kh.spring.entity.OnoImgDto;
import com.kh.spring.entity.ReviewImgDto;

public interface OnoDao {

	List<OnoDto> list(int i, int j, int member_code);

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


	List<OnoDto> superlist(String apply_status, String keyword_type, String keyword, String start_date, String end_date, int i, int j, String type);

	List<OnoDto> superlist2(String apply_status, String keyword_type, String keyword, String start_date, String end_date, String reply_status, int i, int j, String type);
	
	void superedit(OnoDto onoDto);

	void updateReplyStatus(OnoDto onoDto);

	int count_reply();

	int supercount_ceo(String apply_status, String keyword_type, String keyword, String start_date, String end_date);



	int count_reply_ceo();

	int client_count();

	int ceo_count();

	int supercount(String apply_status, String keyword_type, String keyword, String start_date, String end_date);

//	List<OnoDto> superlist_ceo(String apply_status, String keyword_type, String keyword, String start_date,
//			String end_date, int i, int j, String type);
//
//	List<OnoDto> superlist2_ceo(String apply_status, String keyword_type, String keyword, String reply_status,
//			String start_date, String end_date, int i, int j, String type);











//	void read(int ono_code);







	




	


	

}
