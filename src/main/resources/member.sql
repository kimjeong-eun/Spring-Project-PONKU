CREATE USER shopmanager IDENTIFIED BY shop5353;

GRANT RESOURCE, CREATE VIEW, CONNECT TO shopmanager; --(일반 계정)
GRANT DBA, CONNECT TO shopmanager; --(관리자 계정)

CREATE TABLE Shop_Member (
    USERID VARCHAR2(50) NOT NULL PRIMARY KEY,
    PASSWORD VARCHAR2(50) NOT NULL,
    USERNAME VARCHAR2(10) NOT NULL,
    AGE NUMBER(3) NOT NULL,
    GENDER CHAR(1) NOT NULL CHECK(GENDER IN ('Y', 'N')),
    EMAIL VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(50) NOT NULL,
    ADDRESS VARCHAR2(100) NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    LAST_UPDATE DATE DEFAULT SYSDATE);  
);

CREATE TABLE Shop_Authority (
	USERID VARCHAR2(50) NOT NULL,
	authority varchar2(50) not null,
	constraint fk_authority_Shop_Member foreign key(USERID) references Shop_Member(USERID));

SELECT * FROM Shop_Member;
SELECT * FROM Shop_Authority;

--더미데이터 삽입 
INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user1', 'password1', 'John', 30, 'Y', 'john@example.com', '1234567890', '123 Main St');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user2', 'password2', 'Alice', 25, 'N', 'alice@example.com', '9876543210', '456 Elm St');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user3', 'password3', 'Emily', 40, 'Y', 'emily@example.com', '5551234567', '789 Oak St');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user4', 'password4', 'Michael', 35, 'N', 'michael@example.com', '9879876543', '321 Pine St');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user5', 'password5', 'Sophia', 28, 'Y', 'sophia@example.com', '4447891234', '456 Maple Ave');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user6', 'password6', 'Daniel', 45, 'N', 'daniel@example.com', '3219876543', '678 Birch Ln');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user7', 'password7', 'Emma', 22, 'Y', 'emma@example.com', '7775551234', '890 Cedar Rd');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user8', 'password8', 'Ethan', 33, 'N', 'ethan@example.com', '8883339999', '123 Palm Dr');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user9', 'password9', 'Olivia', 26, 'Y', 'olivia@example.com', '6664445555', '456 Oak Ave');

INSERT INTO Shop_Member (USERID, PASSWORD, USERNAME, AGE, GENDER, EMAIL, PHONE, ADDRESS)
VALUES ('user10', 'password10', 'Liam', 32, 'N', 'liam@example.com', '9998887777', '789 Pine Ln');

insert into Shop_Authority (userid, authority) values ('user1','ROLE_USER');
insert into Shop_Authority (userid, authority) values ('user2','ROLE_MANAGER'); 
insert into Shop_Authority (userid, authority) values ('user3','ROLE_MANAGER'); 
insert into Shop_Authority (userid, authority) values ('user4','ROLE_ADMIN');

