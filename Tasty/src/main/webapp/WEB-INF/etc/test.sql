select * from member

create table review_ups_downs_check(
	email varchar2(50),
	review_num number(12)
)

insert into review_ups_downs_check values ('aaa', '12')

select * from review_ups_downs_check where review_num=12

delete from review_ups_downs_check where email='www'

