package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class GoodsController {
	@GetMapping("/goodsList") //상품구매
	public void getList() {
		log.info("목록 페이지 접속=====================");
	}
}

