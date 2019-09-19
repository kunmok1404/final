package com.kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.CommissionDto;
import com.kh.spring.entity.CouponDto;
import com.kh.spring.entity.FoodCategoryDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.TotalVo;
import com.kh.spring.entity.UsergradeDto;
import com.kh.spring.repository.CouponDao;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ShopDao shopDao;
	
	@Autowired
	OrdersDao ordersDao;
	
	@Autowired
	private CouponDao couponDao;
	
	@Override
	@Scheduled(cron = "0 0 0 1 * *")
	public void work1() {
		
		List<MemberDto> list = sqlsession.selectList("member.member_code");
		List<UsergradeDto> grade = memberDao.grade();
		String soso = grade.get(0).getGrade();
		String good = grade.get(1).getGrade();
		String vip = grade.get(2).getGrade();
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
		List<MemberDto> all = sqlsession.selectList("member.member_all");
		List<CouponDto> coupon3 = sqlsession.selectList("coupon.coupon3");
		List<CouponDto> coupon2 = sqlsession.selectList("coupon.coupon2");
		List<CouponDto> coupon1 = sqlsession.selectList("coupon.coupon1");
		for (int i = 0; i < all.size(); i++) {
			if (sqlsession.selectList("coupon.couponlist") != null) {
				String sysdate = sqlsession.selectOne("coupon.sysdate");
				if (all.get(i).getGrade().equals("3")) {
					for (int j = 0; j < coupon3.size(); j++) {	
						Map<String, Object> map = new HashMap<>();
						map.put("period", coupon3.get(i).getPeriod());
						String period = sqlsession.selectOne("coupon.period", map);
						couponDao.auto(all.get(i).getNo(), coupon3.get(j).getNo(),sysdate,period);
				}
				}else if (all.get(i).getGrade().equals("2")) {
					for (int j = 0; j < coupon2.size(); j++) {	
						Map<String, Object> map = new HashMap<>();
						map.put("period", coupon2.get(i).getPeriod());
						String period = sqlsession.selectOne("coupon.period", map);
						couponDao.auto(all.get(i).getNo(), coupon2.get(j).getNo(),sysdate,period);
				}
				}else if (all.get(i).getGrade().equals("1")) {
					for (int j = 0; j < coupon1.size(); j++) {	
						Map<String, Object> map = new HashMap<>();
						map.put("period", coupon1.get(i).getPeriod());
						String period = sqlsession.selectOne("coupon.period", map);
						couponDao.auto(all.get(i).getNo(), coupon1.get(j).getNo(),sysdate,period);
				}
				}		
			}
			
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
	@Scheduled(cron = "0 0 1 * * *")
	public void work3() {
		CommissionDto commissionDto = sqlsession.selectOne("commission.date");
		Map<String, Object> map = new HashMap<>();
		map.put("commission_date", commissionDto.getCommission_date());
		int day = sqlsession.selectOne("commission.day",map);
		if (day==0) {
			List<ShopDto> list = shopDao.shop();
			String start = sqlsession.selectOne("commission.start");
			String end = sqlsession.selectOne("commission.end");
			List<TotalVo> date;
			for (int i = 0; i < list.size(); i++) {
				int total = 0;
				String no = Integer.toString(list.get(i).getNo());	
				date =ordersDao.sale_day(no,start,end); 
				for (int j = 0; j < date.size(); j++) {					
					total+=date.get(j).getTot();
				} 
				String shop_name = list.get(i).getShop_name();
				int cartegory = list.get(i).getCategory();
				FoodCategoryDto FoodCategory = sqlsession.selectOne("category.getFoodCategory", cartegory);
				int commission_rate = commissionDto.getCommission_rate();
				int commission_charge = total/commission_rate;
				int commission_sum = total-commission_charge;
				Map<String, Object> map2 = new HashMap<>();
				map2.put("shop_code", no);
				map2.put("shop_name", shop_name);
				map2.put("cartegory", FoodCategory.getName());
				map2.put("total_sum", total);
				map2.put("commission_rate", commission_rate);
				map2.put("commission_charge", commission_charge);
				map2.put("commission_sum", commission_sum);
				map2.put("start_date", start);
				map2.put("end_date", end);
				sqlsession.insert("commission.regist", map2);
				
			}
		}
		
		
		
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
