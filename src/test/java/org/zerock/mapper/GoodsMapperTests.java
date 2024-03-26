package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
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
	public void testRead() {
		GoodsVO goods = mapper.read("100");
		
		log.info(goods);
	}
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(goods -> log.info(goods));
	}
	@Test
	public void testInsert() {
		GoodsVO goods = new GoodsVO();
		goods.setGno("99");
		goods.setGname("테스트 상품 99");
		goods.setPrice("9999");

		mapper.insert(goods);

		log.info(goods);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<GoodsVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(goods -> log.info(goods));
	}
	
	@Test
	public void testinsertWithOption() {
		GoodsVO goods = new GoodsVO();
		goods.setGno("100");
		goods.setGname("테스트 상품 100");
		goods.setPrice("100");
		
		goods.setInformation("테스트 상품 100에 대한 설명");
		
		mapper.insertWithOption(goods);
		
		log.info(goods);
	}
	
	@Test
	public void testUpdate() {
		GoodsVO goods = new GoodsVO();
		//실행 전 번호 존재 여부 확인할 것
		goods.setGno("99");
		goods.setGname("수정된 상품A");
		goods.setPrice("990000");
		
		goods.setInformation("수정되었다99999"); // title_img가 null 또는 빈 문자열인 경우 null로 설정
        //goods.setTitle_img(null); // title_img가 null 또는 빈 문자열인 경우 null로 설정
        //goods.setInfo_img(null); // info_img가 null 또는 빈 문자열인 경우 null로 설정
		
		int count = mapper.update(goods);
		log.info("UPDATED COUNT: " + count);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETED COUNT: " + mapper.delete("100"));
	}
}
