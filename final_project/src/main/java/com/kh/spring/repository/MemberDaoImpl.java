package com.kh.spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.MyshopDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void like(MyshopDto myshop) {
		sqlSession.insert("member.like", myshop);
	}

	@Override
	public void unlike(MyshopDto myshop) {
		sqlSession.delete("member.unlike", myshop);
	}

}
