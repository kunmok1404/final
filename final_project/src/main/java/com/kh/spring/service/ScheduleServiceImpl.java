package com.kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.CouponDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.UsergradeDto;
import com.kh.spring.repository.MemberDao;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	MemberDao memberDao;
	
	
	@Override
	@Scheduled(cron = "0 0 0 1 * *")
	public void work1() {
		
		List<MemberDto> list = sqlsession.selectList("member.member_code");
		List<UsergradeDto> grade = memberDao.grade();
		String soso = grade.get(0).getName();
		String good = grade.get(1).getName();
		String vip = grade.get(2).getName();
		int grade1 = grade.get(1).getMin_order();
		int grade2 = grade.get(2).getMin_order();
		for (int i = 0; i < list.size(); i++) {
			int member_code = list.get(i).getNo();
			
			Map<String, Object> map = new HashMap<>();
			map.put("member_code", member_code);
			
		int orders = sqlsession.selectOne("order.month_list", map);
			
		Map<String, Object> map2 = new HashMap<>();
			if (orders >= grade2) {
				map2.put("grade",vip);		
			}else if (orders >= grade1) {
				map2.put("grade",good);	
			}else {
				map2.put("grade",soso);
			}
			map2.put("no",member_code);
			sqlsession.update("member.update",map2);
	
		}
	}



	@Override
	@Scheduled(cron = "0 0 1 * * *")
	public void work2() {
	List<CouponDto> list = sqlsession.selectList("coupon.list");
		
	for(CouponDto couponDto : list) {
		Map<String, Object> map = new HashMap<>();
		map.put("finish_date", couponDto.getFinish_date());
		int day = sqlsession.selectOne("coupon.issue",map);
		
			if (day < 0) {
				Map<String, Object> map2 = new HashMap<>();
				map.put("no", couponDto.getNo());
				sqlsession.update("coupon.finish", map2);
			}
		}
	}



	@Override
	public void work3() {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void work4() {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void work5() {
		// TODO Auto-generated method stub
		
	}
}
