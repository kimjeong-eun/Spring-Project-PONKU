package org.zerock.domain;

import lombok.Data;

@Data
public class AskListAttachVO { // tbl_attach 테이블의 값을 담을 그릇
	// 실제 첨부파일이 등록되는 테이블(브라우저가 비정상적으로 종료되었을 때 실제 결과와 서버에 업로드된 파일목록의 차이를 해결하기 위함)
	// 게시물을 등록할 때 첨부파일이 있다면 첨부파일 테이블도 같이 insert 작업이 진행되어야 한다.(트랜젝션 처리 필요)

	private String uuid;		// uuid(pk)
	private String uploadPath;	// 실제 파일이 업로드 된 경로
	private String fileName;	// 파일이름
	private boolean fileType;	// 이미지 파일 여부

	private Long ano;			// 해당 게시물 번호(fk)

}
