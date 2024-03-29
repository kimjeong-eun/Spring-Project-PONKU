
---- 상품 테이블
CREATE TABLE Shop_goods (
    GNO VARCHAR2(50) PRIMARY KEY, --상품 번호
    GNAME VARCHAR2(50) , --상품명
    PRICE varchar2(50) , --가격
    INFORMATION VARCHAR2(1000) DEFAULT '상품 등록 시 작성하신 정보가 없습니다', --정보설명
    TITLE_IMG VARCHAR2(1000) , --제목 이미지 url 
    INFO_IMG VARCHAR2(1000) , --정보 이미지
    UPLOAD_DATE DATE DEFAULT SYSDATE, --업로드일
    UPDATE_DATE DATE DEFAULT SYSDATE, --수정일
    MAX_SIZE varchar2(50), -- 커스텀 시 최대 사이즈 
    CUSTOM varchar2(10) --커스텀 유무
); 

alter table Shop_goods modify PRICE varchar2(50);
alter table Shop_goods modify MAX_SIZE varchar2(50);
alter table Shop_goods rename column MAXSIZE to MAX_SIZE;

select * from shop_goods;

delete from Shop_goods where GNO = '주문상품목록확인필요';
insert into Shop_goods values('주문상품목록확인필요','','','','','',sysdate,sysdate,'90','true');
insert into Shop_goods values('ip0327','글라스 범퍼 케이스','16000','글라스 범퍼 케이스 재주문률 best!','/resources/img/iphone.png','',sysdate,sysdate,'','');
insert into Shop_goods values('ip0328','맥세이프 투명젤 케이스','20000','맥세이프 호환 가능!!','/resources/img/iphonemacsafe.png','',sysdate,sysdate,'120','true');
insert into Shop_goods values('ip0329','비누 젤','15000','기분전환용 케이스로 추천 !','/resources/img/iphonesoap.png','',sysdate,sysdate,'90','true');

delete from Shop_goods;

select * from Custom_Shop_goods;

--커스텀 케이스 재고 테이블 
CREATE TABLE Custom_Shop_goods_stock(

     GNO VARCHAR2(50) references Custom_Shop_goods(GNO) on delete cascade, --상품 번호
     QUANTITY NUMBER(3, 0) --수량
     
);

select * from Custom_Shop_goods_stock;
-------수량 테이블----------
create or replace trigger Custom_stock_trigger
after
insert on Custom_Shop_goods
for each row
begin
if inserting then
    insert into Custom_Shop_goods_stock(GNO,QUANTITY) values(:new.GNO,50);
    end if;
end;

---------------------------------
---권한 트리거

create or replace trigger auth_tigger
after
insert on shop_member
for each row
begin

if inserting then
    insert into Shop_Authority(MEMBER_SEQ ,authority) values(:new.member_seq , 'ROLE_MEMBER');
   
    end if;
end;

--커스텀 케이스 주문 테이블

CREATE TABLE Order_custom_goods ( 
    ORDERNO VARCHAR2(150) PRIMARY KEY , --주문번호
    GNO VARCHAR2(50) references Custom_Shop_goods(GNO) ON DELETE SET NULL,--상품번호
    USERID VARCHAR2(50), --유저아이디
    EMAIL VARCHAR2(50),--유저 이메일
    PHONE VARCHAR2(50),
    MODEL_NAME VARCHAR2(100),--모델명
   
    CASENAME VARCHAR2(100),--케이스 이름
    PRICE VARCHAR2(50), --케이스 가격
    CUSTOM_IMAGE VARCHAR2(1500), --커스텀이미지
    CUSTOM_CONTENT VARCHAR2(1000), --커스텀 문구
    QUANTITY VARCHAR2(50), --수량
    TOTALPRICE VARCHAR2(50), --총 가격
    
    PAYMENT VARCHAR2(100), --결제수단
    ORDER_REQUEST VARCHAR2(1000), --요청사항
    DELIVERY_REQUEST VARCHAR2(1000),--배송요청사항
    DELIVERY_ADDRESS VARCHAR2(150), --배송주소 
    ORDERPW VARCHAR2(50) DEFAULT NULL, -- 구매비밀번호 
    CASEIMGURL VARCHAR2(150), --케이스 이미지 URL (이미지 불러올 때 필요...)
    USERNAME VARCHAR2(10) ,-- 유저이름
    order_date DATE DEFAULT SYSDATE --주문일
); 

select * from order_custom_goods;
drop table  Custom_goods_order;

select orders.orderno , orders.username,orders.userid,orders.email,orders.phone,orders.totalprice,
	orders.payment,orders.order_request,orders.delivery_request,orders.delivery_address,orders.order_date,
	goods.gno,goods.model_name,goods.caseimgurl,goods.quantity from Order_custom_goods orders , ordered_goods goods where orders.ORDERNO = goods.ORDERNO and to_char(orders.order_date,'YYYY-MM-DD')='2024-03-28';
	
select orders.orderno , orders.username,orders.userid,orders.email,orders.phone,orders.totalprice,
	orders.payment,orders.order_request,orders.delivery_request,orders.delivery_address,orders.order_date,
	goods.gno,goods.model_name,goods.caseimgurl,goods.quantity from Order_custom_goods orders , ordered_goods goods where orders.ORDERNO = goods.ORDERNO and orders.order_date between TRUNC(to_date('2024-03-28','YYYY-MM-DD')) and sysdate;
	
select orders.orderno , orders.username,orders.userid,orders.email,orders.phone,orders.totalprice,
	orders.payment,orders.order_request,orders.delivery_request,orders.delivery_address,orders.order_date,
	goods.gno,goods.model_name,goods.caseimgurl,goods.quantity, shop.gname casename from Order_custom_goods orders , ordered_goods goods ,shop_goods shop where orders.ORDERNO = goods.ORDERNO and TRUNC(orders.order_date) between TRUNC(to_date('2024-03-27','YYYY-MM-DD')) and TRUNC(to_date('2024-03-28','YYYY-MM-DD')) and orders.gno = shop.gno;

select * from Order_custom_goods where userid='jeongeun587' and orderno like '%custom%' and TRUNC(orders.order_date) between TRUNC(to_date('2024-03-27','YYYY-MM-DD')) and TRUNC(to_date('2024-03-27','YYYY-MM-DD'));
	
	select TRUNC(to_date('2024-03-27','YYYY-MM-DD')) from dual;

alter table Custom_goods_order add CASEIMGURL VARCHAR2(150);
alter table Order_custom_goods add order_date DATE DEFAULT SYSDATE;

--쇼핑카트 시퀀스 
CREATE SEQUENCE SHOPPING_SEQ INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;

alter table shopping_cart add quantity VARCHAR2(50) default '1';
alter table shopping_cart add model VARCHAR2(100);

select * from shopping_cart;

delete from shopping_cart;
select * from shop_member;


----주문 상품 조회
create table ordered_goods(
 ORDERNO VARCHAR2(150) references Order_custom_goods(ORDERNO),
 GNO VARCHAR2(50) references Shop_goods(GNO),
 MODEL_NAME VARCHAR2(100), --기종
 CASEIMGURL VARCHAR2(150), --케이스이미지 url
 QUANTITY VARCHAR2(50) default '1' --상품수량
);

select * from ordered_goods;
drop table ordered_goods;

-------주문시퀀스-------
CREATE SEQUENCE ORDER_SEQ INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;


-----트리거-------
create or replace trigger auth_trigger
after
insert on SHOP_MANAGER
for each row
begin
if inserting THEN
    insert into Shop_Authority(MANAGER_SEQ ,authority) values(:new.manager_seq , 'ROLE_ADMIN');
   
    end if;
end;
/


select * from shop_manager;


------

select orders.orderno , orders.username,orders.userid,orders.email,orders.phone,orders.totalprice,
		orders.payment,orders.order_request,orders.delivery_request,orders.delivery_address,orders.order_date, shop_goods.gname casename,
			goods.gno,goods.model_name,goods.caseimgurl,goods.quantity from Order_custom_goods orders , ordered_goods goods , shop_goods where orders.ORDERNO = goods.ORDERNO and TRUNC(orders.order_date) between TRUNC(to_date('2024-03-27','YYYY-MM-DD')) and TRUNC(to_date('2024-03-28','YYYY-MM-DD')) and orders.userid='jeongeun587' and shop_goods.gno=goods.gno ; 



