CREATE TABLE Shop_goods (
    GNO NUMBER(10, 0) PRIMARY KEY, --일련번호
    GNAME NVARCHAR2(10) NOT NULL, --상품명
    PRICE NUMBER(10, 0) NOT NULL, --가격
    QUANTITY NUMBER(3, 0) NOT NULL, --수량
    INFORMATION NVARCHAR2(1000) DEFAULT '상품 등록 시 작성하신 정보가 없습니다', --정보설명
    TITLE_IMG NVARCHAR2(1000) DEFAULT 'default_title_img.jpg', --제목 이미지
    INFO_IMG NVARCHAR2(1000) DEFAULT 'default_info_img.jpg', --정보 이미지
    UPLOAD_DATE DATE DEFAULT SYSDATE, --업로드일
    UPDATE_DATE DATE DEFAULT SYSDATE --수정일
);

DROP TABLE Shop_goods;

INSERT INTO Shop_Goods (GNO, GNAME, PRICE, QUANTITY, INFORMATION) VALUES ('1', '테스트1', '10000', '100', '테스트 상품 설명입니다');

SELECT * FROM Shop_goods;