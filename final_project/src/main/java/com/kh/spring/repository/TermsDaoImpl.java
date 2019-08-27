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
	public TermsDto terms1() {
		return sqlSession.selectOne("terms.terms1");
	}

	@Override
	public TermsDto terms2() {
		return sqlSession.selectOne("terms.terms2");
	}

	// 이용약관 수정
	@Override
	public void update1(String terms_content1) {
		sqlSession.update("terms.update1",terms_content1);
	}

	// 개인정보처리방침 수정
	@Override
	public void update2(String terms_content2) {
		sqlSession.update("terms.update2",terms_content2);
	}

}
