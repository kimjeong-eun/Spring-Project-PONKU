package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ManagerVO { //관리자 insert시 pwencoder사용 위해 임시 생성
	private long manager_seq;
	private String manager_id;
	private String password;
	private String manager_name;
	private String email;
	
	private Date enroll_date; //가입일
	private Date last_update; //업데이트일
	
	private List<AuthVO> authList; //권한리스트
}
