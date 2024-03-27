--------------------------------------------------------------------------------첨부파일 테이블
CREATE TABLE Attach_goods (
	UUID VARCHAR2(100) NOT NULL, --첨부파일 난수명(pk)
	UPLOADPATH VARCHAR2(200) NOT NULL, --업로드 경로
	FILENAME VARCHAR2(100) NOT NULL, --?
	FILETYPE CHAR(1) DEFAULT 'I', --확장자
	GNO VARCHAR2(50) --게시글과 연결 
);

ALTER TABLE Attach_goods add constraint pk_attach primary key(uuid);
ALTER TABLE Attach_goods add constraint fk_goods_attach foreign key (gno) references Shop_goods (gno);

DROP TABLE Attach_goods;
--------------------------------------------------------------------------------상품 테이블
CREATE TABLE Shop_goods (
    GNO VARCHAR2(50) PRIMARY KEY, --일련번호
    GNAME VARCHAR2(50), --상품명
    PRICE VARCHAR2(50), --가격
    INFORMATION VARCHAR2(1000) DEFAULT '상품 등록 시 작성하신 정보가 없습니다.', --정보설명
    TITLE_IMG VARCHAR2(1000), --제목 이미지
    INFO_IMG VARCHAR2(1000), --정보 이미지
    UPLOAD_DATE DATE DEFAULT SYSDATE, --업로드일
    UPDATE_DATE DATE DEFAULT SYSDATE --수정일
    MAX_SIZE VARCHAR2(50),
    CUSTOM VARCHAR2(10) --커스텀 여부
);

DROP TABLE Shop_goods;
SELECT * FROM Shop_goods;

insert into Shop_goods (gno, gname, price) values ('11', '테스트11', '1100');


--페이징 확인용으로 약 100개씩 insert 많이 했어용
insert into Shop_goods (gno, gname, price) select goods_seque.nextval, gname, price from Shop_goods;

create sequence goods_seq increment by 1 start with 100;
create sequence goods_sequ increment by 1 start with 200;
create sequence goods_seque increment by 1 start with 300;


SELECT GNO, GNAME, PRICE, INFORMATION, TITLE_IMG, INFO_IMG, UPLOAD_DATE, UPDATE_DATE
	FROM (
			SELECT /*+INDEX_DESC(SHOP_GOODS GNO) */
				ROWNUM RN, GNO, GNAME, PRICE, INFORMATION, TITLE_IMG, INFO_IMG, UPLOAD_DATE, UPDATE_DATE
			FROM
				SHOP_GOODS
			WHERE ROWNUM <= 2 * 10
		 )	
			WHERE RN > (2 - 1) * 10;
			

--------------------------------------------------------------------------------
SELECT * FROM USER_TABLES;
SELECT * FROM SHOP_MEMBER;
			