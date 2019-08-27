package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.NoticeDto;
import com.kh.spring.entity.OnoDto;
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
		filesDto.setSize(image.getSize());
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

	@Override
	public int OnoRegist(OnoDto onoDto) {
		
		int no = onoDao.getSeq();
		onoDto.setNo(no);
		
		onoDao.write(onoDto);

		return no;
	}

	@Override
	public void fileRegist(MultipartFile file, OnoDto onoDto) throws IllegalStateException, IOException {
		
		int files_no = onoDao.getSeq();
		
		String save_name = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		onoDao.fileRegist(FilesDto.builder()
										.no(files_no)
										.file_type(file.getContentType())
										.upload_name(file.getOriginalFilename())
										.save_name(save_name)
										.size(file.getSize()).build()
												);
		//실제파일 저장코드
		File target = new File("D:upload/kh15",save_name);
		file.transferTo(target);
		
		onoDao.writeOnoImg(onoDto.getNo(),files_no);
					
	}

	@Override
	public ResponseEntity<ByteArrayResource> onoImg(int files_code) throws IOException {
		FilesDto filesDto = onoDao.getfile(files_code);
		
		if(filesDto == null) {
			return ResponseEntity.notFound().build();
		}
		
		File target = new File("D:upload/kh15", filesDto.getSave_name());
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(filesDto.getFile_type()))
				.contentLength(data.length)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+URLEncoder.encode(filesDto.getUpload_name(), "UTF-8"))
				.body(resource);
	}
}
