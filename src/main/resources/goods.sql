--------------------------------------------------------------------------------권한 테이블
CREATE TABLE SHOP_AUTHORITY (

);

INSERT INTO SHOP_AUTHORITY (AUTHORITY, MANAGER_SEQ) values ('ROLE_ADMIN', '997');
INSERT INTO SHOP_AUTHORITY (MEMBER_SEQ, AUTHORITY) values ('999', 'ROLE_MEMBER');

DELETE FROM SHOP_AUTHORITY WHERE MEMBER_SEQ = '999';

SELECT * FROM SHOP_AUTHORITY;
--ALTER TABLE SHOP_AUTHORITY add constraint fk_goods_attach foreign key (gno) references Shop_goods (gno);
UPDATE SHOP_AUTHORITY SET MANAGER_SEQ = '999' WHERE MANAGER_SEQ = '5';

UPDATE SHOP_AUTHORITY SET AUTHORITY = 'ROLE_ADMIN' WHERE MEMBER_SEQ = '64';
--------------------------------------------------------------------------------첨부파일 테이블
CREATE TABLE Attach_goods (
	UUID VARCHAR2(100) NOT NULL, --첨부파일 난수명(pk)
	UPLOADPATH VARCHAR2(200) NOT NULL, --업로드 경로
	FILENAME VARCHAR2(100) NOT NULL, --?
	FILETYPE CHAR(1) DEFAULT 'I', --확장자
	GNO VARCHAR2(50) --게시글과 연결 
);

SELECT * FROM Attach_goods;
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

SELECT * FROM Shop_goods where GNO ='1';

insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('1', 'Matin Kim Black Logo Case', '83000',
'일상에서 조화롭게 적용할 수 있는 자연스러운 패션을
추구하는 마뗑킴의 미학에서 영감받은 컬렉션.
해체주의적이면서도 절제된 디자인이 매력적인 컬렉션으로
여러분의 OOTD에 마뗑킴의 감성을 더해보세요.',
'matin-black-logo.jpg', 'matin-black-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('2', 'Matin Kim Destroyed Denim Case', '83000',
'패션과 테크 액세서리의 조화로운 만남이 돋보이는 마뗑킴의 첫 번째 풀 테크 액세서리 컬렉션!
지금 바로 만나고 여러분의 기기를 스타일 업해보세요.
해당 컬렉션은 최신 아이폰 15 시리즈까지 완벽하게 지원합니다.
모든 제품은 실제 메탈 및 데님 소재가 아닌 TPU 및 PC 소재로 제작되었습니다.',
'matin-denim.jpg', 'matin-denim-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('3', 'Chrome Sparkles - Graphite', '77500',
'일상의 보호를 위한 가장 완벽한 선택지
1000만 개 이상 판매 기록을 달성한 베스트셀러!
16% 더 얇고 가벼워졌지만, 보호력은 조금도 놓치지 않고 돌아왔습니다.',
'sparkles.jpg', 'sparkles-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('4', 'The Grippy Case - Marshmallow Cloud	', '83000',
'포근하게 안아주세요!
보기도 좋고 촉감도 좋은 폭신폭신 그리피 케이스!
3D 텍스처 쿠션과 높아진 베젤이 기기를 포근히 감싸며
여러분의 아이폰을 안전하게 보호합니다!',
'marsh-cloud.jpg', 'marsh-cloud-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('5', 'The Baffle Case - Pink', '77500',
'프리미엄 퀄리티의 초극세사 소재로 제작된 패딩
케이스는 손안의 패딩처럼 폭신한 쿠션감을 자랑합니다.

뛰어난 그립감 뿐만 아니라 생활 방수까지
겸비한 패딩 케이스를 만나보세요.

비가 오든 눈이 오든 여러분의 기기는 항상
뽀송하게 유지될 거예요!',
'padding.jpg', 'padding-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('6', 'Lucky Me - Bounce Case', '127000',
'360˚ 전면 보호
모든 측면과 각도에서 언제나 완벽한 보호력.
어떠한 모험에도 굴하지 않는 편안함.',
'lucky-me.jpg', 'lucky-me-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('7', 'WON SOJU 3D Collectible Case', '87900',
'준비 됐다면 짠!

프리미엄 증류식 소주 브랜드, '원소주'와 케이스티파이가 함께한
익스클루시브 콜라보레이션을 공개합니다.

한국의 대표적인 주종, 소주의 스펙트럼을 확장해나가는 원소주와
케이스티파이가 함께하는 테크 액세서리 컬렉션!
프리미엄 컬렉터 에디션 원소주 3D 컬렉터블 폰케이스와
'병 돌리기 게임'에서 착안한 스피너 케이스까지.
모두 다 잔을 들고! 하나, 둘, 셋하면 짠!',
'wonsoju.jpg', 'wonsoju-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('8', 'Zanmang Loopy Face Case', '94000',
'잔망미 넘치는 테크 액세서리 컬렉션
거부할 수 없는 깜찍한 매력 덩어리,

루피 단독 디자인 컬렉션으로 홀리데이 분위기를 마음껏 즐겨보세요.',
'zanmang-loopy.jpg', 'zanmang-loopy-info.jpg');

update Shop_goods set title_img = 'matin-black-logo.jpg' where gno = '1';

DELETE FROM Shop_goods;

--페이징 확인용으로 약 100개씩 insert 많이 했어용
insert into Shop_goods (gno, gname, price) select goods_seque.nextval, gname, price from Shop_goods;

create sequence goods_seq increment by 1 start with 100;
create sequence goods_sequ increment by 1 start with 200;
create sequence goods_seque increment by 1 start with 300;

drop sequence goods_seque;

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