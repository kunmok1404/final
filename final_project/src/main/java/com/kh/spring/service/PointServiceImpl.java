package com.kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.PointDetailDto;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.PointDao;
import com.kh.spring.vo.MemberPointVO;

@Service
public class PointServiceImpl implements PointService {

	@Autowired
	private PointDao pointDao;
	@Autowired
	private MemberDao memberDao;
	
	// 포인트 목록 조회
	@Override
	public List<PointDetailDto> list(int member_code) {
		List<PointDetailDto> list = pointDao.list(member_code);
		List<PointDetailDto> point_list = new ArrayList<>();
		for(PointDetailDto pointDto : list) {
			// 시간 자르기
			String time = pointDto.getWhen().substring(0, 16);
			pointDto.setWhen(time);
			point_list.add(pointDto);
		}
		return point_list;
	}

	//super_admin 포인트 목록 관리
	@Override
	public List<MemberPointVO> getPointList() {

		List<MemberPointVO> list = new ArrayList<MemberPointVO>();
		// 회원정보 목록 구하기
		List<MemberDto> memberList = memberDao.getMemberList();
		// 회원정보로 포인트 목록 구해서 VO에 세팅하기
		for(MemberDto memberDto : memberList) {
			// 총적립 포인트 조회 
			int total_point = pointDao.getTotalPoint(memberDto.getNo());
			// 총사용 포인트 조회
			System.out.println("member_code="+memberDto.getNo());
			int use_point = pointDao.getUsePoint(memberDto.getNo());
			System.out.println("use_point="+use_point);
			// VO에 세팅
			MemberPointVO memberPointVO = MemberPointVO.builder()
																	.member_code(memberDto.getNo())
																	.id(memberDto.getId())
																	.grade(memberDto.getGrade())
																	.status(memberDto.getStatus())
																	.total_point(total_point)
																	.use_point(use_point)
																	.present_point(total_point - use_point).build();
		list.add(memberPointVO);
		}
		return list;
	}

	// 포인트 합계VO구하기
	@Override
	public MemberPointVO getPointInfo(int member_code) {
		// 총적립 포인트 조회 
		int total_point = pointDao.getTotalPoint(member_code);
		// 총사용 포인트 조회
		int use_point = pointDao.getUsePoint(member_code);
		// VO에 세팅
		MemberPointVO memberPointVO = MemberPointVO.builder()
																.total_point(total_point)
																.use_point(use_point)
																.present_point(total_point - use_point).build();
		return memberPointVO;
	}

}
