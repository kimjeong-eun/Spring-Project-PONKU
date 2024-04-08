package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.GoodsAttachVO;
import org.zerock.domain.GoodsVO;

public interface GoodsService {
	
	public GoodsVO get(String gno); //gno에 해당하는 열의 모든 값
	public List<GoodsVO> getList(); //테이블의 모든 값
	public List<GoodsVO> getList(Criteria cri);
	
	public List<GoodsAttachVO> getAttachList(String gno);
	
	public void register(GoodsVO goods);
	
	public boolean modify(GoodsVO goods);
	
	//여러 열을 바꿀 때는 insert처럼 파라미터로 VO를 받아야 함  
	public boolean remove(long gno);
	boolean remove(String gno); 
	
}
