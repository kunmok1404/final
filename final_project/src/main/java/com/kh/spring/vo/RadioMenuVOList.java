package com.kh.spring.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class RadioMenuVOList {
	List<RadioMenuVO> radioMenuList;
}
