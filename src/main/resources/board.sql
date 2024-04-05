create table board (
  bno number(10,0) primary key,
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate, 
  updatedate date default sysdate
);

create table comments(
    rno number(10, 0) primary key,
   	bno number(10, 0),
    replyer varchar2(50) not null,
    content varchar2(1000) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);


update shop_member set email = 'jeongeun587@navver.com' where member_seq = 64;

alter table comments add constraint fk_comments foreign key (bno) references board (bno);

alter table board drop constraint fk_comments;

INSERT INTO comments (rno, bno, replyer, content, replyDate, updateDate)
VALUES (id_num.nextval, 1, '작성자1', '첫 번째 더미 댓글입니다.', SYSDATE, SYSDATE);

INSERT INTO comments (rno, bno, replyer, content, replyDate, updateDate)
VALUES (id_num.nextval, 2, '작성자2', '두 번째 더미 댓글입니다.', SYSDATE, SYSDATE);

INSERT INTO comments (rno, bno, replyer, content, replyDate, updateDate)
VALUES (id_num.nextval, 3, '작성자3', '세 번째 더미 댓글입니다.', SYSDATE, SYSDATE);

INSERT INTO comments (rno, bno, replyer, content, replyDate, updateDate)
VALUES (id_num.nextval, 4, '작성자4', '네 번째 더미 댓글입니다.', SYSDATE, SYSDATE);

INSERT INTO comments (rno, bno, replyer, content, replyDate, updateDate)
VALUES (id_num.nextval, 5, '작성자5', '다섯 번째 더미 댓글입니다.', SYSDATE, SYSDATE);


CREATE TABLE attach_review (
  uuid VARCHAR2(100) PRIMARY KEY, -- 첨부파일 난수명(pk)
  uploadpath VARCHAR2(200) NOT NULL, -- 업로드 경로
  filename VARCHAR2(100) NOT NULL, -- 파일명
  filetype CHAR(1) DEFAULT 'I', -- 확장자
  bno NUMBER(10,0), -- 게시글과 연결
  CONSTRAINT fk_board_attach FOREIGN KEY (bno) REFERENCES board (bno)
);

ALTER TABLE attach_review MODIFY uploadpath VARCHAR2(200) not NULL;


select * from board where rownum < 10 order by bno desc;

select * from board;
select * from attach_review;
select * from comments;

drop table Attach_review;
drop table comments;

select * from comments;
select * from board;

alter table comments drop foreign key fk_com;

alter table comments add constraint fk_comments_board foreign key (rno) references board(bno) on delete cascade;

ALTER TABLE comments ADD CONSTRAINT fk_com FOREIGN KEY (rno) REFERENCES board(bno);


alter table board add (replycnt number default 0);
update board set replycnt = (select count(rno) from comments where comments.rno = board.bno);


=======
select * from comments;
>>>>>>> branch 'review2' of https://github.com/kimjeong-eun/shopProject.git

create index idx_cm on comments (id desc, rno asc);

ALTER TABLE comments MODIFY (content VARCHAR2(1000) NULL);


select * from board order by bno asc;

create sequence id_num;

create sequence bno_seq start with 1 increment by 1 nocache nocycle;

drop sequence bno_seq;






INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '최고의 케이스!', '멋진 디자인과 편리한 사용성을 가진 케이스입니다. 
외관이 아름답고 내부 공간이 넉넉해서 노트북을 보호하면서도 편리하게 사용할 수 있어요.', '김정은', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '가벼운 케이스', '가볍고 휴대하기 편한 케이스입니다. 
노트북을 어디든지 편리하게 들고 다닐 수 있어서 좋아요.', '김수영', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '내구성 좋은 케이스', '내구성이 뛰어난 케이스입니다. 
견고한 소재로 제작되어 노트북을 완벽하게 보호해줍니다.', '최범근', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '심플한 케이스', '심플한 디자인과 기능적인 내부 공간을 가진 케이스입니다. 
간결하면서도 효율적으로 사용할 수 있어서 좋아요.', '김정은', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '안정적인 케이스', '노트북을 안정적으로 보호해주는 케이스입니다. 
안전한 보관과 사용을 위해 완벽한 선택이에요.', '이나연', sysdate, sysdate);









drop table comments;
drop table board;

