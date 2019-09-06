package com.kh.spring.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class CheckMenuVOList {
	List<CheckMenuVO> checkMenuList;
}
