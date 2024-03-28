package org.zerock.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
import org.zerock.security.domain.CustomUser;
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
	
	//회원정보 변경
	@GetMapping("/updateMember")
	public String updateMember() {
		
		return "./myPage/myPage";
	}
	
	@PostMapping("/updateMember")
	public String updateMember(MemberVO member, @AuthenticationPrincipal CustomUser customUser) {
		
		int result = service.updateMember(member);
		log.debug(customUser.getUsername());
//		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		return "./myPage/myPage"; //회원정보 변경
	}
	
	//비밀번호 변경
	@GetMapping("/updatePw")
	public String updatePw() {
		
		return "./myPage/updatePw";
	}
	
	@PostMapping("/updatePw")
	public String updatePw(MemberVO member) {
		
		int result = service.updatePw(member);
		return "./myPage/myPage"; //회원정보 변경
	}
	
	//배송지 변경
	@GetMapping("/updateAddress")
	public String updateAddress() {
		
		return "./myPage/updateAddress";
	}
	
	//배송지 변경 팝업
	@GetMapping("/popupAddress")
	public String popupAddress() {
		
		return "./myPage/popupAddress";
	}
	
	@PostMapping("/popupAddress")
	public String popupAddress(MemberVO member) {
		
		int result = service.updateAddress(member);
		return "./myPage/updateAddress"; 	}
	
	//배송지 우편번호 찾기
	@GetMapping("/popupInputAddress")
	public String popupInputAddress() {
		
		return "./myPage/popupInputAddress";
	}
	
	@PostMapping("/popupInputAddress")
	public String popupInputAddress(MemberVO member) {
		
		int result = service.updateAddress(member);
		return "./myPage/updateAddress"; 	}
	
	//회원탈퇴
	@GetMapping("/deleteMember")
	public String deleteMember() {
			
		return "./myPage/deleteMember";
	}
	//회원탈퇴
	@PostMapping("/deleteMember")
	public String deleteMember(MemberVO member) {
		
		int result = service.deleteMember(member);
		return "./myPage/myPage"; //회원정보 변경
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
