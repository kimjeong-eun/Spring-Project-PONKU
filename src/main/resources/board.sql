create table board (
  bno number(10,0) primary key,
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate, 
  updatedate date default sysdate
);

create table comments(
    id number(10, 0) primary key,
   	rno number(10, 0),
    replyer varchar2(50) not null,
    content varchar2(1000) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

<<<<<<< HEAD

CREATE TABLE attach_review (
  uuid VARCHAR2(100) PRIMARY KEY, -- 첨부파일 난수명(pk)
  uploadpath VARCHAR2(200) NOT NULL, -- 업로드 경로
  filename VARCHAR2(100) NOT NULL, -- 파일명
  filetype CHAR(1) DEFAULT 'I', -- 확장자
  bno NUMBER(10,0), -- 게시글과 연결
  CONSTRAINT fk_board_attach FOREIGN KEY (bno) REFERENCES board (bno)
);



drop table Attach_review;

select * from comments;
select * from board;

alter table comments drop foreign key fk_com;

alter table comments add constraint fk_comments_board foreign key (rno) references board(bno) on delete cascade;

ALTER TABLE comments ADD CONSTRAINT fk_com FOREIGN KEY (rno) REFERENCES board(bno);

select comments, 

alter table board add (replycnt number default 0);
update board set replycnt = (select count(rno) from comments where comments.rno = board.bno);


=======
select * from comments;
>>>>>>> branch 'review2' of https://github.com/kimjeong-eun/shopProject.git

create index idx_cm on comments (id desc, rno asc);

ALTER TABLE comments MODIFY (content VARCHAR2(1000) NULL);


select * from board order by bno asc;

create sequence id_num;

create sequence bno_seq;

-- 첫 번째 댓글 더미 데이터 삽입
INSERT INTO comments (id, rno, replyer, content, replyDate, updateDate)
VALUES (bno_seq.nextval, 1, 'user1', '첫 번째 댓글입니다.', SYSDATE, SYSDATE);

-- 두 번째 댓글 더미 데이터 삽입
INSERT INTO comments (id, rno, replyer, content, replyDate, updateDate)
VALUES (bno_seq.nextval, 4, 'user2', '두 번째 댓글입니다.', SYSDATE, SYSDATE);

-- 세 번째 댓글 더미 데이터 삽입
INSERT INTO comments (id, rno, replyer, content, replyDate, updateDate)
VALUES (bno_seq.nextval, 6, 'user3', '세 번째 댓글입니다.', SYSDATE, SYSDATE);

-- 네 번째 댓글 더미 데이터 삽입
INSERT INTO comments (id, rno, replyer, content, replyDate, updateDate)
VALUES (bno_seq.nextval, 7, 'user4', '네 번째 댓글입니다.', SYSDATE, SYSDATE);

-- 다섯 번째 댓글 더미 데이터 삽입
INSERT INTO comments (id, rno, replyer, content, replyDate, updateDate)
VALUES (bno_seq.nextval, 8, 'user5', '다섯 번째 댓글입니다.', SYSDATE, SYSDATE);




INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목1', '내용1', '작성자1', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목2', '내용2', '작성자2', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목3', '내용3', '작성자3', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목4', '내용4', '작성자4', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목5', '내용5', '작성자5', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목6', '내용6', '작성자6', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목7', '내용7', '작성자7', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목8', '내용8', '작성자8', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목9', '내용9', '작성자9', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목10', '내용10', '작성자10', sysdate, sysdate);

INSERT INTO board (bno, title, content, writer, regdate, updatedate) 
VALUES (bno_seq.nextval, '제목11', '내용11', '작성자11', sysdate, sysdate);







drop table comments;
drop table board;

