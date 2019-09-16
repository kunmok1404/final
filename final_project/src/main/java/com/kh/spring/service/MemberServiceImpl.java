package com.kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.vo.MemberInfoVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private OrdersDao ordersDao;
	
	//super_admin 회원 관리 목록 - 총 사용 금액 불러오기
	@Override
	public List<MemberInfoVO> search(String status, String grade, String start_date, String end_date, String type,
			String keyword) {
		List<MemberInfoVO> list = memberDao.search(status, grade, start_date, end_date, type, keyword); //받아온거
		List<MemberInfoVO> info_list = new ArrayList<>(); //새로 만든 그릇
		//내용 다시 세팅
		for(MemberInfoVO memberInfoVO : list) {
			//총 사용 금액
			int total_price = memberDao.total_price(memberInfoVO.getNo());
			System.out.println(memberInfoVO.getNo());
			System.out.println(total_price);
			//다시 담기
			memberInfoVO.setTotal_price(total_price);
			
			info_list.add(memberInfoVO);
			
		}
		return info_list;
	}

	//super_admin 회원 관리 상세보기 - 총 사용 금액 불러오기
	@Override
	public MemberInfoVO detail(int no) {
		//사람Dao
		MemberInfoVO memberInfoVO = memberDao.detail(no);
		//total DAO
		int total_price = memberDao.total_price(no);
		
		//dto.settotal
		memberInfoVO.setTotal_price(total_price);
		
		return memberInfoVO;
	}

	
	
}
