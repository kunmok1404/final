package com.kh.spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CartDto;
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

}
