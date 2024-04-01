package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.AskListVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j2
public class AskListMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private AskListMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(askList -> log.info(askList));
	}
	
	@Test
	public void testGetListWithPaging() {
		
		Criteria cri = new Criteria(1, 10);
		mapper.getListWithPaging(cri).forEach(askList -> log.info(askList));
	}
	
	@Test
	public void testInsert() {
		AskListVO askList = new AskListVO();
		askList.setAsk_list_inquirytype("문의종류");
		askList.setAsk_list_title("테스트문의 제목");
		askList.setAsk_list_content("테스트 문의 내용");
		askList.setAsk_list_writer("testuser");
		askList.setAsk_list_attach(false);
		askList.setAsk_list_lock(false);
		mapper.insert(askList);
		
		log.info(askList);
	}
	
	@Test
	public void testRead() {
		AskListVO vo = mapper.read(22L);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		log.info("삭제된 개수 : " + mapper.delete(21L));
	}
	
	@Test
	public void testUpdate() {
		AskListVO vo = new AskListVO();
		vo.setAsk_list_no(19L);
		vo.setAsk_list_inquirytype("상품문의");
		vo.setAsk_list_title("문의수정테스트제목");
		vo.setAsk_list_content("수정테스트");
		vo.setAsk_list_attach(false);
		vo.setAsk_list_lock(false);
		vo.setAsk_list_productno("1"); // not null 아니여도 null 넣을 수 없음 set null 안된다 
		vo.setAsk_list_lock_password("2345");
		
		log.info("수정된 개수 : " + mapper.update(vo));
	}
	
	/* 아직 안할랭
	 * @Test public void testGetTotalCount() { log.info("게시물 총 개수 : " +
	 * mapper.getTotalCount()) }
	 */
	
	
	
	
	
	
	
	
	
	
	
}
