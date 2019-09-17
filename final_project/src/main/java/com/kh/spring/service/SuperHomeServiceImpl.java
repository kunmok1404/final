package com.kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.TotalVo;
import com.kh.spring.repository.MenuDao;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.vo.OrderVo;

@Service
public class SuperHomeServiceImpl implements SuperHomeService{
	
	@Autowired
	OrdersDao orderDao;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	SqlSession sqlsession;
	
	
	@Override
	public int today(String no, String yesterdaydate, String end) {
		String start = yesterdaydate;
		List<TotalVo> day =orderDao.sale_day(no,start,end);
		int tot_day=0;
		for (int i = 0; i < day.size(); i++) {
			tot_day += day.get(i).getTot();
		}
		return tot_day;
	}

	@Override
	public int month(String no, String start, String end) {
		List<TotalVo> day =orderDao.sale_day(no,start,end);
		int tot_day=0;
		for (int i = 0; i < day.size(); i++) {
			tot_day += day.get(i).getTot();
		}
		return tot_day;
	}

	@Override
	public int week(String no, String week_agodate, String end) {
		String start = week_agodate;
		List<TotalVo> day =orderDao.sale_day(no,start,end);
		int tot_day=0;
		for (int i = 0; i < day.size(); i++) {
			tot_day += day.get(i).getTot();
		}
		return tot_day;
	}

	@Override
	public int apply_all() {
		String searchOption="apply_status";
		String keyword="승인";
		return adminService.countArticle(searchOption, keyword);
	}

	@Override
	public int apply_dagi() {
		String searchOption="apply_status";
		String keyword="승인대기";
		return adminService.countArticle(searchOption, keyword);
	}
	
	@Override
	public int apply_sus() {
		String searchOption="apply_status";
		String keyword="승인완료";
		return adminService.countArticle(searchOption, keyword);
	}

	@Override
	public int date_today(String no, String yesterdaydate, String end) {
		String start = yesterdaydate;
		List<OrderVo> list =orderDao.date_day(no,start,end);
		int tot_day=0;
	for (int i = 0; i < list.size(); i++) {
		tot_day += list.get(i).getCut();
		}
		return tot_day;
	}

	@Override
	public int date_month(String no, String start, String end) {
		List<OrderVo> list =orderDao.date_day(no,start,end); 
		int tot_day=0;
		for (int i = 0; i < list.size(); i++) {
			tot_day += list.get(i).getCut();
		}

		return tot_day;
	}

	@Override
	public int date_week(String no, String week_agodate, String end) {
		String start = week_agodate;
		List<OrderVo> list =orderDao.date_day(no,start,end);
		int tot_day=0;
	for (int i = 0; i < list.size(); i++) {
		tot_day += list.get(i).getCut();
		}
		return tot_day;
	}

	@Override
	public int shopMenuCount_all(int shop_code) {
		Map<Object, Object> map = new HashMap<>();
		map.put("shop_code", shop_code);
		
		int count = sqlsession.selectOne("menu.apply_all", map);
		return count;
	}

	@Override
	public int shopMenuCount_dagi(int shop_code) {
		Map<Object, Object> map = new HashMap<>();
		String apply_status = "승인대기";
		map.put("shop_code", shop_code);
		map.put("apply_status", apply_status);		
		
		int count = sqlsession.selectOne("menu.apply_count", map);
		return count;
	}

	@Override
	public int shopMenuCount_sus(int shop_code) {
		String apply_status = "승인완료";
		Map<Object, Object> map = new HashMap<>();
		map.put("shop_code", shop_code);
		map.put("apply_status", apply_status);
		
		int count = sqlsession.selectOne("menu.apply_count", map);
		return count;
	}


}
