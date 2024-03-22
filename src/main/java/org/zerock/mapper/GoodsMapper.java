package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.GoodsVO;

public interface GoodsMapper {
	
	public List<GoodsVO> getList();
	
	public void insert(GoodsVO goods); //파라미터 VO
	public void insertWithOption(GoodsVO goods);
	
	public GoodsVO read(Long gno); //파라미터 gno, 반환 VO
	
	public int delete(Long gno); //파라미터 gno, 반환 int(n개 삭제)
	
	public int update(GoodsVO goods); //파라미터 VO, 반환 int(n개 수정)
}
