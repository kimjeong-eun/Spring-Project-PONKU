package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/replies/")
@RestController
@Log4j2
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE} )
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
		log.info("ReplyVO:" + vo);
		
		int insertCount = service.register(vo);
		
		log.info("댓글 수 :" + insertCount);
	
		return insertCount == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		//삼항연산자로 처리
	}
	
	@GetMapping(value = "/{id}/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("id") Long id) {

		log.info("조회 : " + id);

		return new ResponseEntity<>(service.get(id), HttpStatus.OK);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value = "/{id}", consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("id") Long id) {

		log.info("id : " + id);
		log.info("수정 : " + vo);

		return service.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	@GetMapping(value = "/pages/{id}/{page}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("id") Long id) {

		Criteria cri = new Criteria(page, 10);

		log.info("댓글 목록 조회 : " +id);

		log.info("cri:" + cri);

		return new ResponseEntity<>(service.getListPage(cri, id), HttpStatus.OK);
	}

	
	
	
	
	

}
