package org.zerock.domain;

import java.util.Date;
import java.util.List;

public class ManagerVO {
	private long manager_seq; //기본키(PK)
	private String manager_id; //아이디 
	private String password; //패스워드 
	private String manager_name; //이름
	private String email; //이메일
	
	private Date enroll_date; //가입일
	private Date last_update; //업데이트일
	
}
