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
	public List<QnaDto> list(String category, int i, int j) {
		Map<String, Object> param = new HashMap<>();
		if(category !=null) {
			param.put("category", category);
		}
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.qna_list", param);
	}

	
}
