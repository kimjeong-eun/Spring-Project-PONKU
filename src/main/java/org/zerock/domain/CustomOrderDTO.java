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
		//뭐가 필요할지 몰라서 다 넣기....
	
	private String orderno; //주문번호
	private String gno; //상품번호
	private String userid; //유저아이디
	private String username; // 주문이름
    private String email; //이메일
    private String phone; //핸드폰 번호
    
	private String model_name; //모델명
	private String casename; //케이스이름
	private String price; //상품개당 가격
	
	private String custom_image; //커스텀이미지저장위치   
	private String caseimgurl; //케이스 이미지 위치
	
	private String custom_content; //커스텀문구
	private String quantity; //주문수량
	private String totalprice; //총가격
	private String payment; //결제수단
	private String order_request; //요청사항
	private String delivery_request; //배송요청사항
	private String delivery_address; //배송주소 
	
	private String orderpw; //주문 비밀번호 (비회원에 해당)
	

}
