package org.zerock.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String fileName; //파일명
	private String uploadPath; //경로
	private String uuid; //중복 방지 난수
	private boolean image; //확장자 이미지 여부
}
