package org.zerock.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.LoginService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MyPageController {
	@Setter(onMethod_ = @Autowired)
	private LoginService service;
	
	@Setter(onMethod_ = @Autowired )
	private LoginService loginService ; //로그인을 위한 매퍼 서비스 객체
	
	//마이페이지 + 회원정보변경
	@GetMapping("/myPage")
	public String myPage() {
		
		return "./myPage/myPage";
	}
	
	//회원탈퇴
	@GetMapping("/deleteMember")
	public String deleteMember() {
			
		return "./myPage/deleteMember";
	}
		
	//비밀번호 변경
	@GetMapping("/updatePw")
	public String updatePw() {
		
		return "./myPage/updatePw";
	}
	
	//나의 주문관리
	@GetMapping("/myOrder")
	public String myOrder() {
		
		return "./myPage/myOrder";
	}
	
	//나의 활동관리
	@GetMapping("/myPlace")
	public String myPlace() {
		
		return "./myPage/myPlay";
	}
	
	
}
