package com.kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.PointDetailDto;
import com.kh.spring.repository.PointDao;

@Service
public class PointServiceImpl implements PointService {

	@Autowired
	private PointDao pointDao;
	
	// 포인트 목록 조회
	@Override
	public List<PointDetailDto> list(int member_code) {
		List<PointDetailDto> list = pointDao.list(member_code);
		List<PointDetailDto> point_list = new ArrayList<>();
		for(PointDetailDto pointDto : list) {
			// 시간 자르기
			String time = pointDto.getWhen().substring(0, 16);
			pointDto.setWhen(time);
			point_list.add(pointDto);
		}
		return point_list;
	}

}
