-- GROUP BY
-- 같은 값을 묶을 때 사용하는 키워드이다.
-- 다중 행 함수와 단일 행 함수
select 
	CATEGORY_CODE ,
	COUNT(*)
  from tbl_menu 
 GROUP by CATEGORY_CODE;
 
select
	CATEGORY_CODE ,
	SUM(MENU_PRICE)
  from TBL_MENU
 group by CATEGORY_CODE;
 
select
	CATEGORY_CODE ,
	AVG(MENU_PRICE)
  from tbl_menu
  group by category_code;
  
 -- 여러 값을 묶는 경우
 select 
 	CATEGORY_CODE ,
 	MENU_PRICE ,
 	COUNT(*)
  from tbl_menu tm
 group by category_code , menu_price;
 
-- 그룹에 조건을 부여하기
-- HAVING
select 
	CATEGORY_CODE
  from tbl_menu tm 
 group by category_code
 having category_code between 5 and 8;
 

tbl_menu  에는 

menu_code, menu_name, menu_price, category_code, orderable_status


tbl_category 에는

category_code, category_name, ref_category_code


<join>

category_name, menu_name, menu_price를 출력해주세요

category_name 오름차순
중복되면 menu_name 오름차순 정렬


<group by>

각 category_name 별로 menu_price를 합산하고 합산 결과를 sum으로 변경 후
category_name, sum 출력



<having>
위의 합산한 결과에서 10000원 이상인 카테고리만 출력



-- join(right) 을 이용하여 메뉴 이름 및 코드를 출력하시오 
 
-- group by를 이용하여 카데고리 코드 및 메뉴 코드를 출력하시오

-- having을 이용하여 메뉴 이름 및 카운트를 하세요

select 

	from tbl_menu tm 