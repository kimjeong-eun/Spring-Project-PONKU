package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/review/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {

	    
	    log.info("==============================");
	    
	    // 등록하려는 게시물 정보 출력
	    log.info("등록 : " + board);
	    
	    // 첨부 파일이 존재하는 경우, 각 첨부 파일 정보 출력
	    if(board.getAttachList()!= null) {
	        board.getAttachList().forEach( attach -> log.info(attach));
	    }
	    
	    // 로그 종료를 나타내는 정보 출력
	    log.info("==============================");

	    // 게시물 등록 서비스 호출
	    service.register(board);

	    // 등록 결과를 리다이렉트 속성에 추가
	    rttr.addFlashAttribute("result", board.getBno());

	    // 게시물 목록 페이지로 리다이렉트
	    return "redirect:/review/list";
	}

	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
		

	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

	    // 현재 페이지 정보 출력
	    log.info("list : " + cri);
	    
	    // 현재 페이지에 해당하는 게시물 목록을 모델에 추가
	    model.addAttribute("list", service.getListWithPaging(cri));

	    // 전체 게시물 수 조회
	    int total = service.getTotal(cri);

	    // 전체 게시물 수 출력
	    log.info("total: " + total);
	    
	    // 페이지 정보를 기반으로 페이지 DTO 생성
	    PageDTO pageDto = new PageDTO(cri, total);

	    // 페이지 DTO를 모델에 추가
	    model.addAttribute("pageMaker", pageDto);
	}



	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) {

		log.info("조회 or 수정" + bno);
		model.addAttribute("board", service.get(bno));
	}


	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
	    
	    
	    log.info("==============================");
	    
	    // 수정하려는 게시물 정보 출력
	    log.info("수정 :" + board);

	    // 게시물 수정이 성공한 경우 리다이렉트 속성에 성공 메시지 추가
	    if (service.modify(board)) {
	        rttr.addFlashAttribute("result", "success");
	    }

	    // 수정된 게시물이 포함된 페이지로 리다이렉트
	    return "redirect:/review/list" + cri.getListLink();
	}

	
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri, String writer) {

	    
	    log.info("==============================");
	    // 삭제하려는 게시물 번호 출력
	    log.info("삭제 : " + bno);
	    
	    // 삭제할 게시물의 첨부 파일 목록 조회
	    List<BoardAttachVO> attachList = service.getAttachList(bno);
	   
	    // 게시물 삭제가 성공한 경우
	    if (service.remove(bno)) {
	        // 삭제된 게시물의 첨부 파일 삭제
	        deleteFiles(attachList);
	        // 삭제 성공 메시지를 리다이렉트 속성에 추가
	        rttr.addFlashAttribute("result", "success");
	    }

	    // 삭제 후 게시물이 포함된 페이지로 리다이렉트
	    return "redirect:/review/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {

	    // 로그에 해당 게시물 번호 출력
	    log.info("파일 첨부 리스트 :" + bno);
	    
	    // 해당 게시물의 첨부 파일 리스트 조회
	    List<BoardAttachVO> attachList = service.getAttachList(bno);
	    
	    // 조회된 첨부 파일 리스트와 상태 코드 200(OK)를 포함한 ResponseEntity 반환
	    return new ResponseEntity<>(attachList, HttpStatus.OK);
	}


	private void deleteFiles(List<BoardAttachVO> attachList) {
	    // 첨부 파일 리스트가 null이거나 비어있는 경우, 아무 작업도 수행하지 않음
	    if (attachList == null || attachList.size() == 0) {
	        return;
	    }

	    // 첨부 파일 리스트를 순회하면서 파일 삭제 작업 수행
	    attachList.forEach(attach -> {
	        try {
	            // 삭제할 원본 파일 경로
	            Path file = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
	            // 파일이 존재하는 경우 삭제
	            Files.deleteIfExists(file);

	            // 삭제한 파일이 이미지인 경우 썸네일도 삭제
	            if (Files.probeContentType(file).startsWith("image")) {
	                Path thumbNail = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
	                Files.delete(thumbNail);
	            }
	        } catch (Exception e) {
	            // 파일 삭제 도중 예외 발생 시 예외 처리
	            // TODO: 예외 처리 로직 추가
	        }
	    });
	}

		
}
	
	
