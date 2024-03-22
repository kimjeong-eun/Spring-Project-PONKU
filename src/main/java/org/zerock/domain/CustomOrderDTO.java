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

	private String orderno; //주문번호
	private String gno; //상품번호
	private String userid; //유저아이디

	private String model_name; //모델명
	private String custom_image; //커스텀이미지
	private String custom_content; //커스텀문구
	private String quantity; //주문수량
	private String totalprice; //총가격
	
	private String payment; //결제수단
	private String order_requset; //요청사항
	private String delevery_request; //배송요청사항
	private String delevery_address; //배송주소 

	
	
	


}
