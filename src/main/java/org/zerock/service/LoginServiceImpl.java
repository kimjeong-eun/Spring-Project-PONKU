package org.zerock.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.LoginMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service //서비스 계층
public class LoginServiceImpl implements LoginService {

	@Setter(onMethod_ = @Autowired )
	private LoginMapper loginMapper ;
	
	@Setter(onMethod_= @Autowired )
	private DataSource ds; 
	
	@Setter(onMethod_ =@Autowired )
	private PasswordEncoder pwencoder;
	
	@Override
	public boolean isMember(String userid) {
	//멤버이면 true 반환
		return loginMapper.read(userid) == null ? false : true;
	}

	@Override
	public MemberVO findId(String email , String name) {
		// 이름과 이메일로 정보를 찾는다
		return loginMapper.getIdByNameAndEmail(email ,name);
	}

	@Override
	public MemberVO findPw(String email, String id) {
		// 아이디와 이메일로 정보를 찾는다
		return loginMapper.getPwByIdAndEmail(email, id);
	}

	@Override
	public String resetPassword(String newpassword, String id) {
		// 새로운 패스워드로 사용자의 비밀번호를 reset하는 메서드 (비밀번호찾기 -> 비밀번호 초기화)
		// encoder 사용을 위해 매퍼 사용 x
		String resetResult ="";
		String sql = "update shop_member set password = ? where userid = ?";
		PreparedStatement pstmt =null;
		Connection con =null;
		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			//스프링 시큐리티를 사용하기 위해 인코더 사용
			pstmt.setString(1, pwencoder.encode(newpassword));
			pstmt.setString(2, id);
			
			int n = pstmt.executeUpdate();
			
			if(n>0) {
				//비밀번호 변경 성공 시 success 문자열 반환 
				resetResult="success";
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			
			try {
				pstmt.close();
				con.close();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}	
		}

		return resetResult;
		
	}

}
