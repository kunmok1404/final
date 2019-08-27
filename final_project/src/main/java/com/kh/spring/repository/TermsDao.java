package com.kh.spring.repository;

import java.util.List;

import com.kh.spring.entity.TermsDto;

public interface TermsDao {
	TermsDto terms1();
	TermsDto terms2();
	void update1(String terms_content1);
	void update2(String terms_content2);
	
}
