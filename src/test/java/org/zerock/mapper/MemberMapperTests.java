package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j2
public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired) private PasswordEncoder pwencoder;
	
	@Test
	public void testInsertMember() {
		MemberVO member = new MemberVO();
		AuthVO auth = new AuthVO();
		member.setUserid("ksy0417");
		member.setPassword(pwencoder.encode("1234"));
		member.setUsername("김수영");
		member.setGender("W");
		member.setEmail("ktndud2@naver.com");
		member.setPhone("01022796331");
		
		int member_seq = mapper.insertMember(member);
		auth.setAuth("ROLE_MEMBER");
		auth.setMember_seq(member_seq);
		mapper.insertMemberAuth(auth);
	}
}
