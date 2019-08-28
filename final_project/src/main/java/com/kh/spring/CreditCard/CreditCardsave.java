package com.kh.spring.CreditCard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CreditCardsave {
	private String imp_uid,merchant_uid,apply_num;
	private int paid_amount;

}
