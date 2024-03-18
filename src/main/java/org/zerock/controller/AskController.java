package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/ask/*")
@AllArgsConstructor
public class AskController {
	
	@GetMapping("/main")
	public void main() {
		log.info("main 메서드 실행중 ... ");
	}
	
	@GetMapping("/lock")
	public void lock() {
		log.info("lock 메서드 실행중 ... ");
	}
	
	@GetMapping("/rite")
	public void rite() {
		
	}
	
	@GetMapping("/get")
	public void get() {
		
	}
	
}
