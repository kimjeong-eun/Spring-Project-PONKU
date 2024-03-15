package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.MemberVO;

public interface LoginMapper {

		public MemberVO read (String userid);
		
		public MemberVO getIdByNameAndEmail(@Param("email") String email);
		
}
