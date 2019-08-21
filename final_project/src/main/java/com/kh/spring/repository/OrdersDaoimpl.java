package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CartDto;
import com.kh.spring.entity.Order_Detail;
import com.kh.spring.entity.Orders;
import com.kh.spring.entity.ShopDto;
//주문 관련 Dao impl
@Repository
public class OrdersDaoimpl implements OrdersDao{
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<CartDto> cartlist(int member_code) {
		return sqlsession.selectList("order.cartlist",member_code);
	}

	@Override
	public ShopDto shopInfo(int shop_code) {
		return sqlsession.selectOne("order.cartshop",shop_code);
	}

	// 나의정보 주문내역
	@Override
	public List<Orders> myOrderList(int member_code) {
		return sqlsession.selectList("order.my_order_list", member_code);
	}

	// 메뉴명조회
	@Override
	public String menuName(int no) {
		return sqlsession.selectOne("order.menu_name", no);
	}

	// 메뉴갯수 조회
	@Override
	public int menuCount(int no) {
		return sqlsession.selectOne("order.menu_count", no);
	}

	 // 나의정보 주문상세
	@Override
	public List<Order_Detail> myOrderDetailList(int member_code, int order_code) {
		Map<String, Integer> map = new HashMap<>();
		map.put("member_code", member_code);
		map.put("order_code", order_code);
		return sqlsession.selectList("order.my_order_detail",map);
	}

}
