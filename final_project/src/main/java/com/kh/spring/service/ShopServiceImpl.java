package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.OrderDetailDto;
import com.kh.spring.entity.OrderSubDetail;
import com.kh.spring.entity.OrdersDto;
import com.kh.spring.entity.ReviewDto;
import com.kh.spring.entity.ReviewImgDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.repository.CategoryDao;
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
	@Autowired
	private CategoryDao categoryDao;
	
	//留매장정보
	@Override
	public Map<String, List<MenuDto>> menuList(int no) {
		List<MenuDto> menu_list = shopDao.menuList(no);
		
		Map<String, List<MenuDto>> map = new TreeMap<>();
		
		//menuCateogry 이름으로 List value 생성
		for(MenuDto menuDto : menu_list) {
			CategoryDto categoryDto = categoryDao.getMenuCategoryInfo(menuDto.getMenu_category());
			map.put(categoryDto.getName(), new ArrayList<>());
		}
		
		// 키 하나씩 꺼내서 value에 dto넣어주기
		for(MenuDto menuDto : menu_list) {
			CategoryDto categoryDto = categoryDao.getMenuCategoryInfo(menuDto.getMenu_category());
			map.get(categoryDto.getName()).add(menuDto);
		}
		return map;
	}
	
	// 매장 리뷰정보 조회
	@Override
	public Map<ReviewDto, List<ReviewImgDto>> reviewList(int shop_code) {
		//shop_code로 모든 주문정보 조회
		List<OrdersDto> orderList = ordersDao.getShopOrderList(shop_code);
		
		//주문정보에 있는 review_code로 리뷰정보 조회 후 map에 세팅
		Map<ReviewDto, List<ReviewImgDto>> map = new HashMap<>();
		ReviewDto reviewDto = null;
		// key 세팅
		for(OrdersDto orderDto : orderList) {
			reviewDto = reviewDao.getReivewInfo(orderDto.getNo());
			
			if(reviewDto != null) {
				// 회원아이디 조회
				MemberDto memberDto = memberDao.getInfo(reviewDto.getMember_code());
				reviewDto.setMember_id(memberDto.getId());
				//시간 자르기
				String time = reviewDto.getRegist_date().substring(0, 16);
				reviewDto.setRegist_date(time);
				// 메뉴조합
				OrdersDto ordersDto = ordersDao.orderInfo(reviewDto.getOrder_code());
				List<OrderDetailDto> orderDetailList = ordersDao.orderDetail(ordersDto.getNo());
				if(orderDetailList != null) {
					String menu = "";
					for(OrderDetailDto orderDetailDto : orderDetailList) {
						menu += orderDetailDto.getMenu_name() + orderDetailDto.getMenu_amount();
						if(orderDetailDto.getList() != null) { 
							menu += "(";
							for(OrderSubDetail orderSubDetail : orderDetailDto.getList()) {
								menu += orderSubDetail.getSub_name() + orderSubDetail.getSub_amount();
							}
							menu += ")";
						}
					}
					reviewDto.setReview_menu(menu);
				}
				// value세팅
				if(reviewDto != null) {
					List<ReviewImgDto> reviewImgList = reviewDao.reviewImg(reviewDto.getNo());
					map.put(reviewDto, reviewImgList);
					}
				}
			}
		return map;
		}
//		// value 세팅
//		for(OrdersDto orderDto : orderList) {
//			if(reviewDto != null) {
//				System.out.println("reviewDto="+reviewDto);
//				List<ReviewImgDto> reviewImgList = reviewDao.reviewImg(reviewDto.getNo());
//				System.out.println("reviewImgList="+reviewImgList);
//				for(ReviewImgDto reviewImgDto : reviewImgList) {
//					if(reviewImgDto != null)
//					map.get(reviewDto).add(reviewImgDto);
//				}
//			}
//		}
		
//	}

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
	public void regist(ShopDto shopDto, MultipartFile business_regist, MultipartFile sale_regist,
			MultipartFile logo) throws IllegalStateException, IOException {
		
		if(!business_regist.isEmpty()) {
		// 사업자등록증 파일 세팅 후 등록
		int business_seq = filesDao.getFileSeq();
		String business_savename = business_regist.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto businessFilesDto = new FilesDto();
		businessFilesDto.setNo(business_seq);
		businessFilesDto.setSave_name(business_savename);
		businessFilesDto.setUpload_name(business_regist.getOriginalFilename());
		businessFilesDto.setFile_size(business_regist.getSize());
		businessFilesDto.setFile_type(business_regist.getContentType());
		shopDao.files_regist(businessFilesDto);
		// 파일코드 세팅
		shopDto.setBusiness_file(business_seq);
		// 사업자등록증 파일 저장
		File dir = new File("D:\\upload\\kh15");
		File business_target = new File(dir, business_savename);
		business_regist.transferTo(business_target);
		}
		
		if(!sale_regist.isEmpty()) {
		// 영업등록증 파일 세팅 후 등록
		int sale_seq = filesDao.getFileSeq();
		String sale_savename = sale_regist.getOriginalFilename() + "-" + System.currentTimeMillis()/* +"-"+UUID.randomUUID() */;
		
		FilesDto saleFilesDto = new FilesDto();
		saleFilesDto.setNo(sale_seq);
		saleFilesDto.setSave_name(sale_savename);
		saleFilesDto.setUpload_name(sale_regist.getOriginalFilename());
		saleFilesDto.setFile_size(sale_regist.getSize());
		saleFilesDto.setFile_type(sale_regist.getContentType());
		shopDao.files_regist(saleFilesDto);
		// 파일코드 세팅
		shopDto.setSale_file(sale_seq);
		// 영업등록증 파일 저장
		File dir = new File("D:\\upload\\kh15");
		File sale_target = new File(dir, sale_savename);
		sale_regist.transferTo(sale_target);
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

	//매장정보 수정
	@Override
	public void edit(ShopDto shopDto, MultipartFile img) throws IllegalStateException, IOException {
		
		// 파일이 있다면 수정
		if(!img.isEmpty()) {
			System.out.println("파일있다");
			//파일정보 조회
			FilesDto originFilesDto = filesDao.getFilesInfo(shopDto.getShop_img());
			// 기존파일 삭제
			File originTarget = new File("D:/upload/kh15", originFilesDto.getSave_name());
			originTarget.delete();
			
			// 새파일 정보등록
			String save_name = img.getOriginalFilename() + "-" + System.currentTimeMillis();
			
			// files 테이블에 수정
			filesDao.updateFileInfo(FilesDto.builder()
					.no(originFilesDto.getNo())
					.file_type(img.getContentType())
					.upload_name(img.getOriginalFilename())
					.save_name(save_name)
					.file_size(img.getSize()).build()
			);
			
			// 실제 파일 저장 코드
			File target = new File("D:/upload/kh15", save_name);
			img.transferTo(target); //물리적 위치에 저장하는 명령
			
		} 
			System.out.println("파일없다");
			shopDao.edit(shopDto);
	}

	// 매장 삭제
	@Override
	public void deleteShop(int shop_code) {
		
		// 관련 실제파일 삭제
		ShopDto shopDto = shopDao.shopInfo(shop_code);
		FilesDto logoFile = filesDao.getFilesInfo(shopDto.getShop_img());
		FilesDto businessFile = filesDao.getFilesInfo(shopDto.getBusiness_file());
		FilesDto saleFile = filesDao.getFilesInfo(shopDto.getSale_file());
		if(!logoFile.getSave_name().isEmpty() || logoFile.getSave_name() != null) {
			File logo_file = new File("D:/upload/kh15", logoFile.getSave_name());
			logo_file.delete();logo_file.delete();
		}
		if(!businessFile.getSave_name().isEmpty() || businessFile.getSave_name() != null) {
			File business_file = new File("D:/upload/kh15", businessFile.getSave_name());
			business_file.delete();
		}
		if(!saleFile.getSave_name().isEmpty() || saleFile.getSave_name() != null) {
			File sale_file = new File("D:/upload/kh15", saleFile.getSave_name());
			sale_file.delete();
		}
		
		//관련 파일정보 삭제
		filesDao.deleteFile(shopDto.getBusiness_file());
		filesDao.deleteFile(shopDto.getSale_file());
		filesDao.deleteFile(shopDto.getShop_img());
		
		// 매장정보삭제
		shopDao.deleteShop(shop_code);
		
		// 계정삭제
		memberDao.deleteShopMember(shop_code);
		
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
			// 주문내역이 있다면
			if(!orderList.isEmpty()) {
				// 구해온 주문내역을 추출하여 review테이블에서 점수조회후 더함
				int total_score=0; // 총점
				int review_count=0; //리뷰갯수
				for(OrdersDto ordersDto : orderList) {
					// 해당 주문에 대해 review작성이 되어 있다면 점수계산
					ReviewDto reviewDto = reviewDao.getReivewInfo(ordersDto.getNo());
					if(reviewDto != null) {
						total_score += 	reviewDto.getScore();
						review_count++;
					} 
				}
				double average_score = (double)total_score /(double)review_count; //평균점수
				double result_score = Math.round(average_score*10) / 10.0; // 소수점 첫째자리반올림
				shopListVO.setScore(result_score);
				shopListVO.setReview(review_count);
				shopListVO.setNo(shopDto.getNo());
				shopListVO.setShop_name(shopDto.getShop_name());
				shopListVO.setMin_price(shopDto.getMin_price());
				shopListVO.setMin_time(shopDto.getMin_time());
				shopListVO.setShop_img(shopDto.getShop_img());
			} else {
				shopListVO.setScore(0);
				shopListVO.setReview(0);
				shopListVO.setNo(shopDto.getNo());
				shopListVO.setShop_name(shopDto.getShop_name());
				shopListVO.setMin_price(shopDto.getMin_price());
				shopListVO.setMin_time(shopDto.getMin_time());
				shopListVO.setShop_img(shopDto.getShop_img());
			}
			shop_list.add(shopListVO);
		}
		return shop_list;
	}

	// shopVO정보
	@Override
	public ShopListVO shopInfoVO(int shop_code) {
		// 매장기본정보 조회
		ShopDto shopDto = shopDao.shopInfo(shop_code);
		ShopListVO shopListVO = new ShopListVO();
		
		// 리뷰 갯수 구하기
		// orders 테이블에서 List조회(orders.no로 review조회가능)
		List<OrdersDto> orderList = ordersDao.getShopOrderList(shopDto.getNo());
		// 주문내역이 있다면
		if(!orderList.isEmpty()) {
			// 구해온 주문내역을 추출하여 review테이블에서 점수조회후 더함
			int total_score=0; // 총점
			int review_count=0; //리뷰갯수
			for(OrdersDto ordersDto : orderList) {
				// 해당 주문에 대해 review작성이 되어 있다면 점수계산
				ReviewDto reviewDto = reviewDao.getReivewInfo(ordersDto.getNo());
				if(reviewDto != null) {
					total_score += 	reviewDto.getScore();
					review_count++;
				} 
			}
			double average_score = (double)total_score / (double)review_count; //평균점수
			double result_score = Math.round(average_score*10) / 10.0; // 소수점 첫째자리반올림
			shopListVO.setScore(result_score);
			shopListVO.setReview(review_count);
			shopListVO.setNo(shopDto.getNo());
			shopListVO.setShop_name(shopDto.getShop_name());
			shopListVO.setMin_price(shopDto.getMin_price());
			shopListVO.setMin_time(shopDto.getMin_time());
			shopListVO.setShop_img(shopDto.getShop_img());
		} else {
			shopListVO.setScore(0);
			shopListVO.setReview(0);
			shopListVO.setNo(shopDto.getNo());
			shopListVO.setShop_name(shopDto.getShop_name());
			shopListVO.setMin_price(shopDto.getMin_price());
			shopListVO.setMin_time(shopDto.getMin_time());
			shopListVO.setShop_img(shopDto.getShop_img());
		}	
		return shopListVO;
//
//		List<ShopDto> list = shopDao.ajaxPaging(start, end, cat_no);
//		List<ShopListVO> shop_list = new ArrayList<>();
//
//		for (ShopDto shopDto : list) {
//			ShopListVO shopListVO = new ShopListVO();
//			// 리뷰 갯수 구하기
//			// orders 테이블에서 List조회(orders.no로 review조회가능)
//			List<OrdersDto> orderList = ordersDao.getShopOrderList(shopDto.getNo());
//			// 구해온 주문내역을 추출하여 review테이블에서 점수조회후 더함
//			int count = 0; // 리뷰갯수
//			int total_score = 0; // 총점
//			for (OrdersDto ordersDto : orderList) {
//				// 해당 주문에 대해 review작성이 되어 있다면 점수계산
//				ReviewDto reviewDto = reviewDao.getReivewInfo(ordersDto.getNo());
//				if (reviewDto != null) {
//					total_score += reviewDto.getScore();
//					count++;
//				}
//			}
//			double average_score = total_score / count; //평균점수
//			double result_score = Math.round(average_score*10) / 10.0; // 소수점 첫째자리반올림

//		}
	}

	// 다운로드
	@Override
	public ResponseEntity<ByteArrayResource> download(int files_code) throws IOException {
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
											.contentType(MediaType.APPLICATION_OCTET_STREAM)
											.contentLength(data.length)
											.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+URLEncoder.encode(filesDto.getUpload_name(), "UTF-8"))
											.body(resource);
	}

}
