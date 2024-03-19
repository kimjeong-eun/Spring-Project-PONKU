package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {	
	//id로 객체 불러오기
	public MemberVO selectMember(String userid); 
	
	//멤버 추가
	public int insertMember(MemberVO member);
	//멤버 권한 추가
	public int insertMemberAuth(AuthVO auth);
	
	public int updateMember(String userid);

	public int deleteMember(String userid);

}
