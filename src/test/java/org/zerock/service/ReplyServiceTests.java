package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
	  })
@Log4j2
public class ReplyServiceTests {
	
	@Setter(onMethod_ = {@Autowired })
	private ReplyService service;
	
	@Setter(onMethod_ = {@Autowired })
	private PasswordEncoder pwencoder;
	
	 
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		ReplyVO vo = new ReplyVO();
		vo.setBno(29L);
		vo.setRno(65L);
		vo.setReplyer("새 사용자");
		vo.setContent("새로운 내용");
		
		service.register(vo);
		
		log.info("생성된 게시물의 번호" + vo.getRno());
		
		
	}
	
	


}
