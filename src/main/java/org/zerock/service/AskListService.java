package org.zerock.service;

import java.util.List;

import org.zerock.domain.AskListVO;
import org.zerock.domain.Criteria;

public interface AskListService {

	// 페이징 없이 게시물 리스트를 반환
	public List<AskListVO> getList();
	
	// 페이징을 이용하여 게시물 리스트를 반환
	public List<AskListVO> getListWithPaging(Criteria cri);

	// 게시물 객체를 받아 insert 한다.
	public int register(AskListVO askList);

	// 게시물 번호를 받아 게시물 객체를 찾아서 리턴한다.
	public AskListVO get(Long ask_list_no);

	// 게시물 번호를 받아 게시물을 삭제한다.
	public boolean remove(Long ask_list_no);

	// (수정된)게시물 객체를 받아 게시물을 수정한다.
	public boolean modify(AskListVO askList);
	
	// 페이징 처리를 위해 전체 게시물 수를 가져온다.
	public int getTotal(Criteria cri);

}
