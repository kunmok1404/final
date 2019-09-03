package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MyshopDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.UsergradeDto;

public interface MemberDao {

	boolean regist(MemberDto memberDto);
	
	MemberDto id_check(String id);
	
	MemberDto login(MemberDto memberDto);
	
	MemberDto get(String id);
	
	boolean findId(MemberDto memberDto);
	
	boolean findPw(MemberDto memberDto);
	
	void changePw(MemberDto memberDto);
	
	
	
	
	MemberDto getInfo(int member_code);
	
	void like(MyshopDto myshop);
	
	void unlike(MyshopDto myshop);

	List<UsergradeDto> grade();

	void usergrade_edit1(String name1, String min_order1);

	void usergrade_edit2(String name2, String min_order2, String max_order2);

	void usergrade_edit3(String name3, String max_order3);

	List<MyshopDto> myshop(int member_code);

	


}
