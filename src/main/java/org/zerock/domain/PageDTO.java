package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	// 현재 시작, 마지막 페이지를 구하고 진짜 마지막 페이지를 구하고
	// 이전, 다음을 표시할 것인지 구한다.

  private int startPage; // 시작 페이지
  private int endPage; // 마지막 페이지
  private boolean prev, next; // 이전, 다음

  private int total; // 게시물 전체 개수
  private Criteria cri; // 현재 페이지 번호, 몇개의 게시물 표시할건지

  public PageDTO(Criteria cri, int total) {

    this.cri = cri;
    this.total = total;

    this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

    this.startPage = this.endPage - 9;

    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount())); // 아예 마지막

    if (realEnd < this.endPage) {
      this.endPage = realEnd;
    }

    this.prev = this.startPage > 1;

    this.next = this.endPage < realEnd;
  }
  
}

