package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter // root-context에 빈으로 등록해야 게터를 준다
public class Criteria {

	private int pageNum;		// 현재 페이지 번호
	private int amount;			// 게시물 몇개씩 보일것인지

	private String type;		// 검색타입
	private String keyword;		// 검색어

	public Criteria() {			// 기본생성자(테스트용)
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {	// 페이지 번호를 넘겨받아서 생성자
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {	// 검색타입이 null이면 빈문자열반환.. ? 뭔소리야

		return type == null ? new String[] {} : type.split("");
	}

	public String getListLink() {	// 뭔소리야 

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();

	}
}
