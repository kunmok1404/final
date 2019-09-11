package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MyshopDto;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.UsergradeDto;
import com.kh.spring.vo.MemberInfoVO;

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
	void member_delete(int member_code);
	List<MemberInfoVO> search(String status, String grade, String start_date, String end_date, String type, String keyword);
	void edit(MemberInfoVO memberInfoVO);
	MemberDto getInfo(int member_code);
	void like(MyshopDto myshop);
	void unlike(MyshopDto myshop);
	List<UsergradeDto> grade();
	void usergrade_edit1(String name1, String min_order1);
	void usergrade_edit2(String name2, String min_order2, String max_order2);
	void usergrade_edit3(String name3, String max_order3);
	List<MyshopDto> myshop(int member_code);
	List<MemberDto> member_code();
	List<MemberDto> getMemberList();
	List<MemberInfoVO> info(int no);
	int total_price(int no);
	//
//	MemberDto findPassword(MemberDto memberDto);

}
