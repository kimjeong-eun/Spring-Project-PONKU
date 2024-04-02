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
import org.springframework.web.multipart.MultipartFile;
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
		
		log.info("등록 : " + board);
		
		if(board.getAttachList()!= null) {
			board.getAttachList().forEach( attach -> log.info(attach));
		}
		
		log.info("==============================");

		service.register(board);

		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/review/list";
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
		

	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list : " + cri);
		model.addAttribute("list", service.getListWithPaging(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);
		
		PageDTO pagedto = new PageDTO(cri, total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

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
		
		log.info("수정 :" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/review/list" + cri.getListLink();
	}
	
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri, String writer) {

		log.info("==============================");
		log.info("삭제 : " + bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if (service.remove(bno)) {
			
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/review/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList" , produces = MediaType.APPLICATION_JSON_VALUE )
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
	
		log.info("파일 첨부 리스트 :" + bno);
		
		return new ResponseEntity<List<BoardAttachVO>>(service.getAttachList(bno),HttpStatus.OK);
		
		
	}
	
	

	private void deleteFiles(List<BoardAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}

		attachList.forEach(attach -> {

			try {

				Path file = Paths.get(
						"c:\\upload\\" + attach.getUploadpath() + "\\" + attach.getUuid() + "_" + attach.getFilename());

				Files.deleteIfExists(file); // 파일이 존재한다면 삭제!

				if (Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("c:\\upload\\" + attach.getUploadpath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFilename());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}

		});

	}
		
}
	
	
