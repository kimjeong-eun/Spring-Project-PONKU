package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.zerock.domain.CustomOrderDTO;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CustomOrderController {

	
	@PostMapping("/orderCustom")
	public String orderCustom(String customimginput, String modelinput, String codeinput, String customcontent,
				String quantity , String totalprice , Model model) {
		//커스텀케이스 구매 페이지로 이동하는 컨트롤러 
		
		CustomOrderDTO dto = new CustomOrderDTO();
		
		model.addAttribute("dto", dto);
		
		log.info("================그냥컨트롤라====================");
		log.info(customimginput);
		log.info("====================================");
		
		return "/orderCustom";
	}
}
