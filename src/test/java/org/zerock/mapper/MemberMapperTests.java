package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j2
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired )
	private LoginMapper mapper;
	
	@Test
	public void testRead() {
		
		MemberVO vo =mapper.read("user3");
		 log.info(vo);
		 
		 vo.getAuthList().forEach(authVO -> log.info(authVO));
		
	}
	
	@Test
	public void getByNameAndEmail() {
		
		MemberVO vo = mapper.getIdByNameAndEmail("jeongeun587@naver.com");
		
		 log.info(vo);
	}
	
}
