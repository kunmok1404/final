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
import com.kh.spring.entity.OrderVo;
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
	public OrderDetailDto menuName(int no) {
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
	
	// 주문정보 조회
	@Override
	public OrdersDto orderInfo(int order_code) {
		return sqlsession.selectOne("order.order_info", order_code);
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

	@Override
	public List<OrderDetailDto> orderDistinct(int order_code) {
		return sqlsession.selectList("order.order_distinct", order_code);
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

	@Override
	public int getQuantity(int member_code) {
		return sqlsession.selectOne("order.quantity",member_code);
	}

	@Override
	public OrdersDto orderResult(int no) {
		return sqlsession.selectOne("order.order_result",no);
	}

	@Override

	public List<OrderVo> order_data() {
		return sqlsession.selectList("order.order_data");
	}

	@Override
	public int cancel(String t1) {
		Map<String, Object> map = new HashMap<>();
		map.put("order_date", t1);
		return sqlsession.selectOne("order.cancel_data", map);
	}

	@Override
	public int sussce(String t1) {
		Map<String, Object> map = new HashMap<>();
		map.put("order_date", t1);
		return sqlsession.selectOne("order.sussce_data", map);
	}

	@Override
	public List<OrderVo> date_day(String start, String end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlsession.selectList("order.date_day", map);
	}
	@Override
	public List<OrdersDto> orderslist(String status,String type,String keyword,int i, int j) {
		Map<String, Object> param = new HashMap<>();
		//검색일경우 검색어를 mybatis에 전달
		if(status!=null) {
		param.put("status", status);			
		}
		if(type!=null && keyword!=null) {
		param.put("type", type);
		param.put("keyword", keyword);
		}	
		param.put("start", i);
		param.put("end", j);
		return sqlsession.selectList("order.ordersList",param);
	}

	@Override
	public int ordersCount(String status,String type,String keyword) {
		Map<String, Object> param = new HashMap<>();
		if(status!=null) {
		param.put("status", status);			
		}
		if(type!=null && keyword!=null) {
		param.put("type", type);
		param.put("keyword", keyword);
		}	
		return sqlsession.selectOne("order.ordersCount",param);
	}

	@Override
	public List<OrderDetailDto> orderDetail(int no) {
		return sqlsession.selectList("order.orderDetail",no);
	}

	@Override
	public MemberDto orderMember(int no) {
		return sqlsession.selectOne("order.orderMember",no);
	}

	@Override
	public ShopDto orderDelivery(int no) {
		return sqlsession.selectOne("order.shopDelivery",no);
	}

	@Override
	public void setStatus(int no, String order_status) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("order_status", order_status);
		sqlsession.update("order.setStatus",map);
		
	}




}
