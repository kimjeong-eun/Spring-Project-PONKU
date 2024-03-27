package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.GoodsVO;
import org.zerock.service.GoodsService;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/goods/*")
@Data
public class GoodsController {

	@Setter(onMethod_ = { @Autowired })
	private GoodsService service;

	@GetMapping({ "/get", "/modify" }) // GetMapping, PostMapping은 URL을 배열로 처리할 수 있으므로, 하나의 메서드로 여러 URL 처리
	public void get(@RequestParam("gno") String gno, Model model) {

		log.info("/get or /modify");
		model.addAttribute("goods", service.get(gno)); // 모델에 번호 추가
	}

	//방화벽 코드 인터넷에서 퍼옴
		/*
		@Bean
		public HttpFirewall defaultHttpFirewall() {
			return new DefaultHttpFirewall();
		}
		
		public void configure(WebSecurity web) throws Exception {
			web.httpFirewall(defaultHttpFirewall());
		}
		*/
	
	/* 목록 불러오기 */
	@GetMapping("/goodsList")
	@PreAuthorize("permitAll")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}

	/* 페이징 처리 후 목록 불러오기 */
	//@GetMapping("/goodsList")
	//@PreAuthorize("permitAll")
	//public void list(Criteria cri, Model model) {
	//	log.info("list" + cri);
	//	model.addAttribute("list", service.getList(cri));
	//	model.addAttribute("pageMaker", new PageDTO(cri, 123));
	//}

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

	@PostMapping("/modify")
	public String modify(GoodsVO goods, RedirectAttributes rttr) {
		log.info("modify: " + goods);

		if (service.modify(goods)) { // 수정한 값 T -> 성공
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/goods/goodsList";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("gno") String gno, RedirectAttributes rttr) {
		log.info("remove......" + gno);

		if (service.remove(gno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/goods/goodsList";
	}
}
