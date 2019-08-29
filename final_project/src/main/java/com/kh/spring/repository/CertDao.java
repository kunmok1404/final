package com.kh.spring.repository;

import com.kh.spring.entity.CertDto;

public interface CertDao {

	void insert(CertDto certDto);

	boolean validate(CertDto certDto);

	void delete(CertDto certDto);

}
