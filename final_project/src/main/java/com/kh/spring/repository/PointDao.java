package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.PointDetailDto;

public interface PointDao {

	List<PointDetailDto> list(int member_code);

}
