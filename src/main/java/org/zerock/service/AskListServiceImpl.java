package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AskListVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.AskListMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AskListServiceImpl implements AskListService {
	
	@Setter(onMethod_ = @Autowired)
	private AskListMapper mapper;
	
	@Override
	public List<AskListVO> getList() {
		log.info("service 영역에서 getList 메서드 실행");
		return mapper.getList();
	}
	
	@Override
	public List<AskListVO> getListWithPaging(Criteria cri) {
		log.info("service 영역에서 getListWithPaging 메서드 실행");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(AskListVO askList) {
		log.info("service 영역에서 register 메서드 실행");
		mapper.insert(askList);
		
	}

	@Override
	public AskListVO get(Long ask_list_no) {
		log.info("service 영역에서 get 메서드 실행");
		return mapper.read(ask_list_no);
	}

	@Override
	public boolean remove(Long ask_list_no) {
		log.info("service 영역에서 remove 메서드 실행");
		return mapper.delete(ask_list_no) == 1;
	}

	@Override
	public boolean modify(AskListVO askList) {
		log.info("service 영역에서 modify 메서드 실행");
		return mapper.update(askList) == 1;
	}

	

}
