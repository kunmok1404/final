package com.kh.spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.FilesDto;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 파일 seq 생성
	@Override
	public int getFileSeq() {
		return sqlSession.selectOne("review.review_seq");
	}

	// 파일 테이블에 등록
	@Override
	public void fileRegist(FilesDto filesDto) {
		sqlSession.insert("review.files_regist",filesDto);
	}

}
