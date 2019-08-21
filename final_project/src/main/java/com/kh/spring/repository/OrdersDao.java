package com.kh.spring.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CartDto;
import com.kh.spring.entity.CartListVO;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.ShopDto;
//주문 관련 Dao
@Repository
public interface OrdersDao {
	List<CartDto> cartlist(int member_code);
	ShopDto shopInfo(int shop_code);
	void cartinput(CartListVO vo);
	MemberDto memberSearch(int member_code);
}
