package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.AuthVO;
import org.zerock.domain.ManagerVO;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
	  })
@Log4j2
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Test
	public void testInsertMember() {
		
		MemberVO member = new MemberVO();
		AuthVO auth = new AuthVO();
		member.setUserid("superAdmin");
		member.setPassword(pwencoder.encode("1234"));
		member.setUsername("SA");
		member.setBirth("20240329");
		member.setEmail("ponkuu@naver.com");
		member.setPhone("01012341234");
		
		int member_seq = mapper.insertMember(member); //insert 성공/실패여부
		
		log.info("================");
		log.info(member.getMember_seq());
	}
	
	@Test
	public void testRead() {
		MemberVO vo = mapper.selectMember("viceAdmin");
		
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
}
