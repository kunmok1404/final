package com.kh.spring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ReviewDto.ReviewDtoBuilder;
import com.kh.spring.vo.ShopReviewVO;
import com.kh.spring.entity.ReviewImgDto;

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
		return sqlSession.selectOne("review.filesDto",files_code);
	}

	// super관리자 리뷰목록 조회
	@Override
	public List<ShopReviewVO> superList() {
		return sqlSession.selectList("review.super_review_list");
	}

	// super관리자 리뷰목록 갯수
	@Override
	public int searchNumber() {
		return sqlSession.selectOne("review.super_review_number");
	}

	// super관리자 답변등록
	@Override
	public void replyRegist(ReviewDto reviewDto) {
		sqlSession.insert("review.super_reply",reviewDto);
	}

	// super관리자 답변상태 변경
	@Override
	public void updateReplyStatus(ReviewDto reviewDto) {
		sqlSession.update("review.super_reply_status",reviewDto);
	}

	// 주문코드로 리뷰정보 구하기
	@Override
	public ReviewDto getReivewInfo(int order_code) {
		ReviewDto result = sqlSession.selectOne("review.getReivewInfo", order_code);
		return result ;
	}

	// 리뷰이미지 테이블에 등록
	@Override
	public void insertReviewImg(int files_code, int review_code) {
		Map<String, Object> map = new TreeMap<String, Object>();
		map.put("files_code", files_code);
		map.put("review_code", review_code);
		sqlSession.insert("review.insertReviewImg", map);
	}

}
