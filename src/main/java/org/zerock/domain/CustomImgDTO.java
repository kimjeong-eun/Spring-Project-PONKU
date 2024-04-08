package org.zerock.domain;

import lombok.Data;

@Data
public class CustomImgDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	
}
