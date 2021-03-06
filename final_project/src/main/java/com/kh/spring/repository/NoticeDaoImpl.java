package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;
	

//	@Override
//	public List<QnaDto> list(String category, int start, int end) {
//		return sqlSession.selectList("qna.list",category);
//	}

	@Override
	public int count(String keyword) {
		return sqlSession.selectOne("service.notice_count",keyword);
	}

	@Override
	public List<NoticeDto> list(String keyword, String status,  int i, int j) {
		Map<String, Object> param = new HashMap<>();
		if(keyword !=null) {
			param.put("keyword", keyword);
		}
		
		param.put("status", status);
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.notice_list", param);
	}
	
	@Override
	public List<NoticeDto> list2() {
		return sqlSession.selectList("service.notice_list2");
	}

	@Override
	public List<NoticeDto> list3(String keyword, String status,  int i, int j) {
		Map<String, Object> param = new HashMap<>();
		if(keyword !=null) {
			param.put("keyword", keyword);
		}
		
		param.put("status", status);
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("service.notice_list3", param);
	}
	
	@Override
	public List<NoticeDto> list4() {
		return sqlSession.selectList("service.notice_list4");
	}

	@Override
	public NoticeDto get(int no) {
		return sqlSession.selectOne("service.notice_get", no);
	}


	@Override
	public void read(int no) {
		sqlSession.update("service.notice_read", no);
		
	}



	@Override
	public void write(NoticeDto noticeDto) {
		sqlSession.insert("superservice.notice_write", noticeDto);
		
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("superservice.notice_delete", no);
		
	}

	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("superservice.notice_seq");
	}

	@Override
	public void insert(NoticeDto noticeDto) {
		sqlSession.insert("superservice.notice_insert", noticeDto);
	}

	@Override
	public void edit(NoticeDto noticeDto) {
		sqlSession.update("superservice.notice_edit", noticeDto);
	}

	// shop_home 공지사항목록
	@Override
	public List<NoticeDto> shopHomeNotice() {
		return sqlSession.selectList("service.notice_shop_home");
	}

	// super_home 공지사항목록
	@Override
	public List<NoticeDto> superHomeNotice() {
		return sqlSession.selectList("service.notice_super_home");
	}







	
}
