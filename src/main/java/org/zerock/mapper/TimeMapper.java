package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	//@Select("Select sysdate from dual") // 주의사항 sql문 뒤에 ; 쓰지 않음
	public String getTime();
	public String getTime2(); //xml을 매핑하는 sql문
	
	
	
}
