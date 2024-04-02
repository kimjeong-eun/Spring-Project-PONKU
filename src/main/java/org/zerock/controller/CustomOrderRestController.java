package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CustomImgDTO;
import org.zerock.domain.CustomOrderDTO;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@RestController
@Log4j2
public class CustomOrderRestController {

	
	@PreAuthorize("permitAll")
	@PostMapping(value = "/customOrder", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE , MediaType.APPLICATION_JSON_VALUE , MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<CustomImgDTO> customOrder(MultipartFile file){
		//커스텀 이미지를 서버에 저장하는 컨트롤러 
				
		log.info("====================================");
		log.info(file);
		log.info(file.getContentType());
		log.info("====================================");
		
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = "\\custom";
		
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder
		
		CustomImgDTO customImg = new CustomImgDTO();
		
		String tmpCustomImgPath = file.getOriginalFilename();
		
		tmpCustomImgPath = tmpCustomImgPath.substring(tmpCustomImgPath.lastIndexOf("\\")+1);
		
		customImg.setFileName(tmpCustomImgPath); //파일이름
		
		UUID uuid = UUID.randomUUID(); //랜덤 uuid
		
		tmpCustomImgPath = uuid.toString()+"_"+tmpCustomImgPath+".png"; //저장경로
		
		
		try {
			File tmpSaveFile = new File(uploadPath,tmpCustomImgPath);
			file.transferTo(tmpSaveFile);
			
			customImg.setUuid(uuid.toString()); 
			customImg.setUploadPath(uploadFolderPath);
			
			// check image type file
			if (checkImageType(tmpSaveFile)) {

				customImg.setImage(true);

				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + tmpCustomImgPath));

				Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 100, 100);

				thumbnail.close();
			}
			
		} catch (IllegalStateException | IOException e) {
		
			e.printStackTrace();
		}
		
			log.info("====================================");
			log.info(tmpCustomImgPath);
			log.info("====================================");
		
		return new ResponseEntity<CustomImgDTO>(customImg ,HttpStatus.OK);
		
	}
	
	private String getFolder() {
		//폴더만들기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
	
	
	private boolean checkImageType(File file) {
		//이미지파일 체크
		try {
			
			String contentType = Files.probeContentType(file.toPath());
	
			return contentType.startsWith("image");
	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	//할인코드 적용 컨트롤러
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/discount")
	public ResponseEntity<String> getDiscount(String discountCode){
		
		String result="wrong";

		if(discountCode.equals("3조최고")) {
			
			result="allFree";
			
		}

		return new ResponseEntity<String>(result , HttpStatus.OK);
	}

}
