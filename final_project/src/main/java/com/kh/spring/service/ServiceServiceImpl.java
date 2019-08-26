package com.kh.spring.service;

import java.io.File;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.NoticeDto;
import com.kh.spring.repository.NoticeDao;
import com.kh.spring.repository.OnoDao;

@Service
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private OnoDao onoDao;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional
	public NoticeDto read(int no) {
		noticeDao.read(no);
		return noticeDao.get(no);
	}

	@Override
	public void regist(int no, MultipartFile image) throws IllegalStateException, IOException {

		String savename = image.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto filesDto = new FilesDto();
		filesDto.setSave_name(savename);
//		filesDto.setOneandone_code(no);
		filesDto.setUpload_name(image.getOriginalFilename());
		filesDto.setFile_size(image.getSize());
		filesDto.setFile_type(image.getContentType());
		onoDao.image(filesDto);
		
		
		File dir = new File("D:\\upload\\kh15");
		File target = new File(dir, savename);
		image.transferTo(target);
		
	}

	@Override
	public FilesDto get(String save_name) {
		return sqlSession.selectOne("service.ono_download",save_name);
	}
	

}
