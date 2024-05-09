/* VIEW */
-- 가상의 테이블을 형성하는 VIEW를 이해한다.
-- SELECT  쿼리문을 저장한 객체로 가상테이블이라고 불린다.
-- 실질적인 데이터를 물리적으로 저장하고 있지 않음
-- 테이블을 사용하는 것과 동일하게 사용할 수 있다.
select * from tbl_menu;

-- VIEW 생성
create view HANSIK as
select 
	MENU_CODE ,
	MENU_NAME ,
	MENU_PRICE ,
	CATEGORY_CODE ,
	ORDERABLE_STATUS
  from tbl_menu
 where CATEGORY_CODE = 4;

select
	*
  from HANSIK;
 
 insert into tbl_menu values(null, '식혜맛국밥', 5500, 4, 'Y');


-- VIEW를 통한 DML
-- 1) VIEW를 통한 INSERT(VIEW는 AUTO_INCREMENT가 없으므로 PK 컬럼의 값을 지정해주어야 한다.)
insert into HANSIK VALUES(99, '수정과맛국밥', 5500, 4, 'Y');
insert into HANSIK VALUES(10, '수정과맛국밥', 5500, 5, 'Y');
select * from TBL_MENU;
select * from HANSIK;


-- TEST
create view HANSIK2 as
select 
	MENU.MENU_NAME ,
	MENU.MENU_PRICE ,
	CATEGORY.CATEGORY_NAME
  from tbl_menu MENU
 join tbl_category CATEGORY on MENU.CATEGORY_CODE = CATESGORY.CATEGORY_CODE; 

select * from HANSIK2;
-- JOIN을 하는 경우 값을 입력하는 것이 불가능함
-- 필드 목록이 없으면 조인 뷰 'GANGNAM.HANSIK2'에 삽입 할 수 없다.

insert into HANSIK2 values
('열무 KIMCHI', 10000, '한식');


-- 2) VIEW를 통한 UPDATE
update HANSIK 
	set MENU_NAME = '수정된 메뉴',
	MENU_PRICE = 5700
 where MENU_CODE = 99;
 
select * from HANSIK;

-- VIEW를 이용한 데이터 삭제
delete 
  from HANSIK
 where MENU_CODE = 99;
 
-- JOIN으로 생성된 VIEW의 데이터를 삭제하는 것도 권장하지 않음

select 
	*
  from HANSIK2
 where MENU_MANE = '열무스';
 
-- VIEW를 삭제
drop view HANSIK2;
-- VIEW가 삭제되어 조회할 수 없음
select 
	*
  from HANSIK2;
  
 -- VIEW에 쓰인 SUBQUERY 안에 연산 결과 컬럼도 사용 가능하다.
 
 create view HANSIK2 as
 select
 	MENU_NAME as '메뉴명' ,
 	TRUNCATE(MENU_PRICE/10000,1) as '가격(천원)' ,
 	CATEGORY_NAME as '카테고리 명 '
   from tbl_menu A
   join tbl_category B on A.CATEGORY_CODE = B.CATEGORY_CODE
  where B.CATEGORY_NAME = '한식'L
 -- VIEW  생성시 지시한 컬럼의 별칭이 VIEW의 컬럼 명이 됨
 
select 
	*
  from HANSIK2
 where 메뉴명 like '%%';
 
-- OR REPLACE 옵션
-- 테이블을 FROP 하지 않고 기존의 VIEW를 새로운 VIEW로 쉽게 대체할 수 있다.
create oR replace view HANSIK as
select
	MENU_CODE as '메뉴코드' ,
	MENU_NAME as '메뉴명' ,
	CATEGORY_NAME as '카테고리명'
  from tbl_menu
  join tbl_category on TBL_MENU.category_code = TBL_CATEGORY.category_code;
  
 select * from HANSIK; 