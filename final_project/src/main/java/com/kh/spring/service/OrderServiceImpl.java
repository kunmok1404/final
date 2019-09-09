package com.kh.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.OrderDetailDto;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private ShopDao shopDao;
	
	// 나의정보 주문내역
	@Override
	public List<Map<String, Object>> myOrderList(int member_code) {
		//Order 테이블 내역 
		List<OrdersDto> order_list = ordersDao.myOrderList(member_code);
		
		// List추출 후 Map에 세팅
		List<Map<String, Object>> list = new ArrayList<>();
		for(int i = 0; i < order_list.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			OrdersDto orderDto = order_list.get(i);
			map.put("no", orderDto.getNo()); // 주문번호
			// 매장코드로 매장명 조회후 세팅
			ShopDto shopDto = ordersDao.shopInfo(orderDto.getShop_code());
			map.put("shop_name", shopDto.getShop_name()); 
			
			// 주문번호로 메뉴명1개, 총메뉴갯수 구한후 세팅
			System.out.println("orderDto.getNo()="+orderDto.getNo());
			OrderDetailDto menu_name = ordersDao.menuName(orderDto.getNo());
			System.out.println("menu_name="+menu_name);
			int menu_count = ordersDao.menuCount(orderDto.getNo());
			map.put("menu_name",menu_name.getMenu_name());
			map.put("menu_count",menu_count);
			
			map.put("order_date",orderDto.getOrder_date()); // 주문일시
			map.put("order_status",orderDto.getOrder_status()); //주문상태
			map.put("review_status",orderDto.getReview_status()); //주문상태
			list.add(map);
		}
		return list;
	}

	// 매장정보
	@Override
	public ShopDto orderInfo(int order_code) {
		OrdersDto ordersDto = ordersDao.orderInfo(order_code);
		return shopDao.shopInfo(ordersDto.getShop_code());
	}

}
