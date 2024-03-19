package org.zerock.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class MemberServiceImpl implements MemberService{

	
	  @Setter(onMethod_ = @Autowired)
	  private MemberMapper mapper;
	  
	  @Setter(onMethod_ = @Autowired)
	  private PasswordEncoder pwencoder; //스프링 시큐리티에서 제공하는 인코더
	  
	  //회원가입
	  
	  @Transactional //트랜잭션 작업 1개라도 실패하면 rollback!
	  @Override
	  public int join(MemberVO member){
		  int result = 0; 
		  String message = "member insert 예외 발생";
		  member.setPassword(pwencoder.encode(member.getPassword()));
	  
	  result = mapper.insertMember(member); 
	  
	  if(result == 0) {
		  log.info(message);
		  throw new RuntimeException(message);
	  } 
	  
	  AuthVO auth = new AuthVO();
	  auth.setMember_seq(result); //selectKey로 member_seq 값 받음
	  auth.setAuth("ROLE_MEMBER"); result = mapper.insertMemberAuth(auth);
	  if(result == 0) { 
		  log.info(message); throw new RuntimeException(message);
	  }
	  return result; 
	 }

}
