package org.zerock.controller;

import java.net.http.HttpClient;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.zerock.domain.Criteria;
import org.zerock.domain.AskListLockDTO;
import org.zerock.domain.AskListPageDTO;
import org.zerock.domain.AskListVO;
import org.zerock.service.AskListService;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/ask/*")
@AllArgsConstructor
public class AskController { // 페이지의 분기를 담당한다.

	private AskListService service;
	@Autowired
	private CsrfTokenRepository csrfTokenRepository;

	@PreAuthorize("permitAll")
	@GetMapping("/write") // 글쓰기 페이지로 보내는 역할
	// @PreAuthorize("isAuthenticated()") 시큐리티
	public void write() {
		log.info("write 메서드 실행 ... ");
	} // get : localhost/ask/write -> write.jsp

	@PreAuthorize("permitAll")
	@GetMapping("/main") // 페이징사용, 첫 페이지를 보여준다.
	public void main(Criteria cri, Model model) {
		log.info("cri : " + cri);
		model.addAttribute("cri", cri);
	}
	
	@ModelAttribute("csrfToken")
	public CsrfToken getCsrfToken(HttpServletRequest request) {
	    return csrfTokenRepository.loadToken(request);
	}

	@PreAuthorize("permitAll")
	@GetMapping("/get") // 상세보기 페이지로 이동.. // 파라미터로 넘어온 no, pw를 dto에 셋팅해서 받을 수 있는 방법 .. ?
	public String get(@RequestParam("no") Long ask_list_no, @RequestParam("pw") String pw, AskListLockDTO dto, Model model, CsrfToken csrfToken, HttpServletRequest request) { // @ModelAttribute("cri") Criteria cri,
		log.info("get(get) 메서드 실행");
		dto.setAsk_list_no(ask_list_no);
		dto.setPassword(pw);
		log.info("넘겨받은 pw : " + pw);
		if (service.checkLock(ask_list_no)) {  // 비밀글이면
			if (!(pw == null || pw.trim().isEmpty())) { // 넘어온 pw값이 있으면 /ask/lock 비밀번호 검증
		        String csrfTokenValue = csrfToken.getToken();
		        log.info("토큰 : " + csrfTokenValue);
		        // RestTemplate 객체 생성
		        RestTemplate restTemplate = new RestTemplate();
		       
		        
		        
		        log.info("RestTempate 객체 : " + restTemplate);
		        // 요청 헤더 설정
		        HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_JSON);
		        headers.set("X-CSRF-TOKEN", csrfTokenValue); // CSRF 토큰을 요청 헤더에 추가
		        log.info("헤더 : " + headers);
		        // 요청 본문 데이터 설정
		        log.info("넘길 dto : " + dto); // 위에서 set no, pw 완료
		        // HTTP 요청 객체 생성
		        HttpEntity<AskListLockDTO> requestEntity = new HttpEntity<>(dto, headers); 
		        // POST 요청 보내기
		        String url = "http://localhost/ask/lock";
		        ResponseEntity<String> responseEntity = restTemplate.postForEntity(url, requestEntity, String.class); 
		        // 응답 출력
		        System.out.println("responseEntity : " + responseEntity);
		        String responseBody = responseEntity.getBody();
		        System.out.println("Response: " + responseBody);
		        if(responseBody.equals("true")) {
		        	dto.setPass(true);
		        }
		    }
		
			return "redirect:/ask/lock?no=" + ask_list_no; // 여기로 갈 때 dto 객체로 get방식으로 넘길 수 있는 방법 ..?
		}
		AskListVO vo = service.get(ask_list_no);
		model.addAttribute("AskListVO", vo);
		try {
            ObjectMapper objectMapper = new ObjectMapper(); // json 문자열로 변환하기 위한 jackson 객체
            String fileJson = objectMapper.writeValueAsString(vo.getAttachList());
            log.info(fileJson);
            model.addAttribute("fileJson", fileJson);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return "ask/get";
	}
	
//	@PreAuthorize("permitAll")
//	@PostMapping("/get") // 상세보기 페이지로 이동..
//	public String get(@RequestBody AskListLockDTO dto) { // @ModelAttribute("cri") Criteria cri,
//		log.info("get(post) 메서드 실행");
//		if (dto.isPass() == true) { 
//			return "ask/get";
//		} 
//		AskListVO vo = service.get(ask_list_no);
//		model.addAttribute("AskListVO", vo);
//		try {
//            ObjectMapper objectMapper = new ObjectMapper(); // json 문자열로 변환하기 위한 jackson 객체
//            String fileJson = objectMapper.writeValueAsString(vo.getAttachList());
//            log.info(fileJson);
//            model.addAttribute("fileJson", fileJson);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//		return "ask/get";
//	}

	@PreAuthorize("permitAll")
	@GetMapping("/lock")
	public void lock(@RequestParam("no") Long ask_list_no, Model model) {
		log.info("lock 메서드 실행");
		model.addAttribute("ask_list_no", ask_list_no);
	}
	
}
