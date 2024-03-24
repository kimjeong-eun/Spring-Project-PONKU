
-----커스텀 상품 테이블
CREATE TABLE Custom_Shop_goods (
    GNO VARCHAR2(50) PRIMARY KEY, --상품 번호
    GNAME VARCHAR2(50) , --상품명
    PRICE varchar2(50) , --가격
    INFORMATION VARCHAR2(1000) DEFAULT '상품 등록 시 작성하신 정보가 없습니다', --정보설명
    TITLE_IMG VARCHAR2(1000) , --제목 이미지 url 
    INFO_IMG VARCHAR2(1000) , --정보 이미지
    UPLOAD_DATE DATE DEFAULT SYSDATE, --업로드일
    UPDATE_DATE DATE DEFAULT SYSDATE, --수정일
    MAX_SIZE varchar2(50) -- 커스텀 시 최대 사이즈 
); 

alter table Custom_Shop_goods modify PRICE varchar2(50);
alter table Custom_Shop_goods modify MAX_SIZE varchar2(50);
alter table Custom_Shop_goods rename column MAXSIZE to MAX_SIZE;


insert into Custom_Shop_goods values('ip0327','글라스 범퍼 케이스','16000','글라스 범퍼 케이스 재주문률 best!','/resources/img/iphone.png','',sysdate,sysdate,'90');
insert into Custom_Shop_goods values('ip0328','맥세이프 투명젤 케이스','20000','맥세이프 호환 가능!!','/resources/img/iphonemacsafe.png','',sysdate,sysdate,'120');
insert into Custom_Shop_goods values('ip0329','비누 젤','15000','기분전환용 케이스로 추천 !','/resources/img/iphonesoap.png','',sysdate,sysdate,'90');

select * from Custom_Shop_goods;

--커스텀 케이스 재고 테이블 
CREATE TABLE Custom_Shop_goods_stock(

     GNO VARCHAR2(50) references Custom_Shop_goods(GNO) on delete cascade, --상품 번호
     QUANTITY NUMBER(3, 0) --수량
     
);

select * from Custom_Shop_goods_stock;

create or replace trigger Custom_stock_trigger
after
insert on Custom_Shop_goods
for each row
begin
if inserting then
    insert into Custom_Shop_goods_stock(GNO,QUANTITY) values(:new.GNO,50);
    end if;
end;

--커스텀 케이스 주문 테이블

CREATE TABLE Custom_goods_order ( 
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
    ORDERPW VARCHAR2(50) DEFAULT NULL
    
); 




select * from custom_goods_order;
drop table  Custom_goods_order;
