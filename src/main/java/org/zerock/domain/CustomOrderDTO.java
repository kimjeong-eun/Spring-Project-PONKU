package org.zerock.domain;


import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomOrderDTO {


	public String filePath ;

	public String modelinput;

	public String codeinput; 

	public String customcontent;

	public String quantity; 

	public String totalprice; 

}
