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
import org.springframework.web.bind.annotation.RestController;
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
		//cri.setAmount(10);
		
		log.info(cri);

		return new ResponseEntity<>(service.getListWithPaging(cri), HttpStatus.OK);
	} 

	@PostMapping(value = "/write", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> write(@RequestBody AskListVO vo) {
		log.info("AskListVO : " + vo);
		int insertCount = service.register(vo);
		log.info("insert 개수 : " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("게시물 작성 성공", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
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

}
