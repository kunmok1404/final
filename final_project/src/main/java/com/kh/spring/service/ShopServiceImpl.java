package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.repository.FilesDao;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.OrdersDao;
import com.kh.spring.repository.ReviewDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.vo.ShopListVO;


@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;
	@Autowired
	private FilesDao filesDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private OrdersDao ordersDao;
	
	//留매장정보
	@Override
	public Map<Integer, List<MenuDto>> menuList(int no) {
		List<MenuDto> menu_list = shopDao.menuList(no);
		
		Map<Integer, List<MenuDto>> map = new TreeMap<>();
		
		for(MenuDto menuDto : menu_list) {
			map.put(menuDto.getMenu_category(), new ArrayList<>());
		}
		
		for(MenuDto menuDto : menu_list) {
			map.get(menuDto.getMenu_category()).add(menuDto);
		}
		return map;
	}

	// 모달창정보 불러오기
	@Override
	public Map<String, List<SubMenuDto>> sub_menu(int menu_no) {
		List<SubMenuDto> subMenuList = shopDao.subMenuList(menu_no);
		
		Map<String, List<SubMenuDto>> map = new TreeMap<>();
		
		// 키 입력, 리스트생성(필수, 선택으로 나눠서 키저장)
		for(SubMenuDto subMenuDto : subMenuList) {
			if(subMenuDto.getType().equals("필수")) {
				map.put(subMenuDto.getTitle(), new ArrayList<>());	
			} else {
				map.put(subMenuDto.getTitle(), new ArrayList<>());	
			}	
		}
		
		// 키에다가 Dto저장
		for(SubMenuDto subMenuDto : subMenuList) {
			if(map.get(subMenuDto.getTitle()).equals("필수")) {
				map.get(subMenuDto.getTitle()).add(subMenuDto);
			} else {
				map.get(subMenuDto.getTitle()).add(subMenuDto);
			}
		}
		return map;
	}
	
//	업주 입점신청 등록
	@Override
	public void regist(ShopDto shopDto, MultipartFile business_file, MultipartFile sale_file,
			MultipartFile logo) throws IllegalStateException, IOException {
		
		if(!business_file.isEmpty()) {
		// 사업자등록증 파일 세팅 후 등록
		int business_seq = filesDao.getFileSeq();
		String business_savename = business_file.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto businessFilesDto = new FilesDto();
		businessFilesDto.setNo(business_seq);
		businessFilesDto.setSave_name(business_savename);
		businessFilesDto.setUpload_name(business_file.getOriginalFilename());
		businessFilesDto.setFile_size(business_file.getSize());
		businessFilesDto.setFile_type(business_file.getContentType());
		shopDao.files_regist(businessFilesDto);
		// 파일코드 세팅
		shopDto.setBusiness_regist(business_seq);
		// 사업자등록증 파일 저장
		File dir = new File("D:\\upload\\kh15");
		File business_target = new File(dir, business_savename);
		business_file.transferTo(business_target);
		}
		
		if(!sale_file.isEmpty()) {
		// 영업등록증 파일 세팅 후 등록
		int sale_seq = filesDao.getFileSeq();
		String sale_savename = sale_file.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto saleFilesDto = new FilesDto();
		saleFilesDto.setNo(sale_seq);
		saleFilesDto.setSave_name(sale_savename);
		saleFilesDto.setUpload_name(sale_file.getOriginalFilename());
		saleFilesDto.setFile_size(sale_file.getSize());
		saleFilesDto.setFile_type(sale_file.getContentType());
		shopDao.files_regist(saleFilesDto);
		// 파일코드 세팅
		shopDto.setSale_regist(sale_seq);
		// 영업등록증 파일 저장
		File dir = new File("D:\\upload\\kh15");
		File sale_target = new File(dir, sale_savename);
		sale_file.transferTo(sale_target);
		}
		
		if(!logo.isEmpty()) {
		// 로고 이미지 세팅 후 등록
		int logo_seq = filesDao.getFileSeq();
		String logo_savename = logo.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto logoFilesDto = new FilesDto();
		logoFilesDto.setNo(logo_seq);
		logoFilesDto.setSave_name(logo_savename);
		logoFilesDto.setUpload_name(logo.getOriginalFilename());
		logoFilesDto.setFile_size(logo.getSize());
		logoFilesDto.setFile_type(logo.getContentType());
		shopDao.files_regist(logoFilesDto);
		// 파일코드 세팅
		shopDto.setShop_img(logo_seq);
		// 로고 이미지 저장
		File dir = new File("D:\\upload\\kh15");
		File logo_target = new File(dir, logo_savename);
		logo.transferTo(logo_target);
		}
		
		// 매장정보 등록
		shopDao.regist(shopDto);
	}

	@Override
	public void edit(ShopDto shopDto, MultipartFile img) throws IllegalStateException, IOException {
		
		int no1 = shopDao.getSeq();
		
		String savename = img.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto filesDto = new FilesDto();
		filesDto.setNo(no1);
		filesDto.setSave_name(savename);
		filesDto.setUpload_name(img.getOriginalFilename());
		filesDto.setFile_size(img.getSize());
		filesDto.setFile_type(img.getContentType());
		shopDao.files_regist(filesDto);
		
		File dir = new File("D:\\upload\\kh15");
		File target = new File(dir, savename);
		img.transferTo(target);
		
		shopDto.setShop_img(no1);
		
		
		shopDao.edit(shopDto);
		
	}

	// 매장 삭제
	@Override
	public void deleteShop(int shop_code) {
		
		// 관련 실제파일 삭제
		ShopDto shopDto = shopDao.shopInfo(shop_code);
		FilesDto logoFile = filesDao.getFilesInfo(shopDto.getShop_img());
		FilesDto businessFile = filesDao.getFilesInfo(shopDto.getBusiness_regist());
		FilesDto saleFile = filesDao.getFilesInfo(shopDto.getSale_regist());
		File logo_file = new File("D:/upload/kh15", logoFile.getSave_name());
		File business_file = new File("D:/upload/kh15", businessFile.getSave_name());
		File sale_file = new File("D:/upload/kh15", saleFile.getSave_name());
		logo_file.delete();
		business_file.delete();
		sale_file.delete();
		
		//관련 파일정보 삭제
		filesDao.deleteFile(shopDto.getBusiness_regist());
		filesDao.deleteFile(shopDto.getSale_regist());
		filesDao.deleteFile(shopDto.getShop_img());
		
		// 매장정보삭제
		shopDao.deleteShop(shop_code);
		
	}

	// 매장승인시
	@Override
	public void apply(int shop_code) {
		// 매장 승인상태 변경
		shopDao.apply(shop_code);
		
		// 업주 회원정보 승인상태변경
		memberDao.applyShop(shop_code);
	}

	// 매장리스트 VO
	@Override
	public List<ShopListVO> ajaxPaging(int start, int end, int cat_no) {
		
		List<ShopDto> list = shopDao.ajaxPaging(start, end, cat_no);
		List<ShopListVO> shop_list = new ArrayList<>();
		
		for(ShopDto shopDto : list) {
			ShopListVO shopListVO = new ShopListVO();
			// 리뷰 갯수 구하기
			// orders 테이블에서 List조회(orders.no로 review조회가능)
			List<OrdersDto> orderList = ordersDao.getShopOrderList(shopDto.getNo());
			// 구해온 주문내역을 추출하여 review테이블에서 점수조회후 더함
			int count=0; // 리뷰갯수
			int total_score=0; // 총점 
			for(OrdersDto ordersDto : orderList) {
				// 해당 주문에 대해 review작성이 되어 있다면 점수계산
				ReviewDto reviewDto = reviewDao.getReivewInfo(ordersDto.getNo());
				if(reviewDto != null) {
					total_score += 	reviewDto.getScore();
					count++;
				}
			}
			double average_score = total_score / count; //평균점수
			double result_score = Math.round(average_score*10) / 10.0; // 소수점 첫째자리반올림
			
			
		}
		return null;
	}

	


}
