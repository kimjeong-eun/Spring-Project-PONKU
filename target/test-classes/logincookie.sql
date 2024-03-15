-- remember-me 설정을 위한 테이블 설계

create table persistent_logins(

	username varchar2(64) not null,
	series varchar2(64) primary key,
	token varchar2(64) not null,
	last_used timestamp not null
);

-------------------------------------------------

alter table shop_member modify password varchar2(150);

select * from shop_member;
select * from shop_authority;

insert into shop_authority values(998 ,'ROLE_ADMIN');
insert into shop_member(member_seq, userid, password, username) values (999,'jeongeun','1234','김정은');
update shop_member set email ='jeongeun587@naver.com' where member_seq = 998;
---------------------------------------------뷰 생성
create view authList_view as(
	select member.userid userid, ahth.authority auth
	from shop_member member, shop_authority ahth
	where member.member_seq = ahth.member_seq);
	
select * from authList_view;

-------------------------------------------------
