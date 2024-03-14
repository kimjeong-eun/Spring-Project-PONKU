package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class LoginController {

	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
			//로그인페이지로 이동하는 컨트롤러
		
		
		
	}
	
	
}
