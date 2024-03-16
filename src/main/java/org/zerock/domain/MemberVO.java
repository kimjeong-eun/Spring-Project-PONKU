package org.zerock.domain;



import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private long member_seq; //기본키
	private String userid;
	private String password;
	private String username;
	private String email;
	
	private long age;
	private char gender;
	private String phone;
	private String address;
	private Date enroll_date;
	private Date last_update;
	
	private List<AuthVO> authList;
	
}
