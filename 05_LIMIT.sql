-- LIMIT
 -- 출력하는 수의 제한을 둔다.
select
	MENU_CODE ,
	MENU_NAME ,
	MENU_PRICE
  from tbl_menu
 order by MENU_PRICE;

-- 가격이 가장 높은 3개
select
	MENU_CODE ,
	MENU_NAME ,
	MENU_PRICE
  from tbl_menu
 order by MENU_PRICE desc
 limit 3;

-- 2번 행부터 5번 행 까지 조회
select
	MENU_CODE ,
	MENU_NAME ,
	MENU_PRICE 
  from tbl_menu
 order by MENU_CODE
 limit 3, 5;


 