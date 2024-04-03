package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	  private Long bno;
	  private String title;
	  private String content;
	  private String writer;
	  private Date regdate;
	  private Date updatedate;
	  
	  private int replycnt;
	  
	  private List<BoardAttachVO> attachList;

}
