package com.kh.spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CertDto;

@Repository
public class CertDaoImpl implements CertDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(CertDto certDto) {
		sqlSession.insert("cert.insert", certDto);
	}

	@Override
	public boolean validate(CertDto certDto) {
		int count = sqlSession.selectOne("cert.validate", certDto);
		return count > 0;
	}

	@Override
	public void delete(CertDto certDto) {
		sqlSession.delete("cert.delete", certDto);
	}
	
	
	
}
