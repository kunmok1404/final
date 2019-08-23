package com.kh.spring.KakaoPay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
//카카오페이 요청시 반환 자료형
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaopayReturnVo {
	private String tid;
	private String next_redirect_pc_url;
	private String created_at;

}
