package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;
import org.zerock.service.GoodsService;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j2
@RequestMapping("/goods/*")
public class GoodsUploadController {

	private GoodsService service;
	
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
	
	// 오늘 날짜 경로를 문자열로 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// Date date = new Date();
		String str = sdf.format(new Date()); // Date를 포맷에 맞춘 문자열 생성

		return str.replace("-", File.separator); // -를 /로 교체
	}

	// 파일이 이미지 타입인가 검사
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info("확장자================" + contentType);

			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("에이젝스 파일 업로드폼 이동!");
	}

	// 업로드폼에서 submit 시 날짜로 된 폴더, 고유한 파일명의 파일 생성
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List> uploadAjaxPost(MultipartFile[] uploadFile) {

		List<AttachFileDTO> list = new ArrayList<>(); // 파일객체로 만든 리스트
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder(); // 경로

		// 폴더(경로) 생성
		File uploadPath = new File(uploadFolder, uploadFolderPath); // K, V(문자열) 생성
		log.info("upload path: " + uploadPath);

		if (uploadPath.exists() == false) { // 폴더가 없을 경우
			uploadPath.mkdirs(); // 필요한 상위 폴더(/)까지 한 번에 생성
		} // make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();

			// 파일명 얻어옴
			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			// \\의 마지막 인덱스 + 1부터 (문자열로) 자름
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID(); // 임의의 값 생성
			uploadFileName = uuid.toString() + "_" + uploadFileName; // 난수 + _ + 원래 이름

			try {
				// 경로, 파일명에 따라 파일 생성
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); // transferTo(): 실제 업로드

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);

				if (checkImageType(saveFile)) { // 생성한 파일이 이미지 파일(false)이면

					attachDTO.setImage(true); // 여기서는 T를 주자

					// 파일 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					// 100x100 섬네일 제작
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}

				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			} // catch
		} // for
			// return new ResponseEntity<>(list, HttpStatus.OK);
		return new ResponseEntity<>(list, HttpStatus.OK);
	} // uploadAjaxPost()
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		
		log.info("fileName" + fileName);
		
		File file = new File("c:\\upload\\" + fileName); //경로가 포함된 문자열
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null; //byte[]로 이미지 파일의 데이터 전송
		
		try {
			HttpHeaders header = new HttpHeaders(); //framework로 import
			
			header.add("Content-Type", Files.probeContentType(file.toPath())); //파일 종류에 따라 달라지는 MIME 타입 데이터를 적절하게 
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK); //헤더 메시지 추가
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("deleteFile: " + fileName);
		
		File file;
		
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			//if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				log.info("largeFileName: " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}// GoodsUploadController
