package org.zerock.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.MemberVO;
import org.zerock.service.LoginService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class LoginRestController {
		//로그인/회원 관련 rest컨트롤러
	
	@Setter(onMethod_ = @Autowired )
	LoginService loginService;
	
	@PostMapping(value = "/validId",
		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<MemberVO> validId(String useremail,String username){
		//이메일과 이름으로 아이디를 찾는 컨트롤라
		
		MemberVO vo = loginService.findId(useremail ,username);
		
		SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd");
		sdt.format(vo.getEnroll_date());
		
		
		
		log.info("============================");
		log.info(sdt.format(vo.getEnroll_date()));
		log.info("============================");
		
		return new ResponseEntity<MemberVO>(vo,HttpStatus.OK); 
	}
	
	
	@PostMapping(value = "/validInfo",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
		public ResponseEntity<MemberVO> validInfo(String useremail,String userId){
			//이메일과 아이디로  pw를 찾는(초기화 하는 메서드)
			
			MemberVO vo = loginService.findPw(useremail ,userId);
			
			SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd");
			sdt.format(vo.getEnroll_date());
			
			
			
			log.info("============================");
			log.info(sdt.format(vo.getEnroll_date()));
			log.info("============================");
			
			return new ResponseEntity<MemberVO>(vo,HttpStatus.OK); 
		}
		
	
}
