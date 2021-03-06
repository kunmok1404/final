package com.kh.spring.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CartDto;

import com.kh.spring.entity.CartListVO;
import com.kh.spring.entity.CartSubDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.OrderDetailDto;
import com.kh.spring.entity.OrderSubDetail;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.PointDetailDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.entity.TotalVo;
import com.kh.spring.vo.OrderCountVO;
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
	void orderDetailInput(OrderDetailDto orderdetailvo);
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
	List<CartSubDto> cartsublist(CartDto no);
	List<Integer> cartlistno(int member_code);
	void cartInnerDelete(int no);
	void orderSubDetailInput(OrderSubDetail ordersubdetail);
	List<OrderSubDetail> myOrderSubDetailList(int no);
	int getdetseq();
	int getcoupon(int member_code);
	SubMenuDto getmenu(int radiomenu,int shop_code);
	void cartinsert(SubMenuDto getmenu);
	int getcartseq();
	void cartmenuinsert(CartDto cartdto);
	SubMenuDto getsubmenu(int checkmenu, int shop_code);
	int cart(int member_code);
	List<OrdersDto> getShopOrderList(int no);
	int shopordersCount(int shop_code,String status, String type, String keyword);
	OrdersDto shoporderResult(int no, int shop_code);
	List<OrdersDto> shoporderslist(int shop_code, String status, String type, String keyword, int start, int end);
	int getshopcode(int member_code);
	void orderCancel(int order_code);
	List<OrderCountVO> getCount(int shop_code);
	PointDetailDto getpoint(int member_code);
	void usepoint(int member_code, int discount_price);
	int cartcheck(int member_code, int shop_code);
}
