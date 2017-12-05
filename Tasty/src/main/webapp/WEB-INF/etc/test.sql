select * from member

drop table review_ups_downs_check;
create table review_ups_downs_check(
	email varchar2(50),
	review_num number(12)
);

insert into MISSION_ADMIN(mission_num, mission_name) values(mission_admin_seq.nextval,'미션1')
insert into MISSION_CERT_BOARD(mission_cert_num, mission_num) values(mission_cert_board_seq.nextval, '1')
insert into PHOTO values(photo_num_seq.nextval, 'ggg')
insert into MISSION_PHOTO values('1', '1')
insert into MISSION_CERT_PHOTO values('1','1')
insert into MISSION_MEMBER values('1','q')

	select * 
	from mission_member mm, 
		 mission_cert_board mc, 
		 mission_admin ma, 
		 member m,
		 photo p,
		 mission_cert_photo mcp,
		 mission_photo mp
	where mc.mission_num = '1'
	and ma.mission_num=mc.mission_num
	and mcp.mission_cert_num=mc.mission_cert_num
	and mcp.photo_num=p.photo_num
	and p.photo_num = mp.photo_num
	and mp.mission_num = ma.mission_num
	and mm.mission_num = ma.mission_num
	and m.email = mm.email(+)
	order by mc.mission_cert_num desc
	
	
	select * 
		from MISSION_ADMIN ma, MISSION_PHOTO mp, photo p
		where ma.MISSION_NUM =mp.MISSION_NUM
		and mp.photo_num = p.photo_num
		order by ma.MISSION_NUM asc  
	