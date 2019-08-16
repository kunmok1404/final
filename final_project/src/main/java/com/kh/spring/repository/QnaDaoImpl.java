package com.kh.spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<QnaDto> list() {
		return sqlSession.selectList("qna.list");
	}

	
}
