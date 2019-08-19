package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao{

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void delete(int no) {
		sqlSession.delete("qnd.delete", no);
	}

	@Override
	public void write(QnaDto qnaDto) {
		sqlSession.insert("qna.write", qnaDto);
		
	}

	@Override
	public List<QnaDto> list(String category) {
		return sqlSession.selectList("qna.list",category);
	}

	@Override
	public int count(String category) {
		return sqlSession.selectOne("qna.count",category);
	}

	
}
