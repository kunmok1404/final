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
	public List<OnoDto> list(int i, int j, int member_code) {
		Map<String, Object> param = new HashMap<>();
		
		param.put("member_code", member_code);
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		System.out.println(param);
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


	@Override
	public int supercount(String apply_status, String keyword_type, String keyword,String start_date, String end_date) {
		Map<String, String> param = new HashMap<>();
		param.put("apply_status", apply_status);
		param.put("keyword_type", keyword_type);
		param.put("keyword", keyword);
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		return sqlSession.selectOne("service.super_ono_count", param);
	}


	@Override
	public List<OnoDto> superlist(String apply_status, String keyword_type, String keyword,String start_date, String end_date, int i, int j, String type) {
		Map<String, Object> param = new HashMap<>();
		
			param.put("apply_status", apply_status);
			param.put("keyword_type", keyword_type);
			param.put("keyword", keyword);
			param.put("start_date", start_date);
			param.put("end_date", end_date);
			
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.super_ono_list", param);
	}
	
	@Override
	public List<OnoDto> superlist2(String apply_status, String keyword_type, String keyword, String start_date, String end_date,String reply_status, int i, int j, String type) {
		Map<String, Object> param = new HashMap<>();
		
		param.put("apply_status", apply_status);
		param.put("keyword_type", keyword_type);
		param.put("keyword", keyword);
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		
		
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.super_ono_list2", param);
		
	}

	@Override
	public void superedit(OnoDto onoDto) {
		sqlSession.update("service.super_ono_edit",onoDto);
		
	}

	@Override
	public void updateReplyStatus(OnoDto onoDto) {
		sqlSession.update("service.super_reply_status", onoDto);
		
	}

	@Override
	public int count_reply() {
		return sqlSession.selectOne("service.count_reply");
	}


	@Override
	public int supercount_ceo(String apply_status, String keyword_type, String keyword) {
		Map<String, String> param = new HashMap<>();
		if(apply_status != null) {
			param.put("apply_status", apply_status);
		}
		if(keyword_type !=null && keyword !=null) {
			param.put("keyword_type", keyword_type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		return sqlSession.selectOne("service.super_ono_count_ceo", param);
	}


	@Override
	public List<OnoDto> superlist_ceo(String apply_status, String keyword_type, String keyword, int i, int j, String type) {
		Map<String, Object> param = new HashMap<>();
		
		if(apply_status != null) {
			param.put("apply_status", apply_status);
		}
		
		if(keyword_type !=null && keyword !=null) {
			param.put("keyword_type", keyword_type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		param.put("type",type);
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.super_ono_list_ceo", param);
	}


	@Override
	public List<OnoDto> superlist2_ceo(String apply_status, String keyword_type, String keyword, String reply_status,
			int i, int j, String type) {
		Map<String, Object> param = new HashMap<>();
		
		if(apply_status != null) {
			param.put("apply_status", apply_status);
		}
		
		if(keyword_type !=null && keyword !=null) {
			param.put("keyword_type", keyword_type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.super_ono_list2_ceo", param);
	}


	@Override
	public int count_reply_ceo() {
		return sqlSession.selectOne("service.count_reply_ceo");
	}


	@Override
	public int client_count() {
		return sqlSession.selectOne("service.client_count");
	}


	@Override
	public int ceo_count() {
		return sqlSession.selectOne("service.ceo_count");
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
