package org.zerock.controller;

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
		produces = {MediaType.TEXT_PLAIN_VALUE} )
	public ResponseEntity<String> validId(String useremail){
		//이메일로 아이디를 찾는 메서드
		
		MemberVO vo = loginService.findId(useremail);
		
		String str = vo.getUserid() +"/"+vo.getEmail();
		
		return new ResponseEntity<String>(str,HttpStatus.OK); 
	}
	
}
