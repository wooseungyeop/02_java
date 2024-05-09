/* CONSTRAINTS */
-- 수업 목표 : 제약 조건을 이해한다.

-- 제약 조건
-- 테이블 작성 시 각 컬럼에 값 기록에 대한 제약조건을 설정할 수 있다.
-- 데이터 무결성 보장을 목적으로 함
-- 입력/수정하는 데이터에 문제가 없는지 자동으로 검사해 주게 하기 위한 목적
-- PRIMARY KEY, NOT NULL, UNIQUE, CHECK, FOREIGN KEY

/* NOT NULL */
drop table if exists USER_NOTNULL;
create table if not exists USER_NOTNULL(
	USER_NOL INT not null ,
	USER_ID VARCHAR(255) not null ,
	USER_PWD VARCHAR(255) not null ,
	USER_NAME VARCHAR(255) not null ,
	GENDER VARCHAR(3) ,
	PHONE VARCHAR(255) not null ,
	EMAIL VARCHAR(255)
)engine = INNODB;

insert into USER_NOTNULL
(
	USER_NOL, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL
)values
(1, 'USER', 'PASS', '홍길동', '남', '010-2323-2323', 'HONG123@GMAIL.COM'),
(2, 'USER01', 'PASS', '유관순', '여', '010-2323-2323', 'YOU123@GMAIL.COM');

select * from USER_NOTNULL;

-- NOT NULL 제약 조건에 의해 에러가 발생함
insert into USER_NOTNULL
(
	USER_NOL, USER_ID, USER_PWD, USER_NAME, GENDER, EMAIL
)values
(3, 'USER03', 'PASS03', '홍길동', '남', 'HONG123@GMAIL.COM');

/* UNIQUE */
-- 중복값을 허용하지 않는다.
create table if not exists USER_UNIQUE(
	USER_NO INT not null unique ,
	USER_ID VARCHAR(255) not null ,
	USER_PWD VARCHAR(255) not null ,
	USER_NAME VARCHAR(255) not null ,
	GENDER VARCHAR(3) ,
	PHONE VARCHAR(255) not null ,
	EMAIL VARCHAR(255)
)engine = INNODB;

insert into USER_UNIQUE
(
	USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL
)values
(1, 'USER', 'PASS', '홍길동', '남', '010-2323-2323', 'HONG123@GMAIL.COM'),
(2, 'USER01', 'PASS', '유관순', '여', '010-2323-2323', 'YOU123@GMAIL.COM');

insert into USER_UNIQUE
(
	USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL
)values
(1, 'USER', 'PASS', '홍길동', '남', '010-2323-2323', 'HONG123@GMAIL.COM');

-- PRIMARY KEY
/*테이블에서 한 행의 정보를 찾기 위해서 사용할 컬럼을 의미한다.
 * 테이블에 대한 식별자 역할을 한다(한 행씩 구분하는 역할을 한다.)
 * NOT NULL + UNIQUE 제약조건의 의미
 * 한 테이블 한 개만 설정할 수 있음
 * 컬럼 레벨, 테이블 레벨 둘 다 설정 가능함
 * 한 개 컬럼에 설정할 수도 있고, 여러 개의 컴럼을 묶어서 설정할 수도 있다.(복합키)
 * 
 */
drop table if exists USER_PRIMARYkey;
create table if not exists USER_PRIMARYkey(
	USER_NOL INT primary KEY ,
	USER_ID VARCHAR(255) not null ,
	USER_PWD VARCHAR(255) not null ,
	USER_NAME VARCHAR(255) not null ,
	GENDER VARCHAR(3) ,
	PHONE VARCHAR(255) not null ,
	EMAIL VARCHAR(255)
)engine = INNODB;

insert into USER_PRIMARYkey
(
	USER_NOL, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL
)values
(1, 'USER', 'PASS', '홍길동', '남', '010-2323-2323', 'HONG123@GMAIL.COM'),
(2, 'USER01', 'PASS', '유관순', '여', '010-2323-2323', 'YOU123@GMAIL.COM');

-- PRIMARY KEY는 NOT NULL과 UNIQUE 제약조건을 갖는다.
insert into USER_PRIMARYkey
(
	USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL
)values
('USER', 'PASS', '홍길동', '남', '010-2323-2323', 'HONG123@GMAIL.COM');

select * from user_primarykey;




/*
 * FOREIGN KEY */
-- 참조(REFERENCES)된 다른 테이블에서 제공하는 값만 사용할 수 있음
-- 참조 무결성을 위배하지 않기 위해 사용
-- FOREIGN KEY 제약조건에 의해서
-- 테이블 간의 관계(RELATIONSHIP)이 형성됨
-- 제공되는 값 외에는 NULL을 사용할 수 있음
drop table if exists USER_GRADE;

create table if not exists USER_GRADE(
	GRADE_CODE INT primary key ,
	GRADE_NAME VARCHAR(255) not null
)ENGINE = INNODB;

insert into user_grade
values
(10, '보통강사'),
(20, '만족강사'),
(30, '매우만족강사');

select * from USER_GRADE;

drop table if exists INSTRUCTOR_FOREINGKEY;
create table if not exists INSTRUCTOR_FOREINGKEY(
	USER_NO INT primary key ,
	USER_NAME VARCHAR(255) not null ,
	GENDER VARCHAR(3),
	PHONE VARCHAR(255),
	GRADE_CODE INT ,
	FOREIGN KEY(GRADE_CODE)
	references USER_GRADE(GRADE_CODE)
)engine = INNODB;

select * from INSTRUCTOR_FOREINGKEY;

insert into INSTRUCTOR_FOREINGKEY
values (1, '왕강사', '남', '010-2323-2323', 10);

select 
	B.USER_NAME,
	A.GRADE_NAME
  from USER_GRADE as A
 join INSTRUCTOR_FOREINGKEY as b
 ON A.GRADE_CODE = B.GRADE_CODE;
 

-- ON UPDATE SET NULL, IN DELETE SET NULL
create table if not exists INSTRUCTOR_FOREINGKEY2(
	USER_NO INT primary key ,
	USER_NAME VARCHAR(255) not null ,
	GENDER VARCHAR(3),
	PHONE VARCHAR(255),
	GRADE_CODE INT ,
	FOREIGN KEY(GRADE_CODE)
	references USER_GRADE(GRADE_CODE)
	on update set null
	on delete set NULL
)engine = INNODB;

insert into INSTRUCTOR_FOREINGKEY2
values (1, '왕강사', '남', '010-2323-2323', 10),
(2, '이상우', '남', '0102323-2222', '30');

select  * from INSTRUCTOR_FOREINGKEY2;

-- INSTRUCTOR_FOREINGKEY 테이블에서 참조의 대한 옵션을 설정하지 않았다.
-- 이로 인해 아래의 UPDATE에서 USER_GRADE를 변경한다면 INSTRUCTOR_FOREINGKEY 테이블이 참조하고 있어
-- 변경할 수 없는 오류가 발생하게 된다. 그래서 삭제
drop table if exists INSTRUCTOR_FOREINGKEY;

-- GRADE_CODE = NULL
-- GRADE_CODE 는 제약조건으로 PRIMARY KEY 조건이 부여되었다.
-- 이로 인해 GRADE_CODE를 삭제하는 것은 PRIMARY KEY 제약조건에 위배하여 불가능하다.
update USER_GRADE 
set GRADE_CODE = 40
where GRADE_CODE = 10;


select * from user_grade;

-- 아래의 테이블을 조회하면 GRADE_CODE가 변경됨에 따라 GRADE_CODE 가 NULL로 변경된다.
-- 이는 ON DELETE SET NULL 옵션에 의해 참조하는 테이블이 변경되면 자신의 참조값을 NULL로 처리하는 것이다.
select 
	*
  from INSTRUCTOR_FOREINGKEY2;
  
 
 /* CHECK */
 drop table if exists USER_CHECK;
 create table if not exists user_CHECK(
 	USER_NO INT auto_increment primary key,
 	USER_NAME VARCHAR(255) not null,
 	GENDER CHAR(3) check (GENDER in ('남', '여')),
 	AGE INT check (AGE >= 15)
 )engine = INNODB;
 
insert into user_CHECK
values
(null, '홍길동', '남', 15);
-- 아래의 값은 GENDER에 '남' 또는 '여'만 입력할 수 있도록 설정하였으나 '짭'이라는 값을 입력하여 오류가 발생함
-- (NULL, '김길동', '짭', 20);
-- 아래의 값은 AGE에 15이상 값만 입력할 수 있도록 설정하였으니 5가 입력되어 제약조건을 위배함
-- (null, '신짱구', '남', 5);

-- DEFALUT
-- 컬럼에 NULL 대신 기본 값 적용
-- 컬럼 타입이 DATE일 시 CURRENT_DATE만 가능하다.
-- 컬럼 타입이 DATETIME일 시 CURRENT_TIME과 CURRENT_TMESTAMP, NOW() 모두 사용 가능

DROP table if exists TB1_COUNTRY;
create table if not exists TB1_COUNTRY(
	COUNTRY_CODE INT auto_increment primary key,
	COUNTRY_NAME VARCHAR(255) default '한국',
	POPLATION VARCHAR(255) default '0명',
	ADD_DAY DATE default (CURRENT_DATE),
	ADD_TIME DATETIME default (CURRENT_TIME)
)engine = INNODB;

select * from TB1_COUNTRY;

insert into tb1_COUNTRY
values (null, default, default, default, DEFAULT);

select * from TB1_COUNTRY;