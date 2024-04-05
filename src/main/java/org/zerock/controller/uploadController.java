package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j2
public class uploadController {
	

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

	    // 파일 업로드 폴더 경로
	    String uploadFolder = "C:\\upload";

	    // 업로드된 각 파일에 대해 처리
	    for (MultipartFile multipartFile : uploadFile) {
	       
	    	// 로그에 업로드된 파일명과 파일 크기 출력
	        log.info("-------------------------------------");
	        log.info("업로드 파일 명 : " + multipartFile.getOriginalFilename());
	        log.info("업로드 파일 크기 : " + multipartFile.getSize());

	        // 파일을 저장할 경로와 파일명 지정
	        File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

	        try {
	            // 업로드된 파일을 저장 경로에 저장
	            multipartFile.transferTo(saveFile);
	        } catch (Exception e) {
	            // 파일 저장 중 예외 발생 시 에러 로그 출력
	            log.error(e.getMessage());
	       
	        } 
	    } 
	}

	private String getFolder() {

		// 현재 날짜 -> yyyy-MM-dd
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// Date date = new Date();

		String str = sdf.format(new Date());

		// 파일 경로 구분자로 변환하여 반환
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
	   
		try {
	        // 파일의 MIME 타입 확인
	        String contentType = Files.probeContentType(file.toPath());
	        // 로그에 파일의 MIME 타입 출력
	        log.info("확장자 :" + contentType);
	        
	        // MIME 타입이 "image"로 시작하는지 확인하여 이미지 파일 여부를 반환
	        return contentType != null && contentType.startsWith("image");
	    } catch (IOException e) {
	        // 파일의 MIME 타입을 확인하는 도중 예외가 발생한 경우, 에러 로그 출력
	        e.printStackTrace();
	    }
	    
	    // MIME 타입이 존재하지 않거나 이미지가 아닌 경우 false 반환
	    return false;
	}

	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
	   
		// 업로드된 파일 정보를 저장할 리스트 생성
	    List<AttachFileDTO> list = new ArrayList<>();
	    
	    // 파일이 저장될 기본 업로드 폴더 경로
	    String uploadFolder = "C:\\upload";
	    
	    // 현재 날짜를 기반으로 파일이 저장될 하위 폴더 경로 생성
	    String uploadFolderPath = getFolder();
	    
	    // 기본 업로드 폴더에 하위 폴더 생성
	    File uploadPath = new File(uploadFolder, uploadFolderPath);
	    if (!uploadPath.exists()) {
	        uploadPath.mkdirs();
	    }

	    for (MultipartFile multipartFile : uploadFile) {
	        
	    	// 업로드된 각 파일에 대한 정보를 담는 DTO 생성
	        AttachFileDTO attachDTO = new AttachFileDTO();
	        
	        // 업로드된 파일명
	        String uploadfileName = multipartFile.getOriginalFilename();
	        
	        // IE 브라우저에서 파일 경로가 포함된 경우, 파일명만 추출
	        uploadfileName = uploadfileName.substring(uploadfileName.lastIndexOf("\\") + 1);
	        
	        log.info("파일 명 : " + uploadfileName);
	       
	        // DTO에 파일명 설정
	        attachDTO.setFileName(uploadfileName);
	        
	        // UUID를 이용하여 파일명에 고유 식별자 추가
	        UUID uuid = UUID.randomUUID();
	        uploadfileName = uuid.toString() + "_" + uploadfileName;

	        try {
	            // 파일 저장 경로 설정
	            File saveFile = new File(uploadPath, uploadfileName);
	            // 파일 저장
	            multipartFile.transferTo(saveFile);

	            // DTO에 UUID와 업로드된 하위 폴더 경로 설정
	            attachDTO.setUuid(uuid.toString());
	            attachDTO.setUploadPath(uploadFolderPath);

	            // 이미지 파일인 경우 섬네일 생성
	            if (checkImageType(saveFile)) {
	                attachDTO.setImage(true);
	               
	                // 섬네일 파일 생성
	                FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadfileName));
	                Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
	                thumbnail.close();
	            }

	            // 리스트에 DTO 추가
	            list.add(attachDTO);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    } // end for
	    // 업로드된 파일 정보를 JSON 형태로 응답
	    return new ResponseEntity<>(list, HttpStatus.OK);
	}

	
	@GetMapping("/display")	
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
	    // 요청된 파일명 로그로 출력
	    log.info("fileName: " + fileName);
	    // 파일 경로 생성
	    File file = new File("c:\\upload\\" + fileName);
	    // 파일 정보 로그로 출력
	    log.info("file: " + file);
	    ResponseEntity<byte[]> result = null;
	    try {
	        // 파일의 MIME 타입을 확인하여 HTTP 헤더 설정
	        HttpHeaders header = new HttpHeaders();
	        header.add("Content-Type", Files.probeContentType(file.toPath()));
	        // 파일을 바이트 배열로 변환하여 응답 생성
	        result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	    } catch (IOException e) {
	        // 파일 읽기 중 오류 발생 시 예외 처리
	        e.printStackTrace();
	    }
	    return result;
	}

	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
	    // 파일 리소스 생성
	    Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
	    
	    // 파일이 존재하지 않는 경우 404 에러 응답
	    if (resource.exists() == false) {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }

	    // 다운로드할 파일명 설정
	    String resourceName = resource.getFilename();
	    // UUID 제거하여 원본 파일명 추출
	    String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

	    HttpHeaders headers = new HttpHeaders();
	    try {
	        String downloadName = null;

	        // 사용자의 브라우저에 따라 다운로드 파일명 인코딩 처리
	        if (userAgent.contains("Trident")) {
	            log.info("IE browser");
	            downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
	        } else if(userAgent.contains("Edge")) {
	            log.info("Edge browser");
	            downloadName =  URLEncoder.encode(resourceOriginalName,"UTF-8");
	        } else {
	            log.info("Chrome browser");
	            downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
	        }
	        
	        log.info("downloadName: " + downloadName);

	        headers.add("Content-Disposition", "attachment; fileName=" + downloadName);

	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }

	    return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
	    // 삭제할 파일명 로그로 출력
	    log.info("deleteFile: " + fileName);
	    File file;
	    try {
	        // 파일명 디코딩하여 파일 객체 생성
	        file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
	        // 파일 삭제
	        file.delete();
	        
	        // 파일 타입이 이미지인 경우
	        if (type.equals("image")) {
	            // 섬네일 파일명 추출하여 삭제
	            String largefileName = file.getAbsolutePath().replace("s_", "");
	            log.info("largefileName: " + largefileName);
	            file = new File(largefileName);
	            file.delete();
	        }
	    } catch (UnsupportedEncodingException e) {
	        // 파일명 디코딩 중 오류 발생 시 404 에러 응답
	        e.printStackTrace();
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
	    // 파일 삭제 성공 시 성공 메시지 반환
	    return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	
	
	

	

}
