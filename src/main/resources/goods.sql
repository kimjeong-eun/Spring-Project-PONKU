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

INSERT INTO Shop_Goods (GNO, GNAME, PRICE, INFORMATION) VALUES ('20', '테스트20', '20', '테스트20 상품 설명입니다');
INSERT INTO Shop_Goods (GNO, GNAME, PRICE, INFORMATION) VALUES ('3', '테스트3', '30000', '테스트3 상품 설명입니다');
INSERT INTO Shop_Goods (GNO, GNAME, PRICE, INFORMATION) VALUES ('4', '테스트4', '40000', '테스트4 상품 설명입니다');
INSERT INTO Shop_Goods (GNO, GNAME, PRICE, INFORMATION) VALUES ('5', '테스트5', '550000', '테스트5 상품 설명입니다');

insert into Shop_goods (gno, gname, price) values ('11', '테스트11', '1100');

SELECT * FROM Shop_goods;

create sequence goods_seq increment by 1 start with 100;
create sequence goods_sequ increment by 1 start with 200;
create sequence goods_seque increment by 1 start with 300;


insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');
insert into Shop_goods (gno, gname, price) values (goods_seq.nextval, '테스트 백', '100');



insert into Shop_goods (gno, gname, price) select goods_seque.nextval, gname, price from Shop_goods;


select * from user_tables;
select * from SHOP_MEMBER;

select gno, gname, price, information, title_img, info_img, upload_date, update_date
	from (
			select /*+INDEX_DESC(Shop_goods gno) */
				rownum rn, gno, gname, price, information, title_img, info_img, upload_date, update_date
			from
				Shop_goods
			where rownum <= 2 * 10
		 )	
			where rn > (2 - 1) * 10;