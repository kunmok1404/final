package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ReviewImgDto;
import com.kh.spring.entity.ShopReviewVO;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 리뷰등록
	@Override
	public void write(ReviewDto reviewDto) {
		sqlSession.insert("review.regist",reviewDto);
	}

	// 리뷰목록
	@Override
	public List<ShopReviewVO> list(int member_code) {
		return sqlSession.selectList("review.list", member_code);
	}

	// 글번호 구하기
	@Override
	public int getReviewSeq() {
		return sqlSession.selectOne("review.review_seq");
	}

	// 리뷰+이미지 중간테이블 등록
	@Override
	public void writeReviewImg(int review_no, int files_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("review_no", review_no);
		map.put("files_no", files_no);
		sqlSession.insert("review.review_img",map);
	}

	// 파일테이블 시퀀스 생성
	@Override
	public int getFilesSeq() {
		return sqlSession.selectOne("review.files_seq");
	}

	// 파일테이블에 리뷰이미지정보 등록
	@Override
	public void fileRegist(FilesDto filesDto) {
		sqlSession.insert("review.files_regist", filesDto);
	}

	// 주문테이블에 리뷰작성상태 변경
	@Override
	public void reviewStatus(int order_code) {
		sqlSession.update("review.review_status", order_code);
	}

	// 리뷰정보 조회
	@Override
	public ReviewDto reviewInfo(int review_code) {
		return sqlSession.selectOne("review.review_info", review_code);
	}

	// 리뷰조회수 증가
	@Override
	public void read(int review_code) {
		sqlSession.update("review.read",review_code);
	}

	// 리뷰이미지코드 조회
	@Override
	public List<ReviewImgDto> reviewImg(int review_code) {
		return sqlSession.selectList("review.review_img_code",review_code);
	}

	// 파일정보 조회
	@Override
	public FilesDto getFileInfo(int files_code) {
		System.out.println("files_code="+files_code);
		return sqlSession.selectOne("review.filesDto",files_code);
	}

}
