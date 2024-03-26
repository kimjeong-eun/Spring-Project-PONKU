package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
	  })
@Log4j2
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder; 
	
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	// 부모 객체 bno값 확인하여 반복 더미데이터를 삽입하는 용도
		private Long[] bnoArr = { 42L, 43L, 44L, 45L, 46L };
		
		@Test
		public void testCreate() { // bno가 있는 값을 확인하여 반복 더미데이터를 삽입
			
				IntStream.rangeClosed(1, 10).forEach(i -> {
					ReplyVO cvo = new ReplyVO();
			
				cvo.setId(bnoArr[i % 5]);	// 위에 만든 배열을 5로 나눈 나머지 값을 넣음
				cvo.setContent("댓글 테스트" + i);
				cvo.setReplyer("사용자" + i);	// 더미 객체 생성용
				
				mapper.insert(cvo);// 위에서 만든 더미 객체를 mapper에서 insert 작업을 진행
				
			});
		
		}
		
		@Test
		public void testList() {
			Criteria cri = new Criteria();
			
			List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[1]);
			
			log.info("------------------------------------------------");
			replies.forEach(reply -> log.info(reply));
		}
		
		@Test
		public void testList2() {
			
			Criteria cri = new Criteria(2, 10);
			
			List<ReplyVO> replies = mapper.getListWithPaging(cri, 44L);
			
			replies.forEach(reply -> log.info(reply));
			
		}
		
		
		@Test
		public void testRead() {
			
			Long targetRno = 22L;
			
			ReplyVO cvo = mapper.read(targetRno);
			
			log.info("------------------------");
			
			log.info(cvo);
		}
		
		@Test
		public void testUpdate() {
			
			Long targetRno = 5L;
			
			ReplyVO vo = mapper.read(targetRno);
			
			vo.setContent("댓글 수정");
			
			int count = mapper.update(vo);
			
			log.info("수정" + count);
		}
		
		@Test
		public void testDelete() {
			
			Long targetid = 1L;
			
			mapper.delete(targetid);
			
		}
	
		
}
		
		