package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.GoodsAttachVO;
import org.zerock.domain.GoodsVO;
import org.zerock.mapper.GoodsAttachMapper;
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
	
	@Setter(onMethod_ = @Autowired)
	private GoodsAttachMapper attachMapper;
	
	@Override
	public GoodsVO get(String gno) { //gno에 해당하는 모든 값 출력 
		log.info("get......" + gno);
		
		return mapper.read(gno);
	}
	
	@Override
	public List<GoodsVO> getList() {
		log.info("getList......");
		
		return mapper.getList();
	}
	
	@Override
	public List<GoodsVO> getList(Criteria cri) {
		log.info("getList with Criteria" + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<GoodsAttachVO> getAttachList(String gno) { 
		log.info("get Attach List by gno " + gno);
		
		return attachMapper.findByGno(gno);
	}

	@Transactional
	@Override
	public void register(GoodsVO goods) {
	    log.info("register......" + goods);
	    
	    mapper.insert(goods);
	    
	    // attachList가 null이거나 비어있는 경우 처리
	    if (goods.getAttachList() == null || goods.getAttachList().isEmpty()) {
	        return;
	    }
	    
	    // attachList에 있는 각 attach에 gno 설정 후 삽입
	    for (GoodsAttachVO attach : goods.getAttachList()) {
	        if (attach != null) {
	            attach.setGno(goods.getGno());
	            attachMapper.insert(attach);
	        }
	    }
	}


	@Override
	public boolean modify(GoodsVO goods) {
		
		log.info("modify......" + goods);
		return mapper.update(goods) == 1;
	}

	@Override
	public boolean remove(String gno) {
		log.info("remove......" + gno);
		
		return mapper.delete(gno) == 1; //delete() == 1(성공)이면 T
	}

	@Override
	public boolean remove(long gno) {
		// TODO Auto-generated method stub
		return false;
	}
}
