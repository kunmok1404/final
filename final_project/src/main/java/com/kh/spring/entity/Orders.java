package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
//주문 Dto
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Orders {
	private int no;//주문번호
	private int member_code;//member no의 외래키
	private int cart_code;//cart no 의 외래키
	private int shop_code;//매장코드
	private int total_price;//총금액
	private int discount_price;//할인금액
	
	private String order_status;//주문상태
	private String pay_method;//결제방법
	private String request;//요청사항
	private String order_date;//주문일시

}
