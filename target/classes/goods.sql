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

SELECT * FROM Shop_goods;

-----(커스텀 열에 'false'로 줘야 뜹니다!)-----
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
insert into Shop_goods (gno, gname, price, information, title_img) values ('9', 'Cat Id Card Case by Mond Kim', '77500',
'슬림한 형태. 우수한 보호력.
EcoShock™ 충격 흡수 소재와 미 군사 규격 4배에 달하는
강력한 내구성으로 2.5m 낙하에도 끄떡없습니다.',
'cat-id.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('10', 'Selfie by Bonnie Lu', '105000',
'2023년 뉴욕 제품 디자인 어워드에서
금상을 수상한 케이스를 소개합니다!

여러분을 빛나게 할 한 장의 캔버스로 거듭난
바운스 케이스를 만나보세요.',
'selfie.jpg', 'selfie-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('11', 'Marshville Cinema', '83000',
'한국 인기 아티스트 다이노탱과의 만남!
여러분을 귀엽고 발랄한 영화관으로 초대합니다!
취향저격 디자인은 물론 팝콘을 먹다
스마트폰을 떨어트려도 걱정 없는
뛰어난 보호력까지 선사하죠!
다채로운 다이노탱 컬렉션과 함께 오늘도 영화같은 하루 보내세요!',
'cinema.jpg', 'cinema-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('12', 'VEN KEYCHAIN Case', '127000',
'핑크와 벤이 3D 그래픽으로 돌아와 모든 팬들을 기쁘게 만들어주고 있어!

특별한 순간. 네가 웃으면 나도 웃음이 나.
벤은 모든 연령, 성별, 국적의 사람들이 공감하고 기뻐할 수 있는 일상의 즐거움을 전해줘요

핑크, 벤, 히피가 우리에게 보여줄 수 있는 특별한 순간을 즐길 준비가 되었니?',
'ven.jpg', 'ven-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('13', 'Self-Love Case', '77500',
'5월 한 달간 케이스가 판매될 때마다 비영리 단체인 To Write Love On Her Arms에 US$5가 기부됩니다.',
'self-love.jpg', 'self-love-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('14', 'miniJOHN', '127000',
'맥세이프 호환 케이스와 테크 액세서리 함께 구매 시 제공되는 특별한 할인 혜택!',
'mini-john.jpg', 'mini-john-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img) values ('15', 'INAP ALPHABET PATTERN Case', '83000',
'진정한 나를 비추는 케이스
거울로 사용할 수 있는 폰케이스.
밖에서도 여러분의 모습이 완벽할 수 있도록 항상 확인해 보세요.',
'alphabet.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('16', 'PP-0008', '66500',
'자유로운 여행자들을 위한 디자인
세계를 여행하는 여행족들에게서 영감을 받은
이번 Pangram Pangram® x CASETIFY 컬렉션은
공항, 영수증, 주차창 발권 티켓 등
전 세계의 주요 공항 컨셉을 디자인으로 담았습니다.

특히 수화물 태그(Luggage tag)는
나만의 스타일로 커스터마이징이 가능합니다.
12개의 도시 중 내가 좋아하는 도시를 도착지로 선택하고,
나만의 이름과 출발도시를 커스터마이징해
특별한 케이스를 완성해보세요.',
'fragile.jpg', 'fragile-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('17', 'Alright hold on !', '94000',
'영원한 기쁨
마쓰이 (matsui)가 그려내는 천진난만한 강아지들을 만나보세요. 강아지와 함께할 때 느끼는 행복과 조건없는 사랑을 경험할 수 있을 거예요. 바쁜 일상 속, 여러분에게 소소한 행복을 가져다줄 테크 액세서리를 만나보세요.
',
'holdon.jpg', 'holdon-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('18', '이나피 스티커 01', '105000',
'16% 얇아진 두께에
여전히 강력한 보호력
도시에서 마주할 수 있는 예상치 못한 모험에서
바운스 케이스가 여러분의 기기를 보호합니다.',
'sticker.jpg', 'sticker-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('19', 'Warped Floral Checker', '127000',
'맥세이프 호환 케이스와 테크 액세서리 함께 구매 시 제공되는 특별한 할인 혜택!',
'floral-checker.jpg', 'floral-checker-info.jpg');
-----(more insert)-----
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('', 'Case', '127000',
'핑크와 벤이 3D 그래픽으로 돌아와 모든 팬들을 기쁘게 만들어주고 있어!',
'ven.jpg', 'ven-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('', 'Case', '127000',
'핑크와 벤이 3D 그래픽으로 돌아와 모든 팬들을 기쁘게 만들어주고 있어!',
'ven.jpg', 'ven-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('', 'Case', '127000',
'핑크와 벤이 3D 그래픽으로 돌아와 모든 팬들을 기쁘게 만들어주고 있어!',
'ven.jpg', 'ven-info.jpg');
insert into Shop_goods (gno, gname, price, information, title_img, info_img) values ('', 'Case', '127000',
'핑크와 벤이 3D 그래픽으로 돌아와 모든 팬들을 기쁘게 만들어주고 있어!',
'ven.jpg', 'ven-info.jpg');


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