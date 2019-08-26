package com.kh.spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 리뷰등록
	@Override
	public void regist(ReviewDto reviewDto) {
		sqlSession.insert("review.regist",reviewDto);
	}

	// 리뷰목록
	@Override
	public List<ReviewDto> list() {
		return sqlSession.selectList("review.list");
	}

}
