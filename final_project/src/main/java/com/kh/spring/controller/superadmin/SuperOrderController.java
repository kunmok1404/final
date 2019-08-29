package com.kh.spring.controller.superadmin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.repository.OrdersDao;

@Controller
@RequestMapping("/super_admin/order")
public class SuperOrderController {
	
	@Autowired
	private OrdersDao ordersDao;
	
	@GetMapping("/list")
	public String order_list(Model model) {	
		model.addAttribute("ordersCount",ordersDao.ordersCount());
		model.addAttribute("ordersList",ordersDao.orderslist());
		return "admin/super/order/list";
	}
	@GetMapping("/detail")
	public String order_detail(@RequestParam int no,
							   Model model) {
//		model.addAttribute("orderDetail",ordersDao.orderDetail(no));
		
		return "admin/super/order/detail";
	}

}
