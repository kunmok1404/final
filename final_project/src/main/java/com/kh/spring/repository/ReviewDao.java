package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.ReviewDto;

public interface ReviewDao {

	void regist(ReviewDto reviewDto);
	List<ReviewDto> list();

}
