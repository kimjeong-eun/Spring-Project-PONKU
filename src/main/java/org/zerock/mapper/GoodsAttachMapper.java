package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.GoodsAttachVO;

public interface GoodsAttachMapper { //첨부파일의 수정은 하지 않습니다

	public void insert(GoodsAttachVO vo);
	
	public void delete(String uuid);
	
	public List<GoodsAttachVO> findByGno(String gno);
}
