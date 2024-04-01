package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	// @Service = 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	

	
	@Transactional
	@Override
	public void register(BoardVO board) {

		log.info("등록 : " + board);

		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size()<=0) {
			return;
		}
		
		board.getAttachList().forEach(attach ->{ //첨부파일 리스트 첨부객체
			
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
	}

	@Override
	public BoardVO get(Long bno) {

		log.info("조회 :" + bno);

		return mapper.read(bno);

	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {

		log.info("수정 :" + board);

		attachMapper.deleteAll(board.getBno());

		boolean modifyResult = mapper.update(board) == 1;

		if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {

			board.getAttachList().forEach(attach -> {

				attach.setBno(board.getBno());
				attachMapper.insert(attach);

			});

		}

		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(Long bno) {

		log.info("삭제 : " + bno);

		return mapper.delete(bno) == 1;
	}


	@Override
	public List<BoardVO> getList(Criteria cri) {

		log.info("목록: " + cri);

		return mapper.getList();
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("전체 조회 수");
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		
		log.info("게시판 페이징");
		
		return mapper.getListWithPaging(cri);
	}


	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		
		log.info("파일 첨부" + bno);
		
		return attachMapper.findByBno(bno);
	}


	


}
