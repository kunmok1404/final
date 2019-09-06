package com.kh.spring.controller.shopadmin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.service.ShopService;
import com.kh.spring.vo.OrderVo;

// 매장관리자
@Controller
@RequestMapping("/shop_admin")
public class ShopHomeController {
	
	@Autowired
	ShopDao shopDao;
	
	@Autowired
	OrdersDao orderDao;
	
	@Autowired
	private ShopService shopService;

	//메인화면
	@GetMapping({"","/"})
	public String home(Model model) {
		List<OrderVo> list =orderDao.order_data(); 
		List<Integer> cancel =new ArrayList<>();
		List<Integer> sussce =new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			String day = list.get(i).getT1()+"/"+list.get(i).getT2()+"/"+list.get(i).getT3();
			cancel.add(i, orderDao.cancel(day));
			sussce.add(i, orderDao.sussce(day));
		}
		model.addAttribute("order_date",list);
		model.addAttribute("cancel",cancel);
		model.addAttribute("sussce",sussce);
		return "admin/shop/home";
	}
	@PostMapping({"","/"})
	public String home(Model model,@RequestParam String start,@RequestParam String end) {
		List<OrderVo> list =orderDao.date_day(start,end); 
		List<Integer> cancel =new ArrayList<>();
		List<Integer> sussce =new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			String day = list.get(i).getT1()+"/"+list.get(i).getT2()+"/"+list.get(i).getT3();
			cancel.add(i, orderDao.cancel(day));
			sussce.add(i, orderDao.sussce(day));
		}
		model.addAttribute("order_date",list);
		model.addAttribute("cancel",cancel);
		model.addAttribute("sussce",sussce);
		return "admin/shop/home";
	}
	//	매장정보확인
	@GetMapping("/shop_info")
	public String shop_info(Model model) {
		int no = 1;
		model.addAttribute("shop",shopDao.shopInfo(no));
		return "admin/shop/shop_info";
	}
	
	//	매장정보수정확인
	@PostMapping("/shop_info")
	public String shop_info(
				ShopDto shopDto,
				@RequestParam MultipartFile img,
				Model model
			) throws IllegalStateException, IOException {
		shopService.edit(shopDto,img);
		
		model.addAttribute("shop",shopDao.shopInfo(shopDto.getNo()));
		return  "admin/shop/shop_info";
	}
}
	
