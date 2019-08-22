package com.kh.spring.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CartDto;
<<<<<<< HEAD
import com.kh.spring.entity.Order_Detail;
import com.kh.spring.entity.Orders;
=======
import com.kh.spring.entity.CartListVO;
import com.kh.spring.entity.MemberDto;
>>>>>>> refs/remotes/origin/master
import com.kh.spring.entity.ShopDto;
//주문 관련 Dao
@Repository
public interface OrdersDao {
	List<CartDto> cartlist(int member_code);
	ShopDto shopInfo(int shop_code);
	List<Orders> myOrderList(int member_code);
	String menuName(int no);
	int menuCount(int no);
	List<Order_Detail> myOrderDetailList(int member_code, int order_code);
	void cartinput(CartListVO vo);
	MemberDto memberSearch(int member_code);
}
