package com.kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.entity.NoticeDto;
import com.kh.spring.repository.NoticeDao;

@Service
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	@Transactional
	public NoticeDto read(int no) {
		noticeDao.read(no);
		return noticeDao.get(no);
	}
	

}
