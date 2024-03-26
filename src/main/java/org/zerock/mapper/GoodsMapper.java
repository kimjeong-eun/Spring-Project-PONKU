package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.GoodsVO;

public interface GoodsMapper {
	
	public GoodsVO read(String gno); //파라미터 gno, 반환 VO
	public List<GoodsVO> getList();
	
	public void insert(GoodsVO goods); //파라미터 VO
	public void insertWithOption(GoodsVO goods);
	
	public int update(GoodsVO goods); //파라미터 VO, 반환 int(n개 수정)
	
	public int delete(String gno); //파라미터 gno, 반환 int(n개 삭제)
}
