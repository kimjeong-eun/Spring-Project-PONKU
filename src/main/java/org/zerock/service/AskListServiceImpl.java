package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AskListAttachVO;
import org.zerock.domain.AskListPageDTO;
import org.zerock.domain.AskListVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.AskListAttachMapper;
import org.zerock.mapper.AskListMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AskListServiceImpl implements AskListService {
	
	@Setter(onMethod_ = @Autowired)
	private AskListMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private AskListAttachMapper attachMapper;
	
	@Override
	public List<AskListVO> getList() {
		log.info("service 영역에서 getList 메서드 실행");
		return mapper.getList();
	}
	
	@Override
	public AskListPageDTO getListWithPaging(Criteria cri) {
		log.info("service 영역에서 getListWithPaging 메서드 실행");
		log.info("cri : " + cri.getType() + "," + cri.getKeyword());
		return new AskListPageDTO(mapper.getTotalCount(cri), mapper.getListWithPaging(cri));
	}
	
	@Transactional
	@Override
	public void register(AskListVO askList) {
		log.info("service 영역에서 register 메서드 실행");
		mapper.insertSelectKey(askList);
		
		if (askList.getAttachList() != null || askList.getAttachList().size() > 0) {
			askList.getAttachList().forEach(attach -> {
				attach.setAno(askList.getAsk_list_no());
				attachMapper.insert(attach);
			});
		}
	}

	@Override
	public AskListVO get(Long ask_list_no) {
		log.info("service 영역에서 get 메서드 실행");
		AskListVO result = mapper.read(ask_list_no);
		List<AskListAttachVO> attachList = attachMapper.findByAno(ask_list_no); 
		result.setAttachList(attachList);
		return result;
	}
	
	@Transactional
	@Override
	public boolean remove(Long ask_list_no) {
		log.info("service 영역에서 remove 메서드 실행");
		return mapper.delete(ask_list_no) == 1;
	}
	
	@Transactional
	@Override
	public boolean modify(AskListVO askList) {
		log.info("service 영역에서 modify 메서드 실행");
		return mapper.update(askList) == 1;
	}

	@Override
	public List<AskListAttachVO> getAttachList(Long ano) {
		log.info("service 영역에서 getAttachList 메서드 실행" + ano);
		return attachMapper.findByAno(ano);
	}

	@Override
	public void removeAttach(Long ano) {
		log.info("service 영역에서 removeAttach 메서드 실행");
		attachMapper.deleteAll(ano);
	}

	@Override
	public boolean checkLock(Long ask_list_no) {
		log.info("service 영역에서 checkLock 메서드 실행");
		return mapper.checkLock(ask_list_no);
	}

	@Override
	public String askPassword(Long ask_list_no) {
		log.info("service 영역에서 askPassword 메서드 실행");
		return mapper.askPassword(ask_list_no);
	}


}
