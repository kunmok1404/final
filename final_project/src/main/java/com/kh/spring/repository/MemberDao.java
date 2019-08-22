package com.kh.spring.repository;

import com.kh.spring.entity.MemberDto;

public interface MemberDao {

	boolean regist(MemberDto memberDto);
	MemberDto id_check(String id);
	MemberDto login(MemberDto memberDto);
	MemberDto get(String id);
	MemberDto getInfo(int member_code);
	
}
