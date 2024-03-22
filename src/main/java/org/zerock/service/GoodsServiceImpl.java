package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.GoodsVO;
import org.zerock.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor //모든 파라미터를 이용하는 생성자
public class GoodsServiceImpl implements GoodsService {

	//mapper의 context 자동 주입
	@Setter(onMethod_ = @Autowired)
	private GoodsMapper mapper;

	@Override
	public void register(GoodsVO goods) {
		log.info("register......" + goods);
		
		mapper.insert(goods);
	}

	@Override
	public boolean modify(GoodsVO goods) {
		
		log.info("modify......" + goods);
		return mapper.update(goods) == 1;
	}

	@Override
	public boolean remove(Long gno) {
		log.info("remove...." + gno);
		
		return mapper.delete(gno) == 1; //delete() == 1(성공)이면 T
	}

	@Override
	public GoodsVO get(Long gno) { //gno에 해당하는 모든 값 출력 
		log.info("get......" + gno);
		
		return mapper.read(gno);
	}
	
	@Override
	public List<GoodsVO> getList() {
		log.info("getList......");
		
		return mapper.getList();
	}
}
