package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AskListVO { // 문의게시판
	private Long ask_list_no;					// 게시물 번호(pk)
	private String ask_list_inquirytype;		// 문의종류
	private String ask_list_productno;			// 상품정보(fk 예정) string 타입으로 변경
	private String ask_list_title;				// 제목
	private String ask_list_content;			// 내용
	private String ask_list_writer;				// 작성자(fk 예정)
	private Date ask_list_regdate;				// 작성일
	private Date ask_list_updatedate;			// 수정일
	private boolean ask_list_attach;			// 첨부파일 여부
	private boolean ask_list_lock;				// 비밀글 여부
	private String ask_list_lock_password;		// 비밀번호(비밀글일때)
	
	private List<AskListAttachVO> attachList;	// 첨부파일 리스트
}
