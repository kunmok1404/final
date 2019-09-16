package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.ShopOnoDto;

@Repository
public class ShopOnoDaoImpl implements ShopOnoDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ShopOnoDto> superlist_ceo(String apply_status, String keyword_type, String keyword,String start_date, String end_date, int i, int j,
			String type) {
		Map<String, Object> param = new HashMap<>();
		
		param.put("apply_status", apply_status);
		param.put("keyword_type", keyword_type);
		param.put("keyword", keyword);
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		
		
		param.put("type",type);
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("shopono.super_shopono_list_ceo", param);
	
	}

	@Override
	public List<ShopOnoDto> superlist2_ceo(String apply_status, String keyword_type, String keyword, String start_date, String end_date,String reply_status,
			int i, int j, String type) {
		Map<String, Object> param = new HashMap<>();
		
		param.put("apply_status", apply_status);
		param.put("keyword_type", keyword_type);
		param.put("keyword", keyword);
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		
		param.put("type",type);
		
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", i);
		param.put("end", j);
		
		return sqlSession.selectList("shopono.super_shopono_list2_ceo", param);
	}

	@Override
	public int getOnoSeq() {
		return sqlSession.selectOne("shopono.ono_seq");
	}


	
}
