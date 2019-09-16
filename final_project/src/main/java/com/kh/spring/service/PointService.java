package com.kh.spring.service;

import java.util.List;

import com.kh.spring.entity.PointDetailDto;
import com.kh.spring.vo.MemberPointVO;

public interface PointService {

	List<PointDetailDto> list(int member_code);
	List<MemberPointVO> getPointList();
	MemberPointVO getPointInfo(int member_code);
	int getMyPoint(int member_code);

}
