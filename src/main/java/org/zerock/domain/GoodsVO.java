package org.zerock.domain;

import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
public class GoodsVO {
	private long gno;
	private String gname;
	private int price;
	private int quantity;
	private String information;
	private String title_img;
	private String info_img;
	private Date upload_date;
	private Date update_date;

	//private List<GoodsVO> goods_list;
}
