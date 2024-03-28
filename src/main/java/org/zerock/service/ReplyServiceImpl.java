package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	
	@Override
	public int register(ReplyVO cvo) {
		
		log.info("등록 : " + cvo);
		
		return mapper.insert(cvo);
	}

	@Override
	public ReplyVO get(Long id) {
		
		log.info("조회 : " + id);
		
		return mapper.read(id);
	}

	@Override
	public int modify(ReplyVO cvo) {
		
		log.info("수정 :" + cvo);
		
		return mapper.update(cvo);
	}

	@Override
	public int remove(Long rno) {
		
		log.info("삭제 : " + rno);
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		
		log.info("보드에 있는 댓글 리스트 : " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public int postComment(String comment) {
		
		log.info("댓글 삽입 :" + comment);
		
		return mapper.insertComment(comment);
	}
	

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long id) {
		
		return new ReplyPageDTO(
				mapper.getCountByid(id), 
				mapper.getListWithPaging(cri, id));
	}

}
