package org.zerock.domain;

import lombok.Data;

@Data
public class AskListLockDTO {
	// lock.jsp에서 비밀번호를 입력하고 ajax로 보낼 때 입력받은 비밀번호와, 넘겨받은 ask_list_no를 가진다.
	private String password;
    private Long ask_list_no;

}
