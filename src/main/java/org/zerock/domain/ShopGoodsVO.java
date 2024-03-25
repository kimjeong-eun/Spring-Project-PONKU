package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ShopGoodsVO {

	private String gno ; //상품번호(상품코드)
	private String gname; //상품명
	private String price; //가격
	private String information; //설명
	private String title_img; //타이틀이미지
	private String info_img; //설명이미지
	private Date upload_date ; //업로드일
	private Date update_date ; //업데이트일
	private String max_size; //최대사이즈(커스텀용)
	private String custom; //커스텀상품 판단 (false/true)
	
}
