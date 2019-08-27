package com.kh.spring.service;

import java.util.List;

import com.kh.spring.entity.PointDetailDto;

public interface PointService {

	List<PointDetailDto> list(int member_code);

}
