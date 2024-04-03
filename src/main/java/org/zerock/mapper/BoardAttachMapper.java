package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardAttachVO;


public interface BoardAttachMapper { //첨부파일의 수정은 하지 않습니다

	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Long bno);
	
	public void deleteAll(Long bno);
	
	public List<BoardAttachVO> getOldFiles();
}
