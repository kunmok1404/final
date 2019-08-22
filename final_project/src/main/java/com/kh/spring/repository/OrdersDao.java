package com.kh.spring.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CartDto;
import com.kh.spring.entity.CartListVO;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.OrderDetailDto;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ShopDto;
//주문 관련 Dao
@Repository
public interface OrdersDao {
	List<CartDto> cartlist(int member_code);
	ShopDto shopInfo(int shop_code);
	List<OrdersDto> myOrderList(int member_code);
	String menuName(int no);
	int menuCount(int no);
	List<OrderDetailDto> myOrderDetailList(int order_code);
	void cartinput(CartListVO vo);
	MemberDto memberSearch(int member_code);
	OrdersDto orderInfo(int order_code);
	List<OrderDetailDto> orderDistinct(int order_code);
}
