package com.kh.spring.repository;

import com.kh.spring.entity.MemberDto;

public interface MemberDao {

	boolean regist(MemberDto memberDto);

	MemberDto get(String id);
	
}
