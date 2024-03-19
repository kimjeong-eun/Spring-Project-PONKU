CREATE USER shopmanager IDENTIFIED BY shop5353;

GRANT RESOURCE, CREATE VIEW, CONNECT TO shopmanager; --(일반 계정)
GRANT DBA, CONNECT TO shopmanager; --(관리자 계정)

CREATE TABLE Shop_Member (
    MEMBER_SEQ NUMBER(30) NOT NULL PRIMARY KEY, --유저 일련 번호
    USERID VARCHAR2(50) NOT NULL, --아이디
    PASSWORD VARCHAR2(50) NOT NULL, --비밀번호
    USERNAME VARCHAR2(10) NOT NULL, --이름
    AGE NUMBER(3), --나이
    GENDER CHAR(1) CHECK(GENDER IN ('Y', 'N')), --성별
    EMAIL VARCHAR2(50), --이메일
    PHONE VARCHAR2(50), --전화번호
    ADDRESS VARCHAR2(100), --주소
    ENROLL_DATE DATE DEFAULT SYSDATE, --가입일
    LAST_UPDATE DATE DEFAULT SYSDATE); --정보 수정일
);

CREATE TABLE Shop_Authority (
	MEMBER_SEQ NUMBER(30) NOT NULL,
	authority VARCHAR2(100) NOT NULL);

SELECT * FROM Shop_Member;
SELECT * FROM Shop_Authority;

CREATE SEQUENCE MEMBER_SEQ INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;

--더미데이터 삽입 
INSERT INTO Shop_Member (MEMBER_SEQ, USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES (MEMBER_SEQ.nextval, 'user1', 'pw1', '홍길동', 30, 'Y', 'john@example.com', '1234567890', '123 Main St');

INSERT INTO Shop_Member (MEMBER_SEQ, USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES (MEMBER_SEQ.nextval, 'user2', 'pw2', '앨리스', 25, 'N', 'alice@example.com', '9876543210', '456 Elm St');

INSERT INTO Shop_Member (MEMBER_SEQ, USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES (MEMBER_SEQ.nextval, 'user3', 'pw3', '성춘향', 40, 'Y', 'emily@example.com', '5551234567', '789 Oak St');

insert into Shop_Authority (MEMBER_SEQ, authority) values (1,'ROLE_USER');
insert into Shop_Authority (MEMBER_SEQ, authority) values (2,'ROLE_MANAGER'); 
insert into Shop_Authority (MEMBER_SEQ, authority) values (3,'ROLE_ADMIN');