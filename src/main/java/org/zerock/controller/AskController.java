package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.AskListVO;
import org.zerock.domain.Criteria;
import org.zerock.service.AskListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/ask/")
@RestController
@Log4j2
@AllArgsConstructor
public class AskController {

	private AskListService service;

	@GetMapping(value = "/main/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<AskListVO>> getList(@PathVariable("page") int page) {

		Criteria cri = new Criteria(page, 10);

		log.info("cri:" + cri);

		return new ResponseEntity<>(service.getListWithPaging(cri), HttpStatus.OK);
	}

	@GetMapping("/main")
	public void main(Model model) {
		log.info("main 메서드 실행중 ... ");
		model.addAttribute(service.getList());
	}

	@GetMapping("/lock")
	public void lock() {
		log.info("lock 메서드 실행중 ... ");
	}

	@GetMapping("/write")
	public void write() {

	}

	@GetMapping("/get")
	public void get() {

	}

}
