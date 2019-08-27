package com.kh.spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MyshopDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원가입
	@Override
	public boolean regist(MemberDto memberDto) {
		try {
			sqlSession.insert("member.regist", memberDto);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// 아이디 중복확인
	@Override
	public MemberDto id_check(String id) {
		return sqlSession.selectOne("member.id_check", id);
	}

	// 암호화 적용 전 로그인
	@Override
	public MemberDto login(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.login", memberDto);
		return result;
	}

	// 암호화 적용 후 로그인
	@Override
	public MemberDto get(String id) {
		return sqlSession.selectOne("member.get", id);
	}

	//아이디 찾기
	@Override
	public boolean findId(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.findId", memberDto);
		return result != null;
	}
	
	//비밀번호 찾기
	@Override
	public boolean findPw(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.findPw", memberDto);
		return result != null;
	}
	
	// 회원정보 조회
	@Override
	public MemberDto getInfo(int member_code) {
		return sqlSession.selectOne("member.get_info",member_code);
	}

	@Override
	public void like(MyshopDto myshop) {
		sqlSession.insert("member.like", myshop);
	}

	@Override
	public void unlike(MyshopDto myshop) {
		sqlSession.delete("member.unlike", myshop);
	}
}

