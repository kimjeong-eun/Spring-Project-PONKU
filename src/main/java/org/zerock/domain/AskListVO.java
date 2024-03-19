package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AskListVO { // 문의게시판
	private Long askListNO;				// 게시물 번호(pk)
	private String inquiryType;		// 문의종류
	private Long productNO;			// 상품정보(fk 예정)
	private String title;			// 제목
	private String content;			// 내용
	private String writer;			// 작성자(fk 예정)
	private Date regDate;			// 작성일
	private Date updateDate;		// 수정일
	private boolean attach;			// 첨부파일 여부
	private boolean lock;			// 비밀글 여부
	private String password;		// 비밀번호(비밀글일때)
}
