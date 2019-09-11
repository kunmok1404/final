
package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MyshopDto;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.UsergradeDto;
import com.kh.spring.vo.MemberInfoVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원가입
	@Override
	public boolean regist(MemberDto memberDto) {
		try {
			sqlSession.insert("member.regist", memberDto);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// 아이디 중복확인
	@Override
	public MemberDto id_check(String id) {
		return sqlSession.selectOne("member.id_check", id);
	}

	// 암호화 적용 전 로그인
	@Override
	public MemberDto login(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.login", memberDto);
		return result;
	}

	// 암호화 적용 후 로그인
	@Override
	public MemberDto get(String id) {
		return sqlSession.selectOne("member.get", id);
	}

	//아이디 찾기
	@Override
	public boolean findId(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.findId", memberDto);
		return result != null;
	}
	
	//비밀번호 찾기
	@Override
	public boolean findPw(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.findPw", memberDto);
		return result != null;
	}

	//비밀번호 변경 처리
	@Override
	public void changePw(MemberDto memberDto) {
		sqlSession.update("member.changePw", memberDto);
		
	}
	
	//회원 정보 수정할때 입력되어있는 정보를 가져오기
	@Override
	public MemberDto take(int member_code) {
		return sqlSession.selectOne("member.take", member_code);
	}
		
	//회원정보 수정
	@Override
	public void change(MemberDto memberDto) {
		System.out.println(memberDto);
		sqlSession.update("member.change", memberDto);
		
	}
	
	//회원 탈퇴
	@Override
	public void member_delete(int member_code) {
		sqlSession.delete("member.delete", member_code);
		
	}	
	
	// 회원정보 조회
	@Override
	public MemberDto getInfo(int member_code) {
		return sqlSession.selectOne("member.get_info",member_code);
	}

	//관리자 회원 검색
	@Override
	public List<MemberInfoVO> search(String status, String grade, String start_date, String end_date, String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		param.put("status", status);
		param.put("grade", grade);
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		param.put("type", type);
		param.put("keyword", keyword);
		System.out.println(param);
		return sqlSession.selectList("member.search", param);
	}
	
	//관리자 회원 정보 상세 보기
	@Override
	public List<MemberInfoVO> info(int no) {
		return sqlSession.selectList("member.info", no);
	}
	
	//관리자 회원 탈퇴 기능
	@Override
	public void delete(int no) {
		sqlSession.delete("member.delete", no);
	}
	
	//관리자 회원 정보 수정
	@Override
	public void edit(MemberInfoVO memberInfoVO) {
		sqlSession.update("memer.edit", memberInfoVO);		
	}
	
	//총 사용금액 구하기
	@Override
	public int total_price(int no) {
		Integer result = sqlSession.selectOne("member.total_price", no);
		return result == null ? 0 : result;
	}
	
	@Override
	public void like(MyshopDto myshop) {
		sqlSession.insert("member.like", myshop);
	}

	@Override
	public void unlike(MyshopDto myshop) {
		sqlSession.delete("member.unlike", myshop);
	}
	@Override
	public List<UsergradeDto> grade() {
		return sqlSession.selectList("member.usergrade");
	}

	@Override
	public void usergrade_edit1(String name1, String min_order1) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name1);
		map.put("min_order", min_order1);
		map.put("grade", 1);
	sqlSession.update("member.usergrade_edit1", map);
	}

	@Override
	public void usergrade_edit2(String name2, String min_order2, String max_order2) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name2);
		map.put("min_order", min_order2);
		map.put("max_order", max_order2);
		map.put("grade", 2);
		sqlSession.update("member.usergrade_edit2", map);
	}

	@Override
	public void usergrade_edit3(String name3, String max_order3) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name3);
		map.put("max_order", max_order3);
		map.put("grade", 3);
		sqlSession.update("member.usergrade_edit3", map);
	}

	@Override
	public List<MyshopDto> myshop(int member_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_code", member_code);
		return sqlSession.selectList("member.myshop",map);
	}

	@Override
	public List<MemberDto> member_code() {
		return sqlSession.selectList("member.member_code");
	}

	// super_admin 전체회원목록 조회
	@Override
	public List<MemberDto> getMemberList() {
		return sqlSession.selectList("member.get_member_list");
	}

	

	////
//	@Override
//	public MemberDto findPassword(MemberDto memberDto) {
//		return sqlSession.selectOne("member.find_pw", memberDto);
//	}

}

