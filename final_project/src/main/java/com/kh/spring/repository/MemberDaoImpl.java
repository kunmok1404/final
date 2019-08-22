package com.kh.spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	//회원가입 기능
	@Override
	public boolean regist(MemberDto memberDto) {
		try {
			sqlSession.insert("member.regist", memberDto);
			return true;
		}
		catch(Exception e) {
			return false;
		}
	}

	//아이디 중복 확인
	@Override
	public MemberDto id_check(String id) {
		return sqlSession.selectOne("member.id_check", id);
	}
	
	//암호화 적용 전 로그인
	@Override
	public MemberDto login(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.login", memberDto);
		return result;
	}

	//암호화 적용 후 로그인
	@Override
	public MemberDto get(String id) {
		return sqlSession.selectOne("member.get", id);
	}

}
