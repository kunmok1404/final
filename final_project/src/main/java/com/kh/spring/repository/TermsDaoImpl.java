package com.kh.spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.TermsDto;

@Repository
public class TermsDaoImpl implements TermsDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<TermsDto> list1() {
		return sqlSession.selectList("terms.list1");
	}

	@Override
	public List<TermsDto> list2() {
		return sqlSession.selectList("terms.list2");
	}

}
