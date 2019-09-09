package com.kh.spring.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CartDto;
import com.kh.spring.entity.CartListNo;
import com.kh.spring.entity.CartListVO;
import com.kh.spring.entity.CartSubDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.OrderDetailDto;
import com.kh.spring.entity.OrderDetailListVo;
import com.kh.spring.entity.OrderSubDetail;
import com.kh.spring.entity.OrderSubDetailListVo;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.TotalVo;
import com.kh.spring.vo.OrderVo;
//주문 관련 Dao
@Repository
public interface OrdersDao {
	List<CartDto> cartlist(int member_code);
	ShopDto shopInfo(int shop_code);
	List<OrdersDto> myOrderList(int member_code);
	OrderDetailDto menuName(int no);
	int menuCount(int no);
	List<OrderDetailDto> myOrderDetailList(int order_code);
	void cartinput(CartListVO vo);
	MemberDto memberSearch(int member_code);
	OrdersDto orderInfo(int order_code);
	List<OrderDetailDto> orderDistinct(int order_code);
	void orderinput(OrdersDto ordersDto);
	void orderDetailInput(int order_code, int no, OrderDetailDto vo);
	int getseq();
	void cartDelete(int member_code);
	int getQuantity(int member_code);
	OrdersDto orderResult(int no);
	List<OrderVo> order_data(String no);
	List<TotalVo> sale_data(String no);
	int cancel(String no,String t1);
	int sussce(String no,String t1);
	List<OrderVo> date_day(String no,String start, String end);
	List<TotalVo> sale_day(String no,String start, String end);
	List<OrdersDto> orderslist(String status,String type,String keyword,int i, int j);
	int ordersCount(String status,String type,String keyword);
	List<OrderDetailDto> orderDetail(int no);
	MemberDto orderMember(int no);
	ShopDto orderDelivery(int no);
	void setStatus(int no, String order_status);
	List<CartSubDto> cartsublist(int no);
	List<CartListNo> cartlistno(int member_code);
	void cartInnerDelete(int no);
	void orderSubDetailInput(int no,OrderSubDetail ordersubdetail);
	List<OrderSubDetail> myOrderSubDetailList(int no);
	int getdetseq();
	

}
