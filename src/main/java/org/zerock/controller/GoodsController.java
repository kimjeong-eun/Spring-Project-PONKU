package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.GoodsVO;
import org.zerock.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/goods/*")
@AllArgsConstructor // service에 대해 의존적
public class GoodsController {

	private GoodsService service;

	@GetMapping("goodsList")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}

	@GetMapping("/register")
	@PreAuthorize("permitAll")
	public void register() {
	}

	@PostMapping("/register")
	@PreAuthorize("permitAll")
	public String register(GoodsVO goods, RedirectAttributes rttr) {

		log.info("register: " + goods);
		service.register(goods);
		rttr.addFlashAttribute("result", goods.getGno()); // 게시물 번호를 일회성 저장

		return "redirect:/goods/goodsList"; // 목록 화면 이동
	}

	@GetMapping("/get")
	// 보다 명시적 처리
	public void get(@RequestParam("gno") Long gno, Model model) {

		log.info("/get");
		model.addAttribute("goods", service.get(gno)); // 모델에 번호 추가
	}

	@PostMapping("/modify")
	public String modify(GoodsVO goods, RedirectAttributes rttr) {
		log.info("modify: " + goods);

		if (service.modify(goods)) { // 수정한 값 T -> 성공
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/goods/goodsList";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("gno") Long gno, RedirectAttributes rttr) {
		log.info("remove..." + gno);

		if (service.remove(gno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/goods/goodsList";
	}
}
