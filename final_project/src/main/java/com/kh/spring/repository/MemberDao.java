package com.kh.spring.repository;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MyshopDto;

public interface MemberDao {

	boolean regist(MemberDto memberDto);
	
	MemberDto id_check(String id);
	
	MemberDto login(MemberDto memberDto);
	
	MemberDto get(String id);
	
	boolean findId(MemberDto memberDto);
	
	boolean findPw(MemberDto memberDto);
	
	void changePw(MemberDto memberDto);
	
	void change(MemberDto memberDto);

	MemberDto take(int member_code);

	void delete(int member_code);
	
	
	
	MemberDto getInfo(int member_code);
	
	void like(MyshopDto myshop);
	
	void unlike(MyshopDto myshop);








}
