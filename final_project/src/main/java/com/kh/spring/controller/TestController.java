package com.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.test.TestListVO;
import com.kh.spring.test.TestSubVO;
import com.kh.spring.test.TestVO;

@Controller
public class TestController {
	
	@PostMapping("/test2")
	@ResponseBody
	public String test(@ModelAttribute TestListVO vo) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("--> TestListVO --<br>");
		for(TestVO tv : vo.getMain()) {
			buffer.append("--------> TestVO : " + tv + "<br>");
			for(TestSubVO tsv : tv.getList()) {
				buffer.append("----------------> TestSubVO : " + tsv + "<br>"); 
			}
		}
		return buffer.toString();
	}
}
