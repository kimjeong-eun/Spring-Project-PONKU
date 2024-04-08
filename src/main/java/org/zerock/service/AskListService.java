package org.zerock.service;

import java.util.List;

import org.zerock.domain.AskListAttachVO;
import org.zerock.domain.AskListPageDTO;
import org.zerock.domain.AskListVO;
import org.zerock.domain.Criteria;

public interface AskListService {

	// 페이징 없이 게시물 리스트를 반환
	public List<AskListVO> getList();

	// 페이징을 이용하여 게시물 리스트를 반환
	public AskListPageDTO getListWithPaging(Criteria cri);

	// 게시물 객체를 받아 insert 한다.
	public void register(AskListVO askList);

	// 게시물 번호를 받아 게시물 객체를 찾아서 리턴한다.
	public AskListVO get(Long ask_list_no);

	// 게시물 번호를 받아 게시물을 삭제한다.
	public boolean remove(Long ask_list_no);

	// (수정된)게시물 객체를 받아 게시물을 수정한다.
	public boolean modify(AskListVO askList);

	// 게시물 번호를 매개값으로 해당 게시물의 첨부파일들을 받아온다.
	public List<AskListAttachVO> getAttachList(Long ano);

	// 게시물이 삭제될 때 해당 게시물의 첨부파일들도 같이 삭제한다.
	public void removeAttach(Long ano);

	// 게시물 번호를 받아 비밀글인지 확인한다.
	public boolean checkLock(Long ask_list_no);

	// 해당 게시물(비밀글)의 비밀번호와 매개값으로 받은 비밀번호가 일치하는지 확인
	public boolean askPassword(Long ask_list_no, String pw);

}
