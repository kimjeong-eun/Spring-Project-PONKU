package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ManagerVO;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j2
public class ManagerMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ManagerMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Test
	public void testInsertManager() {
		ManagerVO manager = new ManagerVO();
		manager.setManager_id("jeongeun2");
		manager.setPassword(pwencoder.encode("1234"));
		manager.setManager_name("김정은");
		manager.setEmail("jeongeun587@naver.com");

		int manager_seq = mapper.insertManager(manager);
	}
	
	@Test
	public void testRead() {
		ManagerVO vo = mapper.read("viceAdmin");
		
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
}
