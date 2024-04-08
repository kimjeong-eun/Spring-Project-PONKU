package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AskListAttachVO;


public interface AskListAttachMapper {
	public void insert(AskListAttachVO vo); // 첨부파일 추가(게시글에 첨부파일이 존재하는 경우 같이 insert 되어야 한다.)

	public void delete(String uuid); // 첨부파일 삭제

	public List<AskListAttachVO> findByAno(Long ask_list_no); // 게시물 번호를 매개값으로 해당 게시물에 해당하는 첨부파일을 list로 모두 가져온다.

	public void deleteAll(Long ask_list_no); // 게시물이 지워질 때 게시물에 해당하는 첨부파일을 모두 삭제한다.

	public List<AskListAttachVO> getOldFiles(); // uploadpath가 어제 날짜인것을 select .. ?

	// 수정이라는 개념은 존재하지 않는다.
}
