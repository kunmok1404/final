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

	// �쉶�썝媛��엯 湲곕뒫
	@Override
	public boolean regist(MemberDto memberDto) {
		try {
			sqlSession.insert("member.regist", memberDto);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// �븘�씠�뵒 以묐났 �솗�씤
	@Override
	public MemberDto id_check(String id) {
		return sqlSession.selectOne("member.id_check", id);
	}

	// �븫�샇�솕 �쟻�슜 �쟾 濡쒓렇�씤
	@Override
	public MemberDto login(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.login", memberDto);
		return result;
	}

	// �븫�샇�솕 �쟻�슜 �썑 濡쒓렇�씤
	@Override
	public MemberDto get(String id) {
		return sqlSession.selectOne("member.get", id);
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