package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.zerock.domain.GoodsVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class GoodsServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private GoodsService service; 
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service); //service객체가 null이 아니면 실행
	}
	
	@Test
	public void testRegister() {
		GoodsVO goods = new GoodsVO();
		goods.setGno(3L);
		goods.setGname("테스트 상품D");
		goods.setPrice(30000);
		goods.setQuantity(3);
		goods.setInformation("테스트 상품D에 대한 설명입니다.");
		
		service.register(goods);
		
		log.info("생성된 게시물의 번호: " + goods.getGno());
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(goods -> log.info(goods));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove(2L));
	}
	
	@Test
	public void testUpdate() {
		GoodsVO goods = service.get(1L);
		
		if (goods == null) {
			return;
		}
		
		goods.setGname("상품명 수정합니다");
		log.info("modify result: " + service.modify(goods));
	}
}
