package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ShoppingCartVO {
	
	private String cart_no; //쇼핑카드 번호 (순서)
	private long member_seq; //멤버시퀀스
	private String gno; //상품번호(상품코드)
	private Date enroll_date; //쇼핑카트 등록일
	private String image; //이미지 url
	private String quantity; // 수량
	private String model;//모델명
	
	
	private String price; // 가격
	private String gname; //케이스이름
}
