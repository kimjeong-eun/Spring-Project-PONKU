package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.GoodsVO;

public interface GoodsMapper {
	
	public List<GoodsVO> getList();
	
	public void insert(GoodsVO goods);
	
	public void insertSelectKey(GoodsVO goods);
	
	public GoodsVO read(Long goods_seq);
}
