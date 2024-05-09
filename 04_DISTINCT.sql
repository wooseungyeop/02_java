-- DISTINCT
-- 중복 값을 제거한다.

-- 단일 열 DISTINCT
-- 아래의 데이터를 조회시 중복되는 CATEGORY_CODE가 출력된다.
select 
	CATEGORY_CODE
  from tbl_menu
  order by CATEGORY_CODE;
  
 -- DISTINCT를 이용하면 중복값을 제거하고 출력할 수 있게 된다.
 select 
 	distinct CATEGORY_CODE
  from tbl_menu;
  
 -- NULL 값을 포함한 열의 DISTINCT
 select 
 	REF_CATEGORY_CODE
   from tbl_category;
   
select 
	distinct REF_CATEGORY_CODE
  from tbl_category;
  
 -- 열이 여러 개인 DISTINCT
 select 
 	CATEGORY_CODE ,
 	ORDEERABLE_STATUS
   from TBL_MENU;
   
  select distinct 
  	ORDERABLE_STATUS ,
  	CATEGORY_CODE
   from TBL_MENU;
   
  