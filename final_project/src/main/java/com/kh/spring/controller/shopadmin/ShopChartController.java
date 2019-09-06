package com.kh.spring.controller.shopadmin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.entity.TotalVo;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.vo.OrderVo;

@Controller
@RequestMapping("/shop_admin/chart")
public class ShopChartController {
	
	@Autowired
	OrdersDao orderDao;
	
	@Autowired
	ShopDao shopDao;
	
	//주문 분석 화면
	@GetMapping("/order")
	public String home(HttpSession session,Model model) {
//		String no = (String) session.getAttribute("shop_code");
		String no = "8000";
		List<OrderVo> list =orderDao.order_data(no); 
		List<Integer> cancel =new ArrayList<>();
		List<Integer> sussce =new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			String day = list.get(i).getT1()+"/"+list.get(i).getT2()+"/"+list.get(i).getT3();
			cancel.add(i, orderDao.cancel(no,day));
			sussce.add(i, orderDao.sussce(no,day));
		}
		model.addAttribute("order_date",list);
		model.addAttribute("cancel",cancel);
		model.addAttribute("sussce",sussce);
		return "admin/shop/chart/order_chart";
	}
	@PostMapping("/order")
	public String home(Model model,
			HttpSession session,
			@RequestParam String start,
			@RequestParam String end) {
//		String no = (String) session.getAttribute("shop_code");
		String no = "8000";
		List<OrderVo> list =orderDao.date_day(no,start,end); 
		List<Integer> cancel =new ArrayList<>();
		List<Integer> sussce =new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			String day = list.get(i).getT1()+"/"+list.get(i).getT2()+"/"+list.get(i).getT3();
			cancel.add(i, orderDao.cancel(no,day));
			sussce.add(i, orderDao.sussce(no,day));
		}
		model.addAttribute("order_date",list);
		model.addAttribute("cancel",cancel);
		model.addAttribute("sussce",sussce);
		return "admin/shop/chart/order_chart";
	}
	//결제 분석 화면
		@GetMapping("/sale")
		public String total(HttpSession session,Model model) {
//			String no = (String) session.getAttribute("shop_code");
			String no = "8000";
			List<TotalVo> list =orderDao.sale_data(no); 
			model.addAttribute("order_date",list);
			return "admin/shop/chart/sale_chart";
		}
		@PostMapping("/sale")
		public String total(Model model,
				HttpSession session,
				@RequestParam String start,
				@RequestParam String end) {
//			String no = (String) session.getAttribute("shop_code");
			String no = "8000";
			List<TotalVo> list =orderDao.sale_day(no,start,end); 
			model.addAttribute("order_date",list);
			return "admin/shop/chart/sale_chart";
		}
}
