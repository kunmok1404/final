package com.kh.spring.service;

import java.util.List;
import java.util.Map;

public interface OrderService {

	List<Map<String, Object>> myOrderList(int member_code);

}
