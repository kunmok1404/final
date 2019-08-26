package com.kh.spring.service;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ShopReviewVO;

public interface ReviewService {

	void fileRegist(MultipartFile file, ReviewDto reviewDto) throws IllegalStateException, IOException;
	int ReviewRegist(ReviewDto reviewDto);
	ReviewDto reviewInfo(int review_code);
	List<ShopReviewVO> list(int member_code);
	ResponseEntity<ByteArrayResource> reviewImg(int files_code) throws IOException;

}
