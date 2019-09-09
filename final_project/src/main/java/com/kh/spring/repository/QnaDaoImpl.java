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
		sqlSession.delete("service.qnd_delete", no);
	}

	@Override
	public void write(QnaDto qnaDto) {
		sqlSession.insert("service.qna_write", qnaDto);
		
	}

//	@Override
//	public List<QnaDto> list(String category, int start, int end) {
//		return sqlSession.selectList("qna.list",category);
//	}

	@Override
	public int count(String category) {
		return sqlSession.selectOne("service.qna_count",category);
	}

	@Override
	public List<QnaDto> list(String category, int i, int j, String use_yn) {
		Map<String, Object> param = new HashMap<>();
		if(category !=null) {
			param.put("category", category);
		}
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.qna_list", param);
	}

	@Override
	public int supercount() {
		return sqlSession.selectOne("superservice.super_qna_count");
	}

	@Override
	public List<QnaDao> superlist(int i, int j) {
		Map<String, Object> param = new HashMap<>();
		param.put("start", i);
		param.put("end", j);
		return sqlSession.selectList("superservice.super_qna_list", param);
	}

	@Override
	public int count_reply_ceo() {
		return sqlSession.selectOne("service.count_reply_ceo");
	}

	@Override
	public int count_reply() {
		return sqlSession.selectOne("service.count_reply");
	}

	@Override
	public QnaDto qnaInfo(int no) {
		return sqlSession.selectOne("superservice.qna_info", no);
	}

	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("superservice.qna_seq");
	}

	@Override
	public void insert(QnaDto qnaDto) {
		sqlSession.insert("superservice.qna_insert", qnaDto);
	}


	@Override
	public void edit(QnaDto qnaDto) {
		sqlSession.update("superservice.qna_edit", qnaDto);
		
	}

	@Override
	public void qnadelete(int no) {
		sqlSession.delete("superservice.qna_delete", no);
		
	}

	
}
