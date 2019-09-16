package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ReviewDto.ReviewDtoBuilder;
import com.kh.spring.vo.ShopReviewVO;
import com.kh.spring.entity.ReviewImgDto;

public interface ReviewDao {

	void write(ReviewDto reviewDto);
	List<ShopReviewVO> list(int member_code);
	int getReviewSeq();
	void writeReviewImg(int review_no, int files_no);
	int getFilesSeq();
	void fileRegist(FilesDto build);
	void reviewStatus(int order_code);
	ReviewDto reviewInfo(int review_code);
	void read(int review_code);
	List<ReviewImgDto> reviewImg(int review_code);
	FilesDto getFileInfo(int files_code);
	List<ShopReviewVO> superList();
	int searchNumber();
	void replyRegist(ReviewDto reply_content);
	void updateReplyStatus(ReviewDto reviewDto);
	ReviewDto getReivewInfo(int no);
	void insertReviewImg(int files_code, int no);

}
