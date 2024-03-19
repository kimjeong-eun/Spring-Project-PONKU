select * from user_tables;
select * from SHOP_MEMBER;

-- 문의 게시판 게시글 테이블(완료)
create table ask_list(
	ask_list_no number(10,0) constraint ask_list_no_pk primary key,		-- 게시판 게시글 번호
	ask_list_inquirytype nvarchar2(50) not null, 						-- 문의종류
	ask_list_productno number(10,0), 									-- 상품정보(fk 예정)
	ask_list_title nvarchar2(200) not null, 							-- 제목
	ask_list_content nvarchar2(2000) not null, 							-- 내용
	ask_list_writer nvarchar2(50) not null, 							-- 작성자(fk 예정)
	ask_list_regdate date default sysdate not null, 					-- 작성일
	ask_list_updatedate date default sysdate, 							-- 수정일
	ask_list_attach number(1) not null, 								-- 첨부파일여부(1, 0)
	ask_list_lock number(1) not null, 									-- 비밀글여부(1, 0)
	ask_list_lock_password varchar2(100)								-- 비밀번호(비밀글(1)일 때)
);

-- ask_list_no sequence(완료)
create sequence seq_ask_list_no;

-- 더미데이터(완료)
insert into ask_list(ask_list_no, ask_list_inquirytype, ask_list_title, ask_list_content, ask_list_writer, ask_list_updatedate, ask_list_attach, ask_list_lock, ask_list_lock_password) values(seq_ask_list_no.nextval, '교환반품', '반품문의 드립니다.', '상품에 스크래치가 있네요, 반품하고 싶은데 어떻게 해야하나요?', 'user1', null, 0, 1, '1234');

-- ask_list_조회용
select * from ASK_LIST order by ask_list_no desc;

-- 더미데이터 삭제용
delete from ask_list;