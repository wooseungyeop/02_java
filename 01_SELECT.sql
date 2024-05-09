-- 단일 컬럼의 값을 조회한다.
select MENU_NAME from TBL_MENU;

-- SELECT 문을 사용하여 여러 열의 데이터를 검색한다.
select
	MENU_CODE ,
	MENU_NAME ,
	MENU_PRICE
  From TBL_MENU;
-- 모든 열의 데이터를 검색
 select 
 	*
   from TBL_MENU;
 -- 연산자
  select 6 * 3;
-- 현재 시간을 조회함
  select NOW();
  
 select CONCAR('홍', '길동');
 
-- 컬럼 별칭
select concat('홍', '길동') as 이름;


select
	concat(menu_code, " : ", menu_name) as 이름
  from tbl_menu;
  