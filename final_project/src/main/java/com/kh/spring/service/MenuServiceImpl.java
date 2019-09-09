package com.kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.entity.CategoryDto;
import com.kh.spring.entity.FilesDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.entity.MenuDto;
import com.kh.spring.entity.ShopDto;
import com.kh.spring.entity.SubMenuDto;
import com.kh.spring.repository.CategoryDao;
import com.kh.spring.repository.FilesDao;
import com.kh.spring.repository.MemberDao;
import com.kh.spring.repository.MenuDao;
import com.kh.spring.repository.ShopDao;
import com.kh.spring.vo.CheckMenuVO;
import com.kh.spring.vo.CheckMenuVOList;
import com.kh.spring.vo.MenuRegistVO;
import com.kh.spring.vo.RadioMenuVO;
import com.kh.spring.vo.RadioMenuVOList;
import com.kh.spring.vo.ShopMenuVO;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private FilesDao filesDao;
	@Autowired
	private CategoryDao categoryDao;
	
	// super_admin 메뉴관리 목록
	@Override
	public List<ShopMenuVO> list() {
		List<MenuDto> list = menuDao.menuList();
		List<ShopMenuVO> menu_list = new ArrayList<>();
		// 내용 다시 세팅
		for(MenuDto menuDto : list) {
			//메뉴 카테고리
			CategoryDto categoryDto = menuDao.getCategoryInfo(menuDto.getMenu_category());
			// 매장이름
			ShopDto shopDto = shopDao.shopInfo(menuDto.getShop_code());
			String time = shopDto.getRegist_date().substring(0, 16);
			ShopMenuVO shopVO = ShopMenuVO.builder().no(menuDto.getNo())
																					.name(menuDto.getName())
																					.menu_category(categoryDto.getName())
																					.shop_name(shopDto.getShop_name())
																					.apply_status(menuDto.getApply_status())
																					.sale_status(menuDto.getSale_status())
																					.regist_date(time)
																					.build();
			menu_list.add(shopVO);
		}
		return menu_list;
	}
	
	//shop_admin 메뉴관리 목록
	@Override
	public List<ShopMenuVO> shopMenuList(int member_code) {
		// member_code로 회원정보 구하기
		MemberDto memberDto = memberDao.getInfo(member_code);
		// shop_code로 menu정보 구하기
		List<MenuDto> list = menuDao.shopMenuList(memberDto.getShop_code());
		List<ShopMenuVO> menu_list = new ArrayList<>();
		// 내용 다시 세팅
		for(MenuDto menuDto : list) {
			//메뉴 카테고리
			CategoryDto categoryDto = menuDao.getCategoryInfo(menuDto.getMenu_category());
			// 매장이름
			ShopDto shopDto = shopDao.shopInfo(menuDto.getShop_code());
			String time = shopDto.getRegist_date().substring(0, 16);
			ShopMenuVO shopVO = ShopMenuVO.builder().no(menuDto.getNo())
																					.name(menuDto.getName())
																					.menu_category(categoryDto.getName())
																					.shop_name(shopDto.getShop_name())
																					.apply_status(menuDto.getApply_status())
																					.sale_status(menuDto.getSale_status())
																					.regist_date(time)
																					.build();
			menu_list.add(shopVO);
		}
		return menu_list;
	}

	// 메뉴등록
	@Override
	public void menuRegist(MenuRegistVO menuRegistVO, RadioMenuVOList radioMenuVOList, CheckMenuVOList checkMenuVOList) throws IllegalStateException, IOException {
		
		// 메뉴 시퀀스 생성
		int menu_code = menuDao.getMenuSeq();
		
		// 메뉴카테고리 코드 조회(메뉴카테고리 이름과  매장코드로)
		int menu_category = menuDao.getMenuCategoryCode(menuRegistVO);
		
		//기본메뉴정보 등록
		MenuDto menuDto = MenuDto.builder()
											.no(menu_code)
											.shop_code(menuRegistVO.getShop_code())
											.menu_category(menu_category)
											.name(menuRegistVO.getMenu_name())
											.price(menuRegistVO.getMenu_price()).build();
		menuDao.registMenuInfo(menuDto);
		
		// 메뉴목록 이미지 등록
		if(!menuRegistVO.getMenu_list_img().isEmpty()) {
			// 파일 시퀀스 구하기
			int files_seq = filesDao.getFileSeq();
			
			MultipartFile file = menuRegistVO.getMenu_list_img();
			String save_name = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
			// files 테이블에 등록
			categoryDao.fileRegist(FilesDto.builder()
					.no(files_seq)
					.file_type(file.getContentType())
					.upload_name(file.getOriginalFilename())
					.save_name(save_name)
					.file_size(file.getSize()).build()
			);
			
			// 메뉴 테이블에 목록 이미지코드 저장
			menuDao.updateListImg(files_seq,menu_code);
			
			// 실제 파일 저장 코드
			File target = new File("D:/upload/kh15", save_name);
			file.transferTo(target); //물리적 위치에 저장하는 명령
		}
		
		// 메뉴상세 이미지 등록
		if(!menuRegistVO.getMenu_detail_img().isEmpty()) {
			// 파일 시퀀스 구하기
			int files_seq = filesDao.getFileSeq();
			
			MultipartFile file = menuRegistVO.getMenu_detail_img();
			String save_name = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
			// files 테이블에 등록
			categoryDao.fileRegist(FilesDto.builder()
					.no(files_seq)
					.file_type(file.getContentType())
					.upload_name(file.getOriginalFilename())
					.save_name(save_name)
					.file_size(file.getSize()).build()
			);
			
			// 메뉴 테이블에 상세 이미지코드 저장
			menuDao.updateDetailImg(files_seq,menu_code);
			
			// 실제 파일 저장 코드
			File target = new File("D:/upload/kh15", save_name);
			file.transferTo(target); //물리적 위치에 저장하는 명령
		}
		
		// 서브메뉴 등록하기
		// 필수메뉴 등록하기
		List<RadioMenuVO> radioList = radioMenuVOList.getRadioMenuList();
		for(RadioMenuVO radioMenuVO : radioList) {
			//필수메뉴가 있다면 등록한다.
			if(!radioList.isEmpty() || radioList != null) {
				SubMenuDto subMenuDto = SubMenuDto.builder()
															.shop_code(menuRegistVO.getShop_code())
															.menu_code(menu_code)
															.title(menuRegistVO.getRadio_title())
															.name(radioMenuVO.getRadio_name())
															.price(radioMenuVO.getRadio_price()).build();
				menuDao.registRadioSubMenu(subMenuDto);
			}
		}
		
		// 선택메뉴 등록하기
		List<CheckMenuVO> checkList = checkMenuVOList.getCheckMenuList();
		for(CheckMenuVO checkMenuVO : checkList) {
			//선택메뉴가 있다면 등록한다.
			if(!checkList.isEmpty() || checkList != null) {
				SubMenuDto subMenuDto = SubMenuDto.builder()
															.shop_code(menuRegistVO.getShop_code())
															.menu_code(menu_code)
															.title(menuRegistVO.getRadio_title())
															.name(checkMenuVO.getCheck_name())
															.price(checkMenuVO.getCheck_price()).build();
				menuDao.registCheckSubMenu(subMenuDto);
			}
		}
	}
	
}
