package com.kh.spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.PointDetailDto;

@Repository
public class PointDaoImpl implements PointDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 포인트 사용 내역
	@Override
	public List<PointDetailDto> list(int member_code) {
		return sqlSession.selectList("point.list",member_code);
	}

	// 총 적립 포인트 조회
	@Override
	public int getTotalPoint(int member_code) {
		return sqlSession.selectOne("point.total_point", member_code);
	}

	// 총 사용 포인트 조회
	@Override
	public int getUsePoint(int member_code) {
		return sqlSession.selectOne("point.use_point", member_code);
	}

	// 총 사용 포인트 적립
	@Override
	public void sendPoint(PointDetailDto pointDto) {
		sqlSession.insert("point.sendPoint",pointDto);
	}

}
