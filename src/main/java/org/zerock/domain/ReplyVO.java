package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long id;
	private Long rno;
	
	private String replyer;
	private String content;
	
	private Date replyDate;		
	private Date updateDate;

}
