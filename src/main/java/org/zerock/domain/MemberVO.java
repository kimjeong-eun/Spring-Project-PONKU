package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private long member_seq; //기본키(PK)
	private String userid; //아이디 
	private String password; //패스워드 
	private String username; //이름
	private String phone; //핸드폰번호
	private String email; //이메일
	private String birth; //생년월일
	
	private Date enroll_date; //가입일
	private Date last_update; //업데이트일
	private Date delete_date; //탈퇴일
	private String isMember; //회원 사용 여부(탈퇴 시 N)
	
	private List<AuthVO> authList; //권한리스트
	private List<AddressVO> addrList; //배송지 리스트
	
}

