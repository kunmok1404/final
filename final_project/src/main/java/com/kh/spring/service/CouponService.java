package com.kh.spring.service;

import java.util.List;

import com.kh.spring.entity.CouponDto;

public interface CouponService {

	List<CouponDto> list(int member_code);

}
