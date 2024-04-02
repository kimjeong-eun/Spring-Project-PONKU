package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
  })
//"file:src/main/webapp/WEB-INF/spring/security-context.xml"
@Log4j2
@Data
@WebAppConfiguration
public class GoodsControllerTests {

	//테스트 시 서버 실행하지 않기 위해 기존의 테스트 코드와 다르게 작성 
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; //가짜 MVC, URL과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어 실행
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	//서버 실행하지 않고 테스트 가능  
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/goods/goodsList"))
			.andReturn()
			.getModelAndView()
			.getModelMap());
	}
	
	@Test
	public void testListPaging() throws Exception {
	    log.info(mockMvc.perform(
	            MockMvcRequestBuilders.get("/goods/goodsList")
	                    .param("pageNum", "1")
	                    .param("amount", "10"))
	            .andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
										.post("/goods/register")
											.param("gno", "11")
											.param("gname", "테스트 새글 제목")
											.param("price", "3000"))
											.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/goods/get")
				.param("gno", "11"))
				.andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/goods/modify")
										.param("gno", "15")
										.param("gname", " 수정된 테스트 새 글 제목")
										.param("information", "수정된 테스트 새 글 내용"))
										.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/goods/remove")
										.param("gno", "99"))
										.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}

}