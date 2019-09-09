package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CouponDto;
import com.kh.spring.entity.IssueDto;

@Repository
public class CouponDaoImpl implements CouponDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 쿠폰 등록
	@Override
	public void regist(CouponDto couponDto) {
		sqlSession.insert("coupon.regist", couponDto);
	}

	// 나의 쿠폰번호 구하기
	@Override
	public List<IssueDto> getCouponCode(int member_code) {
		return sqlSession.selectList("coupon.get_coupon_code", member_code);
	}

	// 쿠폰번호로 쿠폰정보 구하기
	@Override
	public CouponDto getCouponInfo(int coupon_code) {
		return sqlSession.selectOne("coupon.get_coupon_info", coupon_code);
	}
	
	//쿠폰정보 불러오기
	@Override
	public List<CouponDto> getCoupon() {
		return sqlSession.selectList("coupon.list");
	}

	@Override
	public void finish(int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		sqlSession.update("coupon.finish", map);
		
	}

	@Override
	public void all(int member_code, int coupon_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("coupon_code", coupon_code);
		map.put("member_code", member_code);
		sqlSession.insert("coupon.all", map);
		
	}
	
	

}
