package org.zerock.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String uuid;
	private String uploadpath;
	private String filename;
	private boolean image;

}
