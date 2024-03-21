package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CoommonController {

	@GetMapping("/custompage")
	public String gotoCustom() {
		
		
		return "/customview";
	}
	
	
}
