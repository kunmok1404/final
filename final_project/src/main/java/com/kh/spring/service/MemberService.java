package com.kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.spring.vo.MemberInfoVO;

@Service
public interface MemberService {

	List<MemberInfoVO> search(String status, String grade, String start_date, String end_date, String type,
			String keyword, int start, int end);

	MemberInfoVO detail(int no);

}
