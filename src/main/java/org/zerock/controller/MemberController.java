package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService service;
	
	@PostMapping("/join")
	@PreAuthorize("isAuthenticated()")
	public String join(MemberVO member, RedirectAttributes rttr) {

		log.info("==========================");

		log.info("join: " + member);

		log.info("==========================");

		service.join(member);

		rttr.addFlashAttribute("result");
		
		return "redirect:/member/join";
	}
	
}
