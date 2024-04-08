package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ShopGoodsVO;
import org.zerock.domain.ShoppingCartVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
	  })
@Log4j2
public class getGoodsTest {
	
	@Setter(onMethod_= @Autowired )
	CustomOrderMapper mapper;
	
	@Test
	public void getInfo() {
		
		ShopGoodsVO vo  = mapper.selectGoods("ip0327");
		log.info("==============================");
		log.info(vo);
		log.info("==============================");
	}
	
	@Test
	public void getCount() {
		
		int result = mapper.selectShoppingCartCount(64);
		
		log.info("==============================");
		log.info(result);
		log.info("==============================");
		
		
	}
	
	@Test
	public void getList() {
		
		
		List<ShoppingCartVO> vo = mapper.selectCartList(64);
		
		log.info("==============================");

		log.info(vo.get(0).getGname());
		log.info("==============================");
		
		
		
	}
	
	@Test
	public void deleteElement() {
	
		mapper.deleteCartElement(64, "1");
		
		log.info("==============================");

		
		log.info("==============================");
		
		
		
	}
	
	//나의 주문목록
	@Test
	public void getMyList() {
		
		mapper.selectMyOrderList("2024-03-27", "2024-03-28", "jeongeun587"); 
		/* mapper.selectMyCustomOrderList("2024-03-21", "2024-03-28", "jeongeun587"); */
		
		
	}
	

}
