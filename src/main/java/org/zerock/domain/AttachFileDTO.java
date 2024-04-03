package org.zerock.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;

}
