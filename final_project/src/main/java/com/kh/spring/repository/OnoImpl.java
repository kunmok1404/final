package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.OnoDto;
import com.kh.spring.entity.OnoImgDto;


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
//		System.out.println(onoDto);
		sqlSession.insert("service.ono_write", onoDto);
	}


	@Override
	public OnoDto get(int no) {
		return sqlSession.selectOne("service.ono_get", no);
	}


	@Override
	public void edit(OnoDto onoDto) {
		sqlSession.update("service.ono_edit",onoDto);
	}


	@Override
	public int getOnoSeq() {
		return sqlSession.selectOne("service.ono_seq");
	}

	//파일테이블에 이미지정보 등록
	@Override
	public void fileRegist(FilesDto filesDto) {
		sqlSession.insert("service.files_regist", filesDto);
	}


	@Override
	public int getFilesSeq() {
		return sqlSession.selectOne("service.files_seq");
	}


	@Override
	public void writeOnoImg(int ono_no, int files_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("ono_img", ono_no);
		map.put("files_no", files_no);
		sqlSession.insert("service.ono_img",map);
	}

	//ono정보 조회
	@Override
	public OnoDto onoInfo(int ono_code) {
		return sqlSession.selectOne("service.ono_info", ono_code);
	}


	@Override
	public List<OnoImgDto> onoImg(int ono_code) {
		return sqlSession.selectList("service.ono_img_code", ono_code);
	}

	//파일정보 조회
	@Override
	public FilesDto getFileInfo(int files_code) {
		System.out.println(files_code);
		return sqlSession.selectOne("service.filesDto", files_code);
	}

//조회수 증가
//	@Override
//	public void read(int ono_code) {
//		sqlSession.update("service.read", ono_code);
//	}



//	@Override
//	public void read(int no) {
//		sqlSession.update("service.notice_read", no);
//		
//	}
	
}
