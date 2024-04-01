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
	
	//주소
	//private String address1; //우편번호
	//private String address2; //주소
	//private String address3; //상세주소 기입
	
	private Date enroll_date; //가입일
	private Date last_update; //업데이트일
	
	private String isMember; //활성화 비활성화 여부
	
	private List<AuthVO> authList; //권한리스트
	private List<AddressVO> addrList; // 배송지 리스트
	
}

