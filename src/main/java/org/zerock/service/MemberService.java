package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.AddressVO;
import org.zerock.domain.MemberVO;

public interface MemberService {
//서비스 인터페이스
	
	//회원인지 확인하는 메서드(boolean 반환) 
	public boolean isMember(String userid);
	
	//이름과 이메일로 아이디를 찾는 메서드
	public MemberVO findId (String email ,String name);  
	
	// id와 이메일로 패스워드를 찾는 메서드
	public MemberVO findPw (String email ,String id);  
	
	//비밀번호를 초기화 하는메서드(implement에서 바로 sql실행예정)
	public String resetPassword(String newpassword, String id); 
	
	//회원가입 (성공여부 반환)
	public int join(MemberVO member); 

	//회원정보 업데이트 
	public int updateMember(MemberVO member); 
	public int updatePw(MemberVO member);
	
	//회원정보 삭제
	public int deleteMember(MemberVO member);
	
	//배송지 CRUD
	public int insertAddress(AddressVO addr); 
	public List<AddressVO> selectAddress(AddressVO addr); 
	public int updateAddress(AddressVO addr); 
	public int updateDefaultAddress(AddressVO addr); //기본배송지 변경
	public int deleteAddress(AddressVO addr); 

}
