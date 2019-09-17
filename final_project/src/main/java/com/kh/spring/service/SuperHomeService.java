package com.kh.spring.service;

import java.util.List;

import com.kh.spring.entity.TotalVo;

public interface SuperHomeService {
	int today(String no,String yesterdaydate,String end);
	int month(String no,String start,String end);
	int week(String no,String week_agodate,String end);
	int apply_all();
	int apply_dagi();
	int apply_sus();
	int date_today(String no,String yesterdaydate,String end);
	int date_month(String no,String start,String end);
	int date_week(String no,String week_agodate,String end);
	
	int shopMenuCount_all(int shop_code);
	int shopMenuCount_dagi(int shop_code);
	int shopMenuCount_sus(int shop_code);
	
}
