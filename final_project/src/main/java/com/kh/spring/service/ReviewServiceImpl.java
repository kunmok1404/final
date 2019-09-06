package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ReviewDto.ReviewDtoBuilder;
import com.kh.spring.repository.ReviewDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.vo.ShopReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ShopDao shopDao;
	
	// 리뷰 테이블에 글정보 등록 후 시퀀스 반환
	@Override
	public int ReviewRegist(ReviewDto reviewDto) {
		
		// 리뷰 시퀀스 생성 및 설정
		int review_no = reviewDao.getReviewSeq();
		reviewDto.setNo(review_no);
		
		// 리뷰테이블에 글정보 등록
		reviewDao.write(reviewDto);
		
		// 주문테이블에 리뷰작성상태 변경
		reviewDao.reviewStatus(reviewDto.getOrder_code());
		
		return review_no;
	}
	
	// 리뷰등록
	@Override
	public void fileRegist(MultipartFile file, ReviewDto reviewDto) throws IllegalStateException, IOException {
		
		// 파일 시퀀스 생성
		int files_no = reviewDao.getFilesSeq();
		
		// 파일테이블에 리뷰 이미지정보 등록
		String save_name = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		reviewDao.fileRegist(FilesDto.builder()
										.no(files_no)
										.file_type(file.getContentType())
										.upload_name(file.getOriginalFilename())
										.save_name(save_name)
										.file_size(file.getSize()).build()
				);
		// 실제 파일 저장 코드
		File target = new File("D:/upload/kh15", save_name);
		file.transferTo(target); //물리적 위치에 저장하는 명령
		
		// 리뷰 이미지 테이블에 등록
		reviewDao.writeReviewImg(reviewDto.getNo(),files_no);
	}

	// 리뷰정보 조회
	@Override
	public ReviewDto reviewInfo(int review_code) {
		reviewDao.read(review_code); // 리뷰 조회수증가
		ReviewDto reviewDto = reviewDao.reviewInfo(review_code);
		// 시간 자르기
		String time = reviewDto.getRegist_date().substring(0, 16);
		reviewDto.setRegist_date(time);
		return reviewDto;
	}

	// 리뷰목록조회
	@Override
	public List<ShopReviewVO> list(int member_code) {
		List<ShopReviewVO> list = reviewDao.list(member_code);
		List<ShopReviewVO> review_list = new ArrayList<>();
		for(ShopReviewVO reviewDto : list) {
			// 시간 자르기
			String time = reviewDto.getRegist_date().substring(0, 16);
			reviewDto.setRegist_date(time);
			review_list.add(reviewDto);
		}
		return review_list;
	}

	// 리뷰이미지 불러오기
	@Override
	public ResponseEntity<ByteArrayResource> reviewImg(int files_code) throws IOException {
		// 이미지코드 조회
			// 파일정보 조회
			FilesDto filesDto = reviewDao.getFileInfo(files_code);
			
			// 만약 파일이 없다면(null) 404에러 전송(not found)
			if(filesDto == null) {
				return ResponseEntity.notFound().build();
			}
			
			// filesDto의 정보를 가지고 "실제 파일"을 불러온다.
			File target = new File("D:/upload/kh15", filesDto.getSave_name());
			byte[] data = FileUtils.readFileToByteArray(target); // common.io에 있는 라이브러리
			ByteArrayResource resource = new ByteArrayResource(data);
			
			return ResponseEntity.ok()
												.contentType(MediaType.parseMediaType(filesDto.getFile_type()))
												.contentLength(data.length)
												.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+URLEncoder.encode(filesDto.getUpload_name(), "UTF-8"))
												.body(resource);
		
		}

	// super관리자 리뷰목록 조회
	@Override
	public List<ShopReviewVO> superList() {
		List<ShopReviewVO> list = reviewDao.superList();
		List<ShopReviewVO> review_list = new ArrayList<>();
		for(ShopReviewVO reviewDto : list) {
			// 시간 자르기
			String time = reviewDto.getRegist_date().substring(0, 16);
			reviewDto.setRegist_date(time);
			review_list.add(reviewDto);
		}
		return review_list;
	}

	// super관리자 리뷰답변등록
	@Override
	public void replyRegist(ReviewDto reviewDto) {
		// 답변상태 변경
		reviewDao.updateReplyStatus(reviewDto);
		
		// 답변 등록
		reviewDao.replyRegist(reviewDto);
	}

	@Override
	public ResponseEntity<ByteArrayResource> shopimg(int files_code) throws IOException {
		// 이미지코드 조회
					// 파일정보 조회
					FilesDto filesDto = reviewDao.getFileInfo(files_code);
					
					// 만약 파일이 없다면(null) 404에러 전송(not found)
					if(filesDto == null) {
						return ResponseEntity.notFound().build();
					}
					
					// filesDto의 정보를 가지고 "실제 파일"을 불러온다.
					File target = new File("D:/upload/kh15", filesDto.getSave_name());
					byte[] data = FileUtils.readFileToByteArray(target); // common.io에 있는 라이브러리
					ByteArrayResource resource = new ByteArrayResource(data);
					
					return ResponseEntity.ok()
														.contentType(MediaType.parseMediaType(filesDto.getFile_type()))
														.contentLength(data.length)
														.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+URLEncoder.encode(filesDto.getUpload_name(), "UTF-8"))
														.body(resource);
				
	}
}
