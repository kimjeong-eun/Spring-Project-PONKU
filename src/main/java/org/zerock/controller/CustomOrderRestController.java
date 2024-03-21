package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CustomOrderDTO;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class CustomOrderRestController {

	
	@PreAuthorize("isAnonymous()")
	@PostMapping(value = "/customOrder", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE , MediaType.APPLICATION_JSON_VALUE , MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<CustomOrderDTO> customOrder(MultipartFile file , String modelinput , String codeinput, String customcontent, String quantity, String totalprice, RedirectAttributes rttr ){
		
		CustomOrderDTO customorder = new CustomOrderDTO();
		customorder.setCodeinput(codeinput);
		customorder.setCustomcontent(customcontent);
		customorder.setModelinput(modelinput);
		customorder.setQuantity(quantity);
		customorder.setTotalprice(totalprice);
		customorder.setFilePath("test");
		
		log.info("===========================================");
		log.info(customorder.getCodeinput());
		log.info(customorder.getCustomcontent());
		log.info(customorder.getModelinput());
		log.info(customorder.getQuantity());
		log.info(customorder.getTotalprice());
		log.info(file);
		log.info(file.getSize());
		log.info(file.getOriginalFilename());
		log.info(file.getName());
		log.info("===========================================");
		
		return new ResponseEntity<CustomOrderDTO>( customorder ,HttpStatus.OK );

	}
		
}
