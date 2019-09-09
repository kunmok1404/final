package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

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
import com.kh.spring.entity.QnaDto;
import com.kh.spring.repository.NoticeDao;
import com.kh.spring.repository.OnoDao;
import com.kh.spring.repository.QnaDao;

@Service
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private OnoDao onoDao;
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private QnaDao qnaDao;

	@Override
	@Transactional
	public NoticeDto read(int no) {
		noticeDao.read(no);
		return noticeDao.get(no);
	}
	// ono 테이블에 글정보 등록 후 시퀀스 반환
	@Override
	public int OnoRegist(OnoDto onoDto) {
		
		// ono 시퀀스 생성 및 설정
		int ono_no = onoDao.getOnoSeq();
		onoDto.setNo(ono_no);
		
		// ono테이블에 글정보 등록
		onoDao.write(onoDto);
		
		return ono_no;
	}
	
	// 파일등록
	@Override
	public void fileRegist(MultipartFile file, OnoDto onoDto) throws IllegalStateException, IOException {
		// 파일 시퀀스 생성
		int files_no = onoDao.getFilesSeq();
		
		//파일테이블에  이미지정보 등록
		String save_name = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		onoDao.fileRegist(FilesDto.builder()
										.no(files_no)
										.file_type(file.getContentType())
										.upload_name(file.getOriginalFilename())
										.save_name(save_name)
										.file_size(file.getSize()).build()
				);
		// 실제 파일 저장 코드
		File target = new File("D:/upload/kh15", save_name);
		file.transferTo(target); //물리적 위치에 저장하는 명령
		
		// 이미지 테이블에 등록
		onoDao.writeOnoImg(onoDto.getNo(),files_no);
		
	}
	@Override
	public OnoDto onoInfo(int ono_code) {

		OnoDto onoDto = onoDao.onoInfo(ono_code);
		// 시간 자르기
		String time = onoDto.getRegist_date().substring(0, 16);
		onoDto.setRegist_date(time);
		return onoDto;
	}
	
	//이미지 불러오기
	@Override
	public ResponseEntity<ByteArrayResource> onoImg(int files_code) throws IOException {
//		 이미지 코드조회
//		2. 1번에서 불러온 정보에서 해당하는 파일정보를 다시 불러온다.
		
		FilesDto filesDto = onoDao.getFileInfo(files_code);
		System.out.println(filesDto);
		
		//만약 파일이 없다면(null) 404에러 전송(not found)
		if(filesDto == null) {
			return ResponseEntity.notFound().build();
		}
		
		//filesDto의 정보를 가지고 "실제 파일"을 불러온다.
		File target = new File("D:/upload/kh15", filesDto.getSave_name());
		byte[] data = FileUtils.readFileToByteArray(target); //common.io에 있는 라이브러리
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
											.contentType(MediaType.parseMediaType(filesDto.getFile_type()))
											.contentLength(data.length)
											.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+URLEncoder.encode(filesDto.getUpload_name(), "UTF-8"))
											.body(resource);
	}
	@Override
	@Transactional
	public int write(NoticeDto noticeDto) {
		int no = noticeDao.getSequenceNumber();
		noticeDto.setNo(no);
		noticeDao.insert(noticeDto);
		return no;
	}
	@Override
	public QnaDto qnaInfo(int no) {
		QnaDto qnaDto = qnaDao.qnaInfo(no);
		// 시간 자르기
		String time = qnaDto.getRegist_date().substring(0, 16);
		qnaDto.setRegist_date(time);
		return qnaDto;
	}
	@Override
	public int write(QnaDto qnaDto) {
		int no = qnaDao.getSequenceNumber();
		 qnaDto.setNo(no);
		qnaDao.insert( qnaDto);
		return no;
	}



	


}
