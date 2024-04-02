package org.zerock.domain;

import lombok.Data;

@Data
public class GoodsAttachVO {	
	private String gno; //AttachFileDTO와 비슷하지만 게시물 번호를 받아 게시물-첨부파일 관계로 정리
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean fileType;
}
