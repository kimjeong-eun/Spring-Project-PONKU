package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.AddressVO;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {
	//userid로 회원정보를 읽어오는 메서드 (프로그램 내부용)
	public MemberVO selectMember (String userid); 
	
	public MemberVO getIdByNameAndEmail(@Param("email") String email,@Param("name") String name); // email과 name으로 회원정보를 확인하는메서드(사용자용)
		
	public MemberVO getPwByIdAndEmail(@Param("email") String email,@Param("id") String id ); //이메일과 id로 회원정보를 확인하는 메서드 (사용자용)
	
	//멤버 insert
	public int insertMember(MemberVO member);
	
	//멤버 권한 insert
	public int insertMemberAuth(AuthVO auth);
	
	/*** 마이페이지 ***/ 
	//회원정보 업데이트
	public int updateMember(MemberVO member);
	public int updatePw(MemberVO member);
	
	//멤버 정보 삭제
	public int deleteMember(MemberVO member);
	
	/*** 배송지 crud ***/
	public int insertAddress(AddressVO addr);
	public int selectAddress(AddressVO addr);
	public int updateAddress(AddressVO addr);
	public int deleteAddress(AddressVO addr);
}
