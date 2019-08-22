package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.CartDto;
import com.kh.spring.entity.CartListVO;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.OrderDetailDto;
import com.kh.spring.entity.OrderDetailListVo;
import com.kh.spring.entity.OrdersDto;
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
	public List<OrdersDto> myOrderList(int member_code) {
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
	
	 // 나의정보 주문상세 목록
	@Override
	public List<OrderDetailDto> myOrderDetailList(int order_code) {
		return sqlsession.selectList("order.my_order_detail",order_code);
	}
	
	@Override
	public void cartinput(CartListVO vo) {
		List<CartDto> list = vo.getList();
		for(CartDto cartDto : list) {
			sqlsession.update("order.update",cartDto);
		}
	}

	@Override
	public MemberDto memberSearch(int member_code) {
		return sqlsession.selectOne("order.search", member_code);
	}

	// 주문정보 조회
	@Override
	public OrdersDto orderInfo(int order_code) {
		return sqlsession.selectOne("order.order_info", order_code);
	}

	@Override
	public void orderinput(OrdersDto ordersDto) {
		sqlsession.insert("order.order_regist",ordersDto);	
	}

	@Override
	public void orderDetailInput(int no,OrderDetailListVo vo) {
		List<OrderDetailDto> list = vo.getList();
		for(OrderDetailDto orderDetailDto : list) {
			orderDetailDto.setOrder_no(no);
			sqlsession.update("order.detail_regist",orderDetailDto);
		}
	}

	@Override
	public int getseq() {
		return sqlsession.selectOne("order.order_seq");
	}

	@Override
	public void cartDelete(int member_code) {
		sqlsession.delete("order.delete",member_code);
		
	}

}
