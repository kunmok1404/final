package com.kh.spring.repository;

import com.kh.spring.entity.MyshopDto;

public interface MemberDao {
	void like(MyshopDto myshop);
	void unlike(MyshopDto myshop);
}
