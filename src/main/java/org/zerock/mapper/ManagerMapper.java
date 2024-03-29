package org.zerock.mapper;

import org.zerock.domain.ManagerVO;

public interface ManagerMapper {
//매니저 insert
	public int insertManager(ManagerVO manager);
	
	public ManagerVO read(String manager_id);
}
