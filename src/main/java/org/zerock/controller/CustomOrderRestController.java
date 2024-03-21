package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CustomOrderDTO;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class CustomOrderRestController {

	
	@PreAuthorize("isAnonymous()")
	@PostMapping(value = "/customOrder", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE , MediaType.APPLICATION_JSON_VALUE , MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<String> customOrder(MultipartFile file){
		
		
		
		log.info("====================================");
		log.info(file);
		log.info(file.getContentType());
		log.info("====================================");

		

		
		return new ResponseEntity<String>("filePathTest",HttpStatus.OK);

	}
		
}
