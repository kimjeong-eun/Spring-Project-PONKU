package org.zerock.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds; //히카리시피 데이터소스
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder; //스프링 시큐리티에서 제공하는 인코더
	

	@Override
	public String join(MemberVO member) {
		String result = "";
		String sql = "insert into shop_member (member_seq, userid, password, username, gender, email, phone, adress1, adress2, adress3, enroll_date, last_update)"
				+ "values (member_seq.nextval, ?, ?, ?, ?, ?, ?, null, null, null, sysdate, sysdate)";
		
		String sql2 = "insert into shop_authority (AUTHORITY) values (?)";
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			//스프링 시큐리티를 사용하기 위해 인코더 사용
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, pwencoder.encode(member.getPassword()));
			pstmt.setString(3, member.getUsername());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getPhone());
			
			int n = pstmt.executeUpdate();
			
			if(n>0) {
				result = "success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
}
