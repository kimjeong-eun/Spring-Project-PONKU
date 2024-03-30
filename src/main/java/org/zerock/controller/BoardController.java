package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	public void get(@RequestParam("bno") Long bno, Model model) {

		log.info("조회 or 수정");
		model.addAttribute("board", service.get(bno));
	}


	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		
		log.info("==============================");
		
		log.info("수정 :" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/review/list" + cri.getListLink();
	}
	
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("==============================");
		
		log.info("삭제 : " + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/review/list" + cri.getListLink();
	}

}
