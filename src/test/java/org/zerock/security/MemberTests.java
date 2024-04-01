package org.zerock.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.mapper.MemberMapper;
import org.zerock.mapper.MemberMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
  })
@Log4j2
public class MemberTests {
	
	  @Setter(onMethod_ = @Autowired)
	  private PasswordEncoder pwencoder; 
	  
	  @Setter(onMethod_ = @Autowired )
	  private MemberMapper mapper;
	  
	  @Setter(onMethod_ = @Autowired)
	  private DataSource ds;  //root-context.xml에 있는dataSource 매핑
	
	  @Test
	  public void testInsertMember() {
		  
		  String sql = "insert into shop_Manager(manager_seq, manager_id, password, manager_name,email,enroll_date,last_update) values (1,?,?,?,?,sysdate,sysdate)";
			
		  Connection con=null;
		  PreparedStatement pstmt=null;
			
	      try {
	    	  con = ds.getConnection();
			  pstmt = con.prepareStatement(sql);
			  
			  pstmt.setString(1,"shop5353");
			  pstmt.setString(2, pwencoder.encode("5353"));
			  pstmt.setString(3,"관리자");
			  pstmt.setString(4,"ponkuu@naver.com");
			  
			  int n = pstmt.executeUpdate();
			  
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

	  }
	  
	  
	  @Test
	  public void testResetMyPassword() {
		  
		  String sql = "update shop_member set password = ? where userid= 'jeongeun2'";
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  
		  try {
			con = ds.getConnection();
			  pstmt = con.prepareStatement(sql);
			  
			  pstmt.setString(1, pwencoder.encode("1234"));
			  
			  int n = pstmt.executeUpdate();
			  
		} catch (SQLException e) {
		
			
			e.printStackTrace();
		}
		  
		  
		  
		  
	  }
	  
	  @Test
	  public void getMember() {
		  
		  mapper.selectMember("jeongeun587");
		 
		  
	  }
	  
	  
	  
}
