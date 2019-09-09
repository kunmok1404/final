package com.kh.spring.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.spring.entity.CertDto;
import com.kh.spring.entity.MemberDto;
import com.kh.spring.repository.CertDao;

@Service
public class EmailServiceImpl implements EmailService{
	
	//설정파일에 등록해둔 JavaMailSender 객체를 연결
	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private RandomStringService randomStringService;
	
	@Autowired
	private CertDao certDao;
	
	//아이디 찾기 이메일로 아이디 전송
	@Override
	public void sendCertificationid(String email) throws MessagingException {
		//member테이블 DB에서 id 가져오기
		//가져온 id 이메일로 보내기
		//이메일 전송
		MimeMessage mail = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mail, false, "UTF-8");
		helper.setFrom("dyi000908@gmail.com");
		helper.setTo(email+"@gmail.com");
		helper.setSubject("뭐먹지 아이디 찾기 메일입니다.");
		helper.setText("${memberDto.id}", true);
		sender.send(mail);
		
		
	}
	

	//비밀번호 찾기 이메일로 인증번호+링크 전송
	@Override
	public void sendCertificationpw(String email) throws MessagingException {
		//인증번호 생성(128자리)
		String no = randomStringService.generate(128);
		
		//DB저장
		certDao.insert(CertDto.builder().who(email).no(no).build());
		
		//이메일 전송
		MimeMessage mail = sender.createMimeMessage();
		MimeMessageHelper helper = 
							new MimeMessageHelper(mail, false, "UTF-8");
		
		helper.setFrom("뭐먹지?");
		helper.setTo(email);
		helper.setSubject("비밀번호 변경 메일입니다");
		String address = ServletUriComponentsBuilder
										.fromCurrentContextPath()
										.port(8080)
										.path("/member/new_pw")
										.queryParam("email",  email)
										.queryParam("no", no)
										.toUriString();
		helper.setText("<h3><a href='"+address+"'>이곳을 눌러 변경을 완료하세요</a></h3>", true);
		sender.send(mail);
		
	}


	//이메일 실험
//	@Override
//	public void find_pw(MemberDto memberDto) throws MessagingException {
//		//인증번호 생성
//		String no = randomStringService.generate(128);
//		String email = memberDto.getEmail()+"@"+memberDto.getEmail_address();
//		
//		
//		//DB저장
//		CertDto certDto = CertDto.builder().who(memberDto.getId()).no(no).build();
//		certDao.insert(certDto);
//		
//		//이메일 전송
//		MimeMessage mail = sender.createMimeMessage();
//		MimeMessageHelper helper = 
//				new MimeMessageHelper(mail, false, "UTF-8");
//		
//		helper.setFrom("뭐먹지");
//		helper.setTo(email);
//		helper.setSubject("뭐먹지 비빌번호 변경 메일 입니다.");
//		String address = ServletUriComponentsBuilder
//							.fromCurrentContextPath();
//							.port(8080)
//							.path("/member/new_pw")
//							.queryParam("no", memberDto.getNo())
//							.queryParam("no", no)
//							.toUriString();
//		
//		helper.setText("<h3><a href='"+address+"'>이곳을 눌러 변경을 완료하세요</a></h3>", true);
//		sender.send(mail);
//	}


}
