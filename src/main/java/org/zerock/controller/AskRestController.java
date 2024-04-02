package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.AskListAttachVO;
import org.zerock.domain.AskListLockDTO;
import org.zerock.domain.AskListPageDTO;
import org.zerock.domain.AskListVO;
import org.zerock.domain.Criteria;
import org.zerock.service.AskListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/ask/")
@RestController // RestController는 순수한 데이터만 보낼 수 있어서 페이지를 볼 수 있게 하는 페이지 분기는 담당하지 못한다 !(그냥
				// controller가 있어야함)
@Log4j2
@AllArgsConstructor
public class AskRestController {

	private AskListService service;

	@GetMapping(value = "/main/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<AskListPageDTO> getListWithPaging(@PathVariable("page") int page, Criteria cri) {
		
		cri.setPageNum(page);
		
		log.info(cri);

		return new ResponseEntity<>(service.getListWithPaging(cri), HttpStatus.OK);
	} 

	@PostMapping(value = "/write", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> write(@RequestBody AskListVO vo) {
		log.info("attachList : " + vo.getAttachList());
		if(vo.getAttachList().size() > 0) { // 첨부파일이 있으면
			vo.setAsk_list_attach(true); // ask_list_attach = 1
		}
		log.info("AskListVO : " + vo);
		service.register(vo);

		return new ResponseEntity<>("게시물 작성 성공", HttpStatus.OK);
	}

	@DeleteMapping("/{ask_list_no}") // @RequestBody AskListVO vo,
	public ResponseEntity<String> remove(@PathVariable("ask_list_no") Long ask_list_no) {

		log.info("ask_list_no : " + ask_list_no);

		/* log.info("replyer: " + vo.getReplyer()); */ // 작성자 확인할 때(시큐리티)

		return service.remove(ask_list_no) ? new ResponseEntity<>("게시물 삭제 성공", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{ask_list_no}", consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody AskListVO vo, @PathVariable("ask_list_no") Long ask_list_no) {

		log.info("ask_list_no : " + ask_list_no);
		log.info("modify: " + vo);

		return service.modify(vo) ? new ResponseEntity<>("게시물 수정 성공", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	@PostMapping(value = "/lock", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> passwordCheck(@RequestBody AskListLockDTO dto) {
		log.info("passwordCheck 입력받은 pw : " + dto.getPassword());
		log.info("lock.jsp에서 넘겨받은 no : " + dto.getAsk_list_no());
		boolean ask_list_lock_password = service.askPassword(dto.getAsk_list_no(), dto.getPassword());
		log.info("패스워드 일치 여부 : " + ask_list_lock_password);
		return ask_list_lock_password ? new ResponseEntity<>("true", HttpStatus.OK)
				: new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
