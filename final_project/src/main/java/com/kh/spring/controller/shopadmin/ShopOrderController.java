package com.kh.spring.controller.shopadmin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.repository.OrdersDao;

@Controller
@RequestMapping("/shop_admin/order")
public class ShopOrderController {
	@Autowired
	private OrdersDao ordersDao;
	
	@GetMapping("/list")
	public String order_list(
			@RequestParam(required = false) String status,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") 
			int page,Model model,HttpSession session) {	
		
		int member_code = (int) session.getAttribute("member_code");
		int shop_code = ordersDao.getshopcode(member_code);
		
		System.out.println(shop_code);
		int pagesize = 5;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = ordersDao.shopordersCount(shop_code,status,type, keyword);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		session.setAttribute("shop_code", shop_code);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("ordersList", ordersDao.shoporderslist(shop_code,status, type, keyword, start, end));
		model.addAttribute("ordersCount",ordersDao.shopordersCount(shop_code,status, type, keyword));
		return "admin/shop/order/list";
	}
	@GetMapping("/detail")
	public String order_detail(@RequestParam int no,
							   HttpSession session,Model model) {
		int shop_code = (int) session.getAttribute("shop_code");
		model.addAttribute("orderNo",no);
		model.addAttribute("shop_code",shop_code);
		model.addAttribute("orderDetail",ordersDao.orderDetail(no));
		model.addAttribute("orders", ordersDao.shoporderResult(no,shop_code));
		model.addAttribute("orderMember",ordersDao.orderMember(no));
		model.addAttribute("shop_del",ordersDao.orderDelivery(no));
		
		return "admin/shop/order/detail";
	}
	@PostMapping("/detail")
	public String order_detail(@RequestParam int no,
							   @RequestParam String order_status ) {
		ordersDao.setStatus(no,order_status);
		return "redirect:detail?no="+no;
	}
	@PostMapping("/list_status")
	public String list_status(@RequestParam int no,
							  @RequestParam String order_status ) {
		ordersDao.setStatus(no,order_status);
		return "redirect:/shop_admin/order/list";
	}
}
