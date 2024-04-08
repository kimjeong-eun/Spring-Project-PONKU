package org.zerock.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class AddressVO {
	private long addr_seq; //배송지 기본키(pk)
	private long member_seq; //회원번호 외래키(fk)
	private String isDefault; //기본배송지 여부(default N)
	private String addrName; //배송지별칭
	private String name; //수령인 이름
	private String phone; //수령인 핸드폰번호
	private String address1; //우편번호
	private String address2; //주소
	private String address3; //상세주소
	private Timestamp enroll_date; //등록일
	private Timestamp last_update; //업데이트일
	
	private String type;
}
