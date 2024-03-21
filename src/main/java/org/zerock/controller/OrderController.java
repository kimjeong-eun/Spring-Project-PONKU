package org.zerock.controller;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CustomOrderDTO;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class OrderController {

	@PreAuthorize("isAnonymous()")
	@ResponseBody
	@RequestMapping(value = "/orderCustom", method = {RequestMethod.POST})
	public void orderCustom( String filePath ) {
		
		log.info("여기는 그냥 컨트롤러 ~~~~~~~~~~~~~~~~~~~~~~~~~~");
		/*
		 * log.info(customorder.getFilePath());
		 * log.info(customorder.getCustomcontent());
		 * 
		 * rttr.addFlashAttribute("customorder", customorder);
		 */
		
		log.info(filePath);
		
	}
	
	
	
}
