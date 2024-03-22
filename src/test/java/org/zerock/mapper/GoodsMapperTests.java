package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.GoodsVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class GoodsMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private GoodsMapper mapper;
	
	@Test
	public void testInsert() {
		GoodsVO goods = new GoodsVO();
		goods.setGno(3);
		goods.setGname("테스트 상품	B");
		goods.setPrice(9999);
		goods.setQuantity(99);

		mapper.insert(goods);

		log.info(goods);
	}
	
	@Test
	public void testinsertWithOption() {
		GoodsVO goods = new GoodsVO();
		goods.setGno(9);
		goods.setGname("테스트 상품B");
		goods.setPrice(6666);
		goods.setQuantity(666);
		
		goods.setInformation("테스트 상품 F에 대한 설명");
		
		mapper.insertWithOption(goods);
		
		log.info(goods);
	}
	
	@Test
	public void testRead() {
		GoodsVO goods = mapper.read(1L);
		
		log.info(goods);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETED COUNT: " + mapper.delete(5L));
	}
	
	@Test
	public void testUpdate() {
		GoodsVO goods = new GoodsVO();
		//실행 전 번호 존재 여부 확인
		goods.setGno(1L);
		goods.setGname("수정된 상품A");
		goods.setPrice(5000000);
		goods.setQuantity(55);
		
		goods.setInformation("asdf"); // title_img가 null 또는 빈 문자열인 경우 null로 설정
        goods.setTitle_img(null); // title_img가 null 또는 빈 문자열인 경우 null로 설정
        goods.setInfo_img(null); // info_img가 null 또는 빈 문자열인 경우 null로 설정
		
		int count = mapper.update(goods);
		log.info("UPDATED COUNT: " + count);
	}
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(goods -> log.info(goods));
	}
}
