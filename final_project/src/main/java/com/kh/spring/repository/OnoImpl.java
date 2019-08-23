package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.OnoDto;


@Repository
public class OnoImpl implements OnoDao{

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<OnoDto> list(int i, int j) {
		Map<String, Object> param = new HashMap<>();
		
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.ono_list", param);
	}


	@Override
	public int count() {
		return sqlSession.selectOne("service.ono_count");
	}


	@Override
	public void write(OnoDto onoDto) {
		System.out.println(onoDto);
		sqlSession.insert("service.ono_write", onoDto);
	}


	@Override
	public OnoDto get(int no) {
		return sqlSession.selectOne("service.ono_get", no);
	}


	@Override
	public int getSeq() {
		return sqlSession.selectOne("service.getno");
	}



	@Override
	public void image(FilesDto filesDto) {
		sqlSession.insert("service.ono_regist",filesDto);
	}


	@Override
	public void edit(OnoDto onoDto) {
		sqlSession.update("service.ono_edit",onoDto);
	}


	@Override
	public FilesDto getfile(int no) {
		return sqlSession.selectOne("service.ono_getfile", no);
	}



//	@Override
//	public void read(int no) {
//		sqlSession.update("service.notice_read", no);
//		
//	}



	
}
