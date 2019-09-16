package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.CouponDto;
import com.kh.spring.entity.IssueDto;

public interface CouponDao {

	void regist(CouponDto couponDto);
	List<IssueDto> getCouponCode(int member_code);
	CouponDto getCouponInfo(int coupon_code);
	List<CouponDto> getCoupon();
	void finish(int no);
	void all(int member_code,int coupon_code);
	int getCouponCount(int member_code);

}
