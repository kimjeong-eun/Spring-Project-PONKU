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
public class AskFileUploadController {

	/*
	 * @PostMapping("/uploadFormAction") // form으로 파일을 업로드하는 방식 public void
	 * uploadFormPost(MultipartFile[] uploadFile, Model model) { // uploadFile :
	 * input 태그의 name 속성으로 변수를 지정 // MultipartFile[] : 스프링에서 제공, 여러개 선택 가능하므로 배열로 선언
	 * 
	 * String uploadFolder = "C:\\upload"; // 저장될 경로
	 * 
	 * for (MultipartFile multipartFile : uploadFile) {
	 * 
	 * log.info("-------------------------------------");
	 * log.info("Upload File Name: " + multipartFile.getOriginalFilename());
	 * log.info("Upload File Size: " + multipartFile.getSize());
	 * 
	 * File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
	 * // 파일 객체 생성
	 * 
	 * try { multipartFile.transferTo(saveFile); // 파일을 저장한다. } catch (Exception e)
	 * { log.error(e.getMessage()); } // end catch } // end for
	 * 
	 * }
	 */

	/*
	 * @PreAuthorize("isAuthenticated()")
	 * 
	 * @GetMapping("/uploadAjax") // ajax을 이용해 파일을 업로드하는 방식(파일데이터만을 전송) public void
	 * uploadAjax() {
	 * 
	 * log.info("upload ajax"); }
	 */

	private String getFolder() { // 년/월/일별로 폴더를 생성한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		// yyyy-MM-dd 형식을 만든다.
		Date date = new Date();											// 날짜 객체를 만든다.
		String str = sdf.format(date);									// 위의 형식으로 날짜를 문자열로 str 변수에 저장한다.(2024-03-12)
		return str.replace("-", File.separator);						// str의 -를 파일의 경로구분자로 바꾼다(2024\03\12)
	}

	private boolean checkImageType(File file) {											// 파일이 이미지 타입인지 구분하는 메서드
		try {
			String contentType = Files.probeContentType(file.toPath());  // 파일의 경로로 파일의 타입을 알아와서 String에 저장한다.	
			log.info(contentType);
			if(contentType == null) {
				return false;
			}
			return contentType.startsWith("image");	// startsWith : 어떤 문자열이 특정 문자로 시작하는지 확인 // 파일의 타입이 image로 시작하는지 여부를 리턴한다.
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;																	// 예외가 생기면 false;
	}
	
	@PreAuthorize("permitAll")
	@PostMapping(value = "/uploadAjaxAction")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<AttachFileDTO> list = new ArrayList<>();										// 파일들의 정보를 저장할 List 객체 생성
		String uploadFolder = "C:\\shopProjectFile";											// 업로드 경로
		String uploadFolderPath = getFolder();													// 2024\03\02 문자열 받음
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);								// C:\\upload\2024\03\02 파일 객체를 만든다
		if (uploadPath.exists() == false) {														// C:\\upload\2024\03\02가 존재하지 않으면
			uploadPath.mkdirs();																// C:\\upload\2024\03\02 디렉토리 생성
		}
		// end make folder --------
		for (MultipartFile multipartFile : uploadFile) {										// 업로드 할 파일들을 돌면서 
			AttachFileDTO attachDTO = new AttachFileDTO();										// 파일들의 정보를 저장할 빈 객체를 생성하고
			String uploadFileName = multipartFile.getOriginalFilename();						// uploadFileName에 원본 파일명을 넣는다.
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);	// IE 오류 해결(전체경로로 나온다.)
			log.info("파일명 !!!!!!!!!!!!!!!!!!!!!!!! : " + uploadFileName);
			attachDTO.setFileName(uploadFileName);												// 파일들의 정보를 저장할 객체에 FileName을 위의 원본파일명으로 셋팅한다.

			UUID uuid = UUID.randomUUID();														// 랜덤한 uuid를 가져온다.
			uploadFileName = uuid.toString() + "_" + uploadFileName;							// uuid_uploadFileName형의 저장할 파일명을 생성한다.
			try {
				File saveFile = new File(uploadPath, uploadFileName);							// 최종경로와 최종저장파일명으로 파일 객체를 생성한다.
				multipartFile.transferTo(saveFile);												// 파일을 저장한다!(실제로 저장이 수행된다)

				attachDTO.setUuid(uuid.toString());												// 파일들의 정보를 저장할 객체에 uuid를 셋팅한다.
				attachDTO.setUploadPath(uploadFolderPath);										// 파일들의 정보를 저장할 객체에 uploadFolderPath를 셋팅한다.(저장될 폴더) : 2024\03\02

				// check image type file
				if (checkImageType(saveFile)) {													// 최종 파일 객체가 이미지 타입인지 검사하고 이미지 파일이 맞으면
					attachDTO.setImage(true);													// 파일 정보를 가지고 있는 객체의 이미지여부를 true로 셋팅한다.
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));			// 같은 경로에 s_가 붙은 새로운 파일 객체를 생성한다.
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 10, 10);						// 썸네일을 생성한다.(inputStream, File객체, 너비, 높이)
					thumbnail.close();															// FileOutputStream을 닫아준다.
				}
				
				long size = multipartFile.getSize();
				log.info("파일 사이즈!!!!!!!!!!!!!!!!!!!!! : " + size);
				attachDTO.setSize(size);

				// add to List
				list.add(attachDTO);															// 파일 하나의 정보를 가진 객체를 list에 저장한다.
				log.info(list);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);										// 파일들의 정보를 가진 list와 200(정상) 코드를 리턴한다.
	}

	/*
	 * @GetMapping("/display") //??? // 특정한 파일 이름을 받아서 이미지 데이터를 전송한다.
	 * 
	 * @ResponseBody public ResponseEntity<byte[]> getFile(String fileName) { // 파일의
	 * 경로가 포함된 파일명(2024/03/02/s_obj.uuid_파일명)
	 * 
	 * log.info("fileName: " + fileName);
	 * 
	 * File file = new File("c:\\upload\\" + fileName); // 파일 객체를 만든다
	 * c://upload//파일의 경로가 포함된 파일명.확장자
	 * 
	 * log.info("file: " + file);
	 * 
	 * ResponseEntity<byte[]> result = null; // 결과 .. ?
	 * 
	 * try { HttpHeaders header = new HttpHeaders(); // 파일의 종류에 따라 브라우저에 보내주는 미디어
	 * 타입이 달라지므로 // probeContentType : 파일의 확장자를 이용해서 미디어 타입을 반환한다.(실제 파일이 존재하지 않아도
	 * 미디어타입 반환함) // 확장자가 없으면 null을 반환 header.add("Content-Type",
	 * Files.probeContentType(file.toPath())); // probeContentType()를 이용해서 적절한 미디어타입
	 * 데이터를 header메시지에 포함하여 처리한다. result = new
	 * ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	 * // FileCopyUtils : 파일 및 스트림 복사를 위한 클래스 // copyToByteArray : byte타입으로 복사 ..? }
	 * catch (IOException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } return result; }
	 */

	/*
	 * @GetMapping(value = "/download", produces =
	 * MediaType.APPLICATION_OCTET_STREAM_VALUE) // 다운로드는 미디어 타입이 고정되어
	 * 있다.(APPLICATION_OCTET_STREAM_VALUE)
	 * 
	 * @ResponseBody public ResponseEntity<Resource>
	 * downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName)
	 * { // 파일 다운로드 메서드(브라우저 정보와, 경로가 포함된 파일이름을 받는다)
	 * 
	 * Resource resource = new FileSystemResource("c:\\upload\\" + fileName); // 파일을
	 * 인식한다. byte를 이용할 수도 있지만 간단히 처리하기 위해 Resource를 사용했다.
	 * 
	 * if (resource.exists() == false) { // 파일이 인식되지 않으면 return new
	 * ResponseEntity<>(HttpStatus.NOT_FOUND); // 못찾겠당 리턴 }
	 * 
	 * String resourceName = resource.getFilename(); // 파일이 인식되면 파일이름을 resourceName
	 * 변수에 넣는다.
	 * 
	 * // remove UUID // uuid를 제거한 순수한 파일명으로 다운로드 할 수 있고 보이는것도 순수한 파일명으로 보이게 한다.
	 * String resourceOriginalName =
	 * resourceName.substring(resourceName.indexOf("_") + 1); // resourceName변수에서
	 * uuid가 끝난 다음부터의 글자를 가져온다(uuid를 지운다)(원래 uuid_경로_파일명)
	 * 
	 * HttpHeaders headers = new HttpHeaders(); // 헤더객체를 이용해서 다운로드 파일 이름처리를
	 * 한다.(한글깨짐방지) try {
	 * 
	 * boolean checkIE = (userAgent.indexOf("MSIE") > -1 ||
	 * userAgent.indexOf("Trident") > -1); // IE인지 체크한다.
	 * 
	 * String downloadName = null;
	 * 
	 * if (checkIE) { // IE라면? downloadName =
	 * URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " "); // IE
	 * 방식의 한글처리를 한다. } else { // 아니라면?(크롬이라면) downloadName = new
	 * String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1"); // 크롬 방식의 한글처리를
	 * 한다.(ISO-8859-1 : 인코딩 방식) }
	 * 
	 * headers.add("Content-Disposition", "attachment; filename=" + downloadName);
	 * // 브라우저 별 인코딩된 다운로드파일명을 헤더에 추가해서 한글이 깨지지 않게 한다.
	 * 
	 * } catch (UnsupportedEncodingException e) { e.printStackTrace(); }
	 * 
	 * return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK); //
	 * rewsource객체, headers객체와 함께 200코드(정상처리)를 리턴한다. }
	 */
	
	//@PreAuthorize("isAuthenticated()")
	@PreAuthorize("permitAll")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {					// 경로+uuid+파일명, image 여부를 받아 파일을 삭제하는 메서드
		log.info("deleteFile: " + fileName);
		File file;																				// 빈 파일객체 .. ?
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));				// 인코딩된 파일명을 디코딩하여 원래의 파일명으로 되돌려 파일 객체를 생성해 file 변수에 연결
			file.delete();																		// delete(file 객체에 내장된 메서드) 파일을 삭제한다(일반파일 : 파일만 삭제함, 이미지파일 : 썸네일을 여기서 삭제하고 밑에서 원본파일을 삭제함)
			if (type.equals("image")) {															// 파일의 타입이 이미지라면
				String largeFileName = file.getAbsolutePath().replace("s_", "");				// 파일객체의 절대경로를 리턴받아 s_(원본과 썸네일의 차이)를 없앤다
				// getAbsolutePath() : 현재 실행 중인 Workding directory에 File에 전달한 경로를 조합하여 절대 경로를 리턴
				log.info("largeFileName: " + largeFileName);
				file = new File(largeFileName);													// 원본파일의 파일객체를 생성해 file 변수에 연결한다.
				file.delete();																	// 원본 이미지 파일을 삭제한다.
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);									// 예외가 발생한다면 찾을수 없다는 오류를 리턴
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);							// 별 다른 예외 없이 정상작동 했다면 deleted 메시지와 200(정상)코드를 리턴
	}
	

}
