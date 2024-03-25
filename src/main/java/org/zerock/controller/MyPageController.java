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
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MyPageController {
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	//마이페이지(기본페이지 - 현재는 회원정보 변경 페이지)
	@GetMapping("/myPage")
	public String myPage() {
		
		return "./myPage/myPage";
	}
	
	@GetMapping("/updatePw")
	public String update() {
		
		return "./myPage/updatePw";
	}
	
	//회원정보 변경
	@PostMapping("/update")
	public String updateMember(MemberVO member, String mode) {
		
		int result = service.updateMember(member, mode);
		log.info("===================================================================");
		log.info(mode);
		
		if(mode == "1") {
			return "./myPage/myPage"; //회원정보 변경
		} else if(mode == "2") {
			return "./myPage/updatePw"; //비밀번호 변경
		} else if(mode == "3") {
			return "./myPage/updateAdress"; //배송지 변경
		} else {
			return "./myPage/myPage"; //실패 시 마이페이지로 이동
		}
	}
	
	//회원탈퇴
		@GetMapping("/deleteMember")
		public String deleteMember() {
				
			return "./myPage/deleteMember";
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
