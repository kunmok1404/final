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
	
	// 파일 테이블에 등록
	@Override
	public void fileRegist(FilesDto filesDto) {
		sqlSession.insert("review.files_regist",filesDto);
	}
	
	// 파일정보 업데이트
	@Override
	public void updateFileInfo(FilesDto filesDto) {
		sqlSession.update("files.updateFilesInfo",filesDto);
	}

	// 파일삭제
	@Override
	public void deleteFile(int file_code) {
		sqlSession.delete("files.delete", file_code);	
	}

}
