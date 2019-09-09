package com.kh.spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.vo.FoodCategoryVO;

@Repository
public class FilesDaoImpl implements FilesDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 파일정보 조회
	@Override
	public FilesDto getFilesInfo(int image_code) {
		return sqlSession.selectOne("files.get_fileInfo",image_code);
	}

	// 파일시퀀스 구하기
	@Override
	public int getFileSeq() {
		return sqlSession.selectOne("files.getFilesSeq");
	}

	// 파일정보 등록
	@Override
	public void insertFilesInfo(FoodCategoryVO foodDto) {
		sqlSession.insert("files.insertFilesInfo",foodDto);
	}

}
