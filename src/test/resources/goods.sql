create table goods(
    gno number(100,0), --상품 번호
    gname nvarchar2(200) not null, --상품 이름 
    gprice number(100000,0) not null --상품 가격
    gquan number(100,0) --상품 개수
);

drop table goods;
select * from goods;