package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class GoodsVO {
	private String gno;
	private String gname;
	private String price;
	private String information;
	private String title_img;
	private String info_img;
	private Date upload_date;
	private Date update_date;
	private String max_size;
	private String custom; //커스텀 여부

	private List<GoodsVO> goods_list;
	
	
	//게시물-첨부파일 연동 관리
	private List<GoodsAttachVO> attachList;
}
