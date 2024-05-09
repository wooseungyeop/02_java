/* transection*/
-- mysql은 기본적으로 commit이 자동으로 되므로 수동으로 조절하고 싶다면 autocommit 설정을 변경해야 한다.
-- auto commit 활성화
set autocommit =1;
-- 또는
set autocommit = on;

-- autocommit 비활성화
set autocommit = 0;
-- 또는
set autocommit = off;


-- 트랜젝션의 시작을 알림
start transaction;
-- 
select 
	*
  from tbl_menu;
 
 
insert into tbl_menu values(null, '바나나해장국', 8500, 4, 'y');
update tbl_menu set menu_name = '수정된 메뉴' where menu_code = 6;
delete from tbl_menu where menu_code = 11;

rollback;



