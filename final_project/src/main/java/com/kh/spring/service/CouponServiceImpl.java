package com.kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.CouponDto;
import com.kh.spring.entity.IssueDto;
import com.kh.spring.repository.CouponDao;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDao couponDao;
	
	// 나의쿠폰 목록조회
	@Override
	public List<CouponDto> list(int member_code) {
		
		// 나의 쿠폰번호 조회
		List<IssueDto> list = couponDao.getCouponCode(member_code);
		List<CouponDto> coupon_list = new ArrayList<>();
		
		// 쿠폰번호로 쿠폰목록 조회
		for(IssueDto issueDto : list) {
			CouponDto couponDto = couponDao.getCouponInfo(issueDto.getCoupon_code());
			
			// 시작시간 자르기
			String start_time = couponDto.getStart_date().substring(0, 16);
			couponDto.setStart_date(start_time);
			// 종료시간 자르기
			String finish_time = couponDto.getFinish_date().substring(0, 16);
			couponDto.setFinish_date(finish_time);
			coupon_list.add(couponDto);
		}
		return coupon_list;
	}

}
