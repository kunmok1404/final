package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.OnoDto;

@Repository
public class ShopOnoDaoImpl implements ShopOnoDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OnoDto> superlist_ceo(String apply_status, String keyword_type, String keyword, int i, int j,
			String type) {
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
		
		return sqlSession.selectList("shopono.super_shopono_list_ceo", param);
	
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
		
		return sqlSession.selectList("shopono.super_shopono_list2_ceo", param);
	}


	
}
