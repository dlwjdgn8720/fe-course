/*
	MySQL 
    - 정형 데이터를 저장하는 데이터베이스
    - RDBMS(Relational DataBase Management System) 구조
    - SQL(Structured Query Language) 문법을 사용하여 데이터의 CRUD를 구현한다.
    - C(Create) :: Insert
    - R(Read) :: Select
    - U(Update) :: Update
    - D(Delete) :: Delete
    - 개발자는 DML 중심의 SQL 문법을 숙지하는 것을 권장한다.
    - SQL은 대소문자를 구분하지 않음, 대부분 소문자로 작성한다.
    - snake case 방식으로 파일명을 작성한다. 예) sql_001
    
    SQL
    - SQL의 종류는 DDL,DML,DCL,DTL로 구분한다.
    1. DDL(Data Definition Language) : 데이터 정의어
		  - 데이터를 저장하기 위한 공간을 생성하고 논리적으로 정의하는 언어
          - create,alter,truncate,drop 등
	2. DML(Data Manipulation Language) : 데이터 조작어
		  - 데이터를 CRUD하는 명령어
          - insert, select, update, delete
	3. DCL(Data Control Language) : 데이터 제어어
		  - 데이터에 대한 권한과 보안을 정의하는 언어
          - grant, revoke
	4. DTL(Data Transaction Language) : 트랜잭션 제어어
		  - 데이터베이스의 처리 작업인 트랜잭션을 관리하는 언어
          - commit, save, rollback
*/ 
/******************************************
	🌟 워크벤치 실행시 필수 명령어 🌟
    1. 데이터베이스 접속
    show databases; -- 데이터베이스 확인
    use 데이터베이스명; -- 사용할 데이터베이스 오픈
    select database(); -- 데이터베이스 선택
    show tables; -- 데이터베이스의 모든 테이블 조회
*******************************************/
use myshop2019;
select database();
show tables;

show databases;
use hrdb2019;
select database();
show tables;

/*************************************************
	DESC(DESCRIBE) : 테이블 구조 확인
    형식 > desc 테이블명
**************************************************/

show tables;
desc department;
desc employee;
desc vacation;
desc unit;

/*************************************************
	SELECT  : 테이블 내용 조회
    형식> SELECT [컬럼리스트] FROM [테이블명];
**************************************************/

select emp_id, emp_name, eng_name from employee;
select * from employee; -- * 전체 리스트

-- 사원테이블의 사번, 사원명, 성별, 입사일, 급여를 조회
select emp_id, emp_name, gender, hire_date, salary from employee;

-- 부서 테이블의 모든 데이터 조회
show tables;
select * from department;

/*************************************************
	AS  : 컬럼의 별칭 부여
    형식> SELECT [컬럼명 as 별칭, ...] 
		 FROM [테이블명];
	🌟 컬럼명에 함수를 적용하여 실행하는 경우에 별칭부여
**************************************************/
-- 사원테이블의 emp_id 컬럼명을 '사번' 별칭으로 조회
select emp_id as 사번 from employee;
select emp_id 사번 from employee;
select emp_id '사원 번호' from employee;

-- 사원테이블의 별칭을 사번(emp_id), 사원명(emp_name), 입사일(hire_date), 급여(salary)로 조회
select emp_id as 사번,
	   emp_name as 사원명,
	   hire_date as 입사일,
       salary as 급여
from employee;

-- 사원테이블의 사원명, 폰번호, 급여, 보너스(급여의 10%), 입사일 조회
-- 산술연산식이 가능한 컬럼은 Number 타입 가능
select emp_name, phone, salary, salary*0.1 bonus, hire_date
	 from employee;

-- 현재 날짜를 조회 : curdate()
select curdate() as today from dual;

/*************************************************
	SELECT ~ FROM ~ WHERE  : 테이블 상세 내용 조회
    형식> SELECT [컬럼명 as 별칭, ...] 
		 FROM [테이블명]
         WHERE [컬럼명] [조건절]
**************************************************/
-- 사원 테이블에서 '정주고' 사원의 정보 조회
select * from employee
where emp_name= '정주고';

-- SYS 부서에 속한 모든 사원을 조회
select * 
	from employee
	where dept_id = 'SYS';

-- 사번이 S0005인 사원의 사원명, 성별, 입사일, 급여를 조회
select emp_name, gender, hire_date, salary
from employee where emp_id = 'S0005';

-- SYS 부서에 속한 모든 사원들을 조회, 단 출력되는 EMP_ID 컬럼은 '사원번호' 별칭으로 조회
select 
	emp_id '사원번호', 
    emp_name, 
    hire_date, 
    salary
from employee 
where dept_id ='SYS'; -- 소문자 sys도 가능

-- ❓ 컬럼 별칭을 통해 조건절을 처리할 수 있을까요??
-- emp_name의 별칭인 '사원명'으로 '홍길동'을 조회 불가능!!
select 
	emp_id, 
    emp_name as '사원명', 
    hire_date, salary 
from employee
where emp_name = '홍길동'; -- 조건절의 컬럼명은 테이블의 원본 컬럼명만 가능!!

-- 입사일이 2014년 8월 1일인 사원들을 조회
-- date 타입은 표현은 문자열 처럼, 처리는 숫자처럼 사용됨
select * 
	from employee
	where hire_date = '2014-08-01';
    
-- 급여가 5000 인 사원들을 조회
select * from employee where salary = 5000;

-- 성별이 남자인 사원들을 조회
select * from employee where gender = 'M';

-- 성별이 여자인 사원들을 조회
select * from employee where gender = 'F';

/*************************************************
	NULL : 아직 정의되지 않은 미지수
    논리적인 값으로 조건식을 처리 - is null, is not null
**************************************************/
-- 급여가 null인 사원들을 조회
select * from employee where salary is null;

-- 영어 이름이 정해지지 않은 사원들을 조회
select * from employee where eng_name is null;

-- 재직중인 사원들을 조회 : 퇴사일자 컬럼 - retire date
select * 
	from employee
	where retire_date is null;

-- 퇴사한 사원들을 조회
select * from employee
where retire_date is not null;

-- 재직중인 사원들의 보너스컬럼을 추가하고, 급여의 20%를 설정하여 조회
-- 보너스 컬럼의 컬럼명은 'bonus'
select 
	emp_id, 
    emp_name, 
    hire_date, 
    salary, 
    salary*0.2 as bonus 
from employee
where retire_date is null;

/*************************************************
	IFNULL 함수 : NULL을 다른값으로 대체해주는 함수
    형식 > IFNULL(NULL 포함 컬럼명, 대체값)
    출력하는 컬럼에 부여
**************************************************/
-- STG 부서에 속한 사원들의 정보 조회
-- 단, 급여가 NULL인 사원은 0값으로 치환
select emp_id, 
	   emp_name, 
       dept_id, 
       IFNULL(salary, 0) as salary 
	from employee
	where dept_id = 'STG';

-- 영어이름이 정해지지 않은 사원은 'smith' 이름으로 치환
-- 사원번호, 사원명, 영어이름, 입사일, 부서아이디
select 
	emp_id, 
    emp_name, 
    IFNULL(eng_name, 'smith') as eng_name,
    hire_date, 
    dept_id
from employee;

-- MKT 부서의 사원들을 조회, 재직중인 사원들의 retire_date를 현재 날짜로 치환
select 
	emp_id, 
    emp_name, 
    IFNULL(retire_date, curdate()) as retire_date 
    from employee
	where dept_id = 'MKT'
	and retire_date is null;

/*************************************************
	DISTINCT : 중복된 데이터를 배제하고 조회
    형식 > SELECT DISTINCT[컬럼 리스트...]
		  FROM ~
          WHERE ~
**************************************************/
-- 사원테이블에서 부서아이디를 조회
-- 사원테이블의 부서아이디는 부서테이블의 부서아이디를 참조하므로 다중 조회
select distinct dept_id from employee;

-- unique한 키와 함께 조회하는 경우 distinct가 적용되지 않음.
select distinct emp_id, dept_id from employee;

/*************************************************
	ORDER BY : 데이터 정렬
    ASC 생략 가능
    형식 > SELECT [컬럼 리스트...]
		  FROM [테이블명]
          WHERE [조건절]
          ORDER BY [컬럼명] ASC(오름차순) / DESC(내림차순);
**************************************************/
-- 급여를 기준으로 오름차순 정렬
select * 
	from employee
	order by salary;

-- 모든 사원을 급여, 성별을 기준으로 오름차순 정렬
select * from employee order by salary,gender asc;

-- eng_name 컬럼이 널인 사원들의 입사일이 가장 최근 순서로 조회
select * 
	from employee
	where eng_name is null
	order by hire_date desc;

-- 퇴직한 사원들을 급여기준으로 내림차순 정렬
-- 사번, 사원명, 입사일, 퇴사일, 급여
-- 단 salary 컬럼의 별칭으로 '급여' 사용
select emp_id, 				   -- (3)
	   emp_name, 
	   hire_date, 
       retire_date, 
       salary as '급여' 
 from employee				   -- (1)
 where retire_date is not null -- (2) 조건절 컬럼명으로 별칭 사용❌
 order by '급여' desc;		   -- (4) 정렬 컬럼명으로 별칭 사용 ⭕
 
 -- 정보시스템(SYS) 부서 사원들 중 입사일이 빠른 순서, 급여를 많이 받는 순서로 정렬
 -- HIRE_DATE, SALARY 컬럼은 '입사일','급여' 별칭으로 컬럼리스트 생성 후 정렬
 select emp_id,
		emp_name,
        hire_date as '입사일',
        salary as '급여'
from employee
where dept_id = 'SYS'
order by '입사일' asc , '급여' desc;

/**********************************************************
	조건절 + 비교연산자 : 특정 범위 혹은 데이터 검색
    형식 > SELECT [컬럼 리스트...]
		  FROM [테이블명]
          WHERE [조건절][비교연산자] [값]
          ORDER BY [컬럼명, ...] ASC(오름차순) / DESC(내림차순);
***********************************************************/
-- 급여가 5000이상인 사원들을 조회 , 급여를 오름차순 정렬

select *
	from employee
    where salary >= 5000
    order by salary asc;

-- '2017-01-01' 이후 입사한 사원들을 조회
select * 
	from employee
    where hire_date > '2017-01-01';

-- 입사일이 2015-01-01 이후이거나, 급여가 6000인 이상인 사원들을 조회
-- ~ 또는, ~이거나 : OR - 두 개의 조건중 하나만 만족해도 조회
select *
	from employee
    where hire_date > '2015-01-01' or salary >= 6000;

-- 입사일이 2015-01-01 이후이고, 급여가 6000인 이상인 사원들을 조회
-- ~ 이고 : AND - 두 개의 조건을 모두 만족하는 데이터를 조회
select *
	from employee
    where hire_date > '2015-01-01' and salary >= 6000;
    
-- 특정 범위 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
select *
	from employee
    where hire_date >= '2015-01-01' and hire_date <= '2017-12-31';
    
-- 급여가 6000 이상 8000 이하인 모든 사원들을 조회
select *
	from employee
    where salary >= 6000 and salary <= 8000;
    
/**********************************************************
	특정 범위 액세스(논리곱 &&) : BETWEEN ~ AND
    형식 > SELECT [컬럼 리스트...]
		  FROM [테이블명]
          WHERE [컬럼명] BETWEEN [값1] AND [값2]
***********************************************************/
-- 특정 범위 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
-- BETWEEN ~ AND
select *
	from employee
    where hire_date between '2015-01-01' and '2017-12-31';

-- 급여가 6000 이상 8000 이하인 모든 사원들을 조회
-- BETWEEN ~ AND
select *
	from employee
    where salary between 6000 and 8000;

/**********************************************************
	특정 범위 액세스(논리합) : IN (값1, 값2, 값3 ...)
    형식 > SELECT [컬럼 리스트...]
		  FROM [테이블명]
          WHERE [컬럼명] IN (값1, 값2, 값3 ...)
***********************************************************/    
-- 사원명이 '오삼식', '김삼순', '일지매' 사원들 조회
select *
	from employee
	where emp_name ='오삼식'
	   or emp_name = '김삼순'
       or emp_name = '일지매';

-- IN 연산자
select * 
	from employee
    where emp_name in ('오삼식','김삼순','일지매');

       
-- 부서아이디가 MKT, SYS, STG에 속한 모든 사원 조회
select *
	from employee
    where  dept_id = 'MKT'
	   or  dept_id = 'SYS'
       or  dept_id = 'STG'
	order by dept_id;

-- IN
select *
	from employee
    where dept_id in ('MKT','SYS','STG')
    order by dept_id;
    
/**********************************************************
	특정 문자열 검색 : 와일드 문자(%, _) + LIKE
				   %(전체), _(한글자)
    형식 > SELECT [컬럼 리스트...]
		  FROM [테이블명]
          WHERE [컬럼명] LIKE '검색데이터(와일드 문자 포함)'
***********************************************************/
-- '한'씨 성을 가진 모든 사원을 조회
select *
	from employee
    where emp_name like '한%';
 
-- 영어 이름이 'f'로 시작하는 모든 사원을 조회
select *
	from employee
	where eng_name like 'f%';

-- 이메일 두번째 자리에 'a'가 들어가는 모든 사원들을 조회
select *
	from employee
    where email like '_a%';
    
-- 이메일 아이디가 4자인 모든 사원들을 조회
select *
	from employee
    where email like '____@%';
    
-- 부서아이디에 'A'가 들어가는 모든 사원들을 조회
select *
	from employee
    where dept_id like '%A%';
    
/**********************************************************
	내장함수 : 숫자함수, 문자함수, 날짜함수
    호출되는 위치 - [컬럼리스트], [조건절의 컬럼명]
***********************************************************/

-- [숫자함수]
-- 함수 실습을 위한 테이블 : DUAL
-- (1) 절대값 : abs(숫자)
select abs(100),abs(-100),100,-100 from dual;

-- (2) 소수점 절삭 : floor(숫자), truncate(숫자, 자릿수)
select floor(123.456), truncate(123.456, 0), truncate(123.456, 2)
	from dual;

-- 사원테이블의 sys 부서 사원들의 사번, 사원명, 부서아이디, 폰번호, 급여,
-- 보너스(급여의 25%)컬럼을 추가하여 조회, 보너스는 소수점 1자리 출력
select 
	emp_id,
	emp_name,
    dept_id,
    phone,
    salary,
    truncate(salary*0.25, 1) as bonus
 from employee
 where dept_id = 'SYS';

-- (3) rand() : 임의의 난수를 발생시키는 함수 (0 ~ 1)
select rand() from dual;

-- 정수 3자리(0 ~ 999) 사이의 난수 발생
select floor(rand() * 1000) as 'number' from dual;

-- 정수 4자리(0 ~ 9999) 사이의 난수 발생, 소수점 2자리
select truncate(rand() * 10000, 2) as 'number' from dual;

-- (4) mod(숫자, 나누는 숫자) : 나머지 함수
select mod(123, 2) as odd, mod(124, 2) as even from dual;

-- 3자리 수를 랜덤으로 발생시켜, 2로 나누어 홀수, 짝수를 구분
select mod(floor(rand()*1000 + 1), 2) as result from dual;

-- [문자함수]
-- (1) concat(문자열1, 문자열2) : 문자열 결합 함수
select concat('안녕하세요~', 'MySQL', ' 공부중입니다') as str from dual;

-- 사원테이블의 사원번호, 사원명, 사원명2 컬럼 조회
-- 사원명2 컬럼을 데이터 형식 : 예) S0001(홍길동) 
select 
	emp_id,
    emp_name,
	concat(emp_id,'(',emp_name,')') as emp_name2
 from employee;
 
 -- 사번,사원명, 영어이름, 입사일, 폰번호, 급여를 조회
 -- 영어이름의 출력형식을 '홍길동/hong' 타입으로 출력
 -- 영어이름이 null인 경우에는 'smith'를 기본으로 조회
 select 
	emp_id,
    emp_name,
    concat(emp_name,'/',ifnull(eng_name,'smith')) as 'eng_name',
    hire_date,
    phone,
    salary
from employee;

-- (2) substring(문자열, 위치 , 갯수) : 문자열 호출, 공백도 문자열 포함
select substring('대한민국 홍길동', 1, 4) as str1, 
	   substring('대한민국 홍길동', 6, 3) as str2
	from dual;

-- 사원테이블의 사번, 사원명, 입사년도, 입사월, 입사일, 급여를 조회
select 
	emp_id,
    emp_name,
    substring(hire_date, 1, 4) as year,
    substring(hire_date, 6, 2) as month,
    substring(hire_date, 9, 2) as day,
    salary
from employee;

-- 2015년도에 입사한 사원
select * from employee where hire_date like '2015-%';
select * from employee where substring(hire_date, 1, 4) = '2015';

-- 2018년도에 입사한 정보시스템(sys) 부서 사원 조회
select * 
	from employee 
	where substring(hire_date, 1, 4) = '2018'
		and dept_id = 'SYS';

-- (3) left(문자열, 갯수), right(문자열, 갯수) : 왼쪽, 오른쪽 기준으로 문자열 추출
select left(curdate(), 4) as year,
	   substring(curdate(), 6, 2) as month,
       right(curdate(), 2) as day
	from dual;

-- 2018년도에 입사한 모든 사원 조회
select * from employee where left(hire_date, 4) = '2018';

-- 2015년도부터 2017년 사이에 입사한 모든 사원 조회
select * from employee where left(hire_date, 4) between '2015' and '2017';

-- 사원번호, 사원명, 입사일, 폰번호, 급여를 조회
-- 폰번호는 마지막 4자리만 출력
select 
	emp_id,
    emp_name,
    hire_date,
    right(phone,4) as 'phone',
    salary
from employee;

-- (4) upper(문자열), lower(문자열) : 대,소문자로 치환
select upper('welcomeToMysql!!') as upper,
	   lower('welcomeToMysql!!') as lower
	from dual;

-- 사번, 사원명, 영어이름, 부서아이디, 이메일, 급여를 조회
-- 영어이름은 대문자, 부서아이디는 소문자, 이메일은 대문자
select emp_id
	   emp_name,
       upper(ifnull(eng_name, '')) as eng_name,
       lower(dept_id) as dept_id,
       upper(email) as email,
       salary
	from employee;
    
-- (5) trim(문자열) : 앞,뒤 공백제거
select trim('      대한민국') as t1,
	   trim('대한민국      ') as t2,
       trim('   대한민국     ') as t3,
       trim('   대한 민국    ') as t4
	from dual;
    
-- (6) format(문자열, 소수점자리) : 문자열 포맷 - 3자리 콤마 구분
select format(123456, 0) as format1,
	   format('123456', 0) as format2
	from dual;

-- 사번, 사원명, 입사일, 폰번호, 급여, 보너스(급여의 20%)를 조회
-- 급여, 보너스는 소수점 없이 3자리 콤마(,)로 구분하여 출력
-- 급여가 null인 경우에는 기본값 0
-- 2016년부터 2017년 사이에 입사한 사원
-- 사번 기준으로 내림차순 정렬

select emp_id,
	   emp_name,
	   hire_date,
       phone,
       concat(format(ifnull(salary, 0),0), '원') as salary,
	   concat(format(salary*0.2, 0), '원') as bonus
	from employee
    where left(hire_date, 4) between '2016' and '2017'
    order by emp_id desc;

-- [날짜 함수]
-- curdate() : 년-월-일 형식으로 현재날짜 출력
-- sysdate(), now() : 년-월-일-시-분-초 형식으로 현재날짜 출력
select curdate() as today1,
	   sysdate() as today2,
       now() as today3
	from dual;

-- [형변환 함수]
-- cast(변환값 as 데이터타입)
-- convert(변환값 as 데이터타입) :: MySQL OLD
select 123 as number, cast(123 as char) as str from dual;
select '1234' as str,
	   cast('1234' as signed integer) as numbe from dual;
select '20260421' as str,
		cast('20260421' as date) as date1 from dual;
        
-- now()
select now() as date,
	   cast(now() as char) as string,
       cast(cast(now() as char) as date) as date
			from dual;

-- signed integer, unsigned integer
select '1234' as string,
	   cast('1234' as signed integer) as cast_int,
       cast('1234' as unsigned integer) as cast_int,
       cast('1234' as decimal(10,2)) as cast_decimal
	from dual;

-- [문자열 치환 함수]
-- replace(문자열, old, new)
select '홍-길-동' as old,
	   replace('홍-길-동', '-', '/') as new
	from dual;

-- 사원테이블의 사번, 사원명, 입사일, 퇴사일, 부서아이디, 폰번호, 급여를 조회 
-- 입사일, 퇴사일 출력은 '-'을 '/'로 치환하여 출력
-- 재직중인 사원은 현재날짜를 출력
-- 급여 출력시 3자리 콤마(,) 구분
select emp_id,
	   emp_name,
       replace(hire_date, '-', '/') as hire_date,
       replace(ifnull(retire_date, curdate()),'-','/') as retire_date,
       dept_id,
       phone,
       format(salary,0) as salary
	from employee;
    
-- '20150101' 입력된 날짜를 기준으로 해당 날짜 이후에 입사한 사원들을 모두 조회
--  모든 mysql 데이터베이스에서 적용 가능한 형태로 작성
select *
	from employee
    where hire_date >= cast('20150101' as date);
    
-- '20150101' ~ '20171231' 사이에 입사한 사원들을 모두 조회
-- 모든 mysql 데이터베이스에서 적용 가능한 형태로 작성
select *
	from employee
    where hire_date between cast('20150101' as date) 
						and cast('20171231'as date);
                        
/********************************************************
	집계(그룹)함수 : sum(), avg(), count(), min(), max()...
    group by - 그룹함수를 적용하기 위한 그룹핑 컬럼 정의
    having - 그룹함수에서 사용하는 조건절
    ** 그룹함수는 그룹핑이 가능한 컬럼에 적용하는것이 Good!!
*********************************************************/

-- (1) sum(숫자) : 전체 총합을 구하는 함수
-- 사원테이블의 총 급여를 조회
-- 2026-04-21 기준 급여가 null이면 0으로 기본값 정의
select concat(format(sum(ifnull(salary,0)),0),'원') as 총급여 
	from employee;
    
-- (2) avg(숫자) : 전체 평균을 구하는 함수
-- 사원들의 전체 급여 평균을 조회, 3자리씩 ','로 구분하고 앞에 '$' 표시
-- 2026-04-21 기준 급여가 null이면 0으로 기본값 정의, 소수점은 
select concat('$', format(floor(avg(ifnull(salary, 0))), 0)) as avg
	from employee;
    
-- 정보시스템(sys) 부서 전체의 급여 총액과 평균을 조회
-- 3자리 구분, 마지막 '만원' 표시
select concat(format(sum(salary), 0), '만원') as sum,
	   concat(format(avg(salary), 0), '만원') as avg
	from employee
    where dept_id = 'sys';
    
-- (3) max(숫자) : 최대값을 구하는 함수
-- 사원테이블에서 가장 높은 급여를 받는 사원 조회
select concat(format(max(salary),0), '만원') as 최고급여 from employee;

-- (4) min(숫자) : 최소값을 구하는 함수
-- 사원테이블에서 가장 낮은 급여를 받는 사원 조회
select concat(format(min(salary),0), '만원') as 최저급여 from employee;

-- 사원들의 총급여, 평균급여, 최대급여, 최소급여를 조회
-- 3자리 구분, 화폐단위 '만원' 추가
-- 현재날짜 기준 급여컬럼이 null인 경우에는 0으로 치환
select concat(format(sum(ifnull(salary,0)),0), '만원') as 총급여, 
	   concat(format(floor(avg(ifnull(salary,0))),0),'만원') as 평균급여,
       concat(format(max(ifnull(salary,0)),0),'만원') as 최대급여, 
       concat(format(min(salary),0),'만원') as 최소급여
	from employee;

-- (5) count(컬럼) : 조건에 맞는 데이터의 row수를 조회, null은 제외
-- 사원테이블의 전체 row수
select count(*) from employee; -- 20
select count(salary) from employee; -- 19
select count(emp_id) from employee; -- 20

-- 재직중인 사원수 조회 : 16
select count(*)
	from employee
    where retire_date is null; 
    
select count(*) - count(retire_date) as '재직자',
	   count(retire_date) as '퇴사자'
	from employee;

-- 퇴사한 사원수 조회 : 4
select count(retire_date) from employee;
select count(*) from employee
	where retire_date is not null;
    
-- '2015년'에 입사한 사원수 조회 : 5
select count(*) 
	from employee
	where left(hire_date, 4) = '2015';

-- 정보시스템(SYS) 부서의 사원수 조회 : 6
select count(*) 
	from employee
	where dept_id = 'SYS';
    
-- 가장 빠른 입사자, 가장 늦은 입사자의 입사일을 조회
select min(hire_date), 
	   max(hire_date) 
	from employee;

-- 가장 빠른 입사자의 정보 조회
select *
	from employee
    where hire_date = '2013-01-01';

select *
	from employee
    where hire_date = (select min(hire_date) from employee);

-- [group by] : ~별, 부서별 사원수, 입사날짜별 총급여..
-- 그룹함수와 일반컬럼은 함께 사용 불가, 사용을 하려면 일반컬럼을 group by로 그룹핑 진행
-- 단, group by 대상인 일반 컬럼은 그룹핑이 가능해야함
select count(salary), salary
	from employee
	group by salary; -- salary 데이터를 그룹핑한 후 count(salary) 적용
    
-- 부서별 사원수, 총급여, 평균급여, 최대급여, 최소급여 조회
-- null은 0으로 치환
-- 3자리 구분, 소수점 절삭
select dept_id as 부서ID,
	   count(*) as 사원수,
       format(sum(ifnull(salary,0)),0) as 총급여,
       format(floor(avg(ifnull(salary,0))),0) as 평균급여,
       format(max(ifnull(salary,0)),0) as 최대급여,
       format(min(ifnull(salary,0)),0) as 최소급여
	from employee
    group by dept_id;
    
-- 연도별 사원수, 총급여, 평균급여, 최대급여, 최소급여 조회
-- null은 0으로 치환
-- 3자리 구분, 소수점 절삭
select left(hire_date, 4) as 입사년도,
	count(*) as 사원수,
    format(sum(ifnull(salary,0)),0) as 총급여,
	format(floor(avg(ifnull(salary,0))),0) as 평균급여,
	format(max(ifnull(salary,0)),0) as 최대급여,
	format(min(ifnull(salary,0)),0) as 최소급여
from employee 
group by left(hire_date, 4);

-- [having 조건절] 그룹함수 또는 group by 결과에 대한 조건을 정의
-- 부서별 총급여 조회
-- 총급여가 30000 이상인 부서만 출력
select  dept_id,
		sum(ifnull(salary,0)) as '총급여'
	from employee
    group by dept_id
    having sum(salary) >= 30000;
    
-- 연도별 사원수, 총급여, 평균급여, 최대급여, 최소급여 조회
-- 소수점 X, 3자리 구분
-- 총급여가 30000 이상인 년도 출력
-- 급여 협상이 안된 사원은 제외
select  left(hire_date, 4) as 연도별,
		format(sum(ifnull(salary, 0)), 0) as 총급여,
		format(floor(avg(ifnull(salary, 0))), 0) as 평균급여,
		format(max(ifnull(salary, 0)), 0) as 최대급여,
		format(min(ifnull(salary, 0)), 0) as 최소급여
	from employee
    where salary is not null
    group by left(hire_date, 4)
    having sum(salary) > 30000;

-- [rollup 함수] 리포팅을 위한 함수
-- 부서별 사원수, 총급여, 평균급여 조회
select	dept_id as '부서ID',
		count(*) as '사원수',
		sum(ifnull(salary,0)) as '총급여',
        truncate(avg(ifnull(salary,0)),0) as '평균급여'
	from employee
    group by dept_id with rollup;

-- rollup한 결과의 부서아이디를 추가
select	if(grouping(dept_id), '총합계', ifnull(dept_id, '-')) as dept_id,
		count(*) as '사원수',
		sum(ifnull(salary,0)) as '총급여',
        truncate(avg(ifnull(salary,0)),0) as '평균급여'
	from employee
    group by dept_id with rollup;

-- 연도별, 사원수, 총급여, 평균급여, 최대급여, 최소급여 조회, rollup 함수 적용
-- 💥!! grouping 함수안에는 함수를 넣을수 없음
-- 💥 if(grouping(left(hire_date,4)), '총합계', ifnull(left(hire_date,4), '-')) as hire_date,

select  if(grouping(year), '총합계', ifnull(year, '-')) as hire_date,
		count(*) as 사원수,
        format(sum(ifnull(salary, 0)), 0) as 총급여,
		format(floor(avg(ifnull(salary, 0))), 0) as 평균급여,
		format(max(ifnull(salary, 0)), 0) as 최대급여,
		format(min(ifnull(salary, 0)), 0) as 최소급여
	from employee,
			(select emp_id, left(hire_date, 4) year
			from employee) T1
    where employee.emp_id = T1.emp_id and salary is not null
    group by year with rollup;
    
-- [limit 함수] 출력갯수를 제한하여 조회
-- 오라클의 rownum 함수와 동일

-- 전체 사원 리스트 중 상위 5개만 출력
select * from employee limit 5;

-- 최대 급여를 받는 사원을 순서대로 3명 조회 
select * from employee
	order by salary desc limit 3;
    
/**************************************************************
	조인(JOIN) : 두 개이상의 테이블을 연동하여 하나의 데이터셋 구성
    ERD(Entity Relationship Diagram) : 데이터베이스 설계도(구조도)
    
    ** ANSI SQL : 데이터베이스 시스템들의 표준 SQL **
    ** 조인(JOIN) 종류 **
    (1) CROSS JOIN(CATEISIAN: 카테이션) - 합집합
		: 테이블의 데이터 전체를 조인
        예) 테이블1(10개) * 테이블2(10개) = 100개
	(2) INNER JOIN(EQUI) - 교집합
		: 두 개이상의 테이블들이 조인연결고리를 통해 조인 실행
	(3) OUTER JOIN - INNER JOIN + INNER JOIN에서 제외한 ROW 포함
		LEFT OUTER JOIN - 왼쪽의 테이블의 ROW 포함
        RIGHT OUTER JOIN - 오른쪽 테이블의 ROW 포함
	(4) SELF JOIN - 한(자신) 테이블을 두 개(자신, 사본)의 테이블처럼 조인
***************************************************************/

-- [CROSS JOIN]
-- 형식1) > SELECT [컬럼리스트]
-- 		   FROM [테이블1] CROSS JOIN [테이블2]
-- 		   WHERE [조건절]
-- 형식2) > SELECT [컬럼리스트]
-- 		   FROM [테이블1], [테이블2]
-- 		   WHERE [조건절]

-- employee, department cross join
select count(*) from employee; -- 20
select count(*) from department; -- 7
select count(*) from unit; -- 3
select * from employee 
	cross join department 
    cross join unit; -- 420
select count(*) from employee, department; -- 140

-- 사원, 휴가, 부서 테이블을 cross join
select count(*) from employee;   -- 20
select count(*) from vacation;   -- 102
select count(*) from department; -- 7

select count(*) from employee
	cross join vacation
    cross join department; -- 14280

select count(*) from employee, vacation, department; -- 14280

-- [INNER JOIN(EQUI JOIN)]
-- 형식1> SELECT [컬럼리스트]
-- 		 FROM [테이블1] INNER JOIN [테이블2]
-- 		 			   ON [테이블1.조인컬럼] = [테이블2.조인컬럼]

-- 형식2> SELECT [컬럼리스트]
-- 		 FROM [테이블1],[테이블2]
-- 		 WHERE [테이블1.조인컬럼] = [테이블2.조인컬럼]

select count(*) from employee inner join department
				on employee.dept_id = department.dept_id; -- 20
                
select count(*) 
	from employee, department
    where employee.dept_id = department.dept_id; -- 20
    
-- 사원테이블, 부서테이블, 본부테이블 inner join
select *
	from employee e inner join department d
					on e.dept_id = d.dept_id
                    inner join unit u
                    on d.unit_id = u.unit_id;

select *
	from employee,department,unit
    where employee.dept_id = department.dept_id
		and department.unit_id = unit.unit_id;

-- 모든 사원들의 사원번호, 사원명, 부서아이디, 부서명, 입사일, 급여를 조회
select  e.emp_id,
		e.emp_name,
        d.dept_id,
        d.dept_name,
        e.hire_date,
        e.salary
	from employee e, department d
    where e.dept_id = d.dept_id;
			
-- '영업'에 속한 사원들의 사원명, 입사일, 퇴사일, 급여, 부서아이디, 부서명 조회
--  재직중인 사원은 '현재날짜로 출력' 이라고 출력
select  e.emp_name,
		e.hire_date,
        ifnull(e.retire_date,curdate()) as retire_date,
        e.salary,
        d.dept_id,
        d.dept_name
	from employee e, department d
    where e.dept_id = d.dept_id
		and d.dept_name = '영업';

-- '2015'년도에 입사자들의 사번, 사원명, 입사일, 부서명, 본부아이디, 본부명을 조회

select  e.emp_id,
		e.emp_name,
        e.hire_date,
        d.dept_name,
        u.unit_id,
        u.unit_name
	from employee e, department d, unit u
    where e.dept_id = d.dept_id
		and d.unit_id = u.unit_id
        and year(e.hire_date) = '2015';
	
-- 인사과에 속한 사원들 중에 휴가를 사용한 사원의 내역 조회
-- 부서명은 '인사'

select *
	from employee e, department d, vacation v
	where e.dept_id = d.dept_id 
      and e.emp_id = v.emp_id
      and d.dept_name = '인사';
      
-- ANSI SQL
select *
	from employee e inner join department d on e.dept_id = d.dept_id
					inner join vacation v on e.emp_id = v.emp_id
	where d.dept_name = '인사';
    
-- 사원별 휴가사용 일수를 조회, 사원아이디, 사원명, 휴가일수 출력
-- 사용일수 기준 내림차순 정렬, 상위 5명 출력
select  e.emp_id,
		e.emp_name,
        count(*) as count
	from employee e, vacation v
	where e.emp_id = v.emp_id
		group by e.emp_id
		order by count desc
		limit 5;

select  e.emp_id,
		e.emp_name,
        count(*) as count
	from employee e inner join vacation v on e.emp_id = v.emp_id
		group by e.emp_id
		order by count desc
		limit 5;
    
-- 영업부서 사원의 사원명, 폰번호, 부서명, 휴가사용 이유, 소속본부 조회
-- 휴가사용 이유가 '두통'인 사원 조회
select e.emp_name,
	   e.phone,
       d.dept_name,
       v.reason,
       u.unit_name
	from employee e, department d, vacation v, unit u
    where e.dept_id = d.dept_id
		and e.emp_id = v.emp_id
		and d.unit_id = u.unit_id
		and d.dept_name = '영업'
        and v.reason = '두통';

-- ANSI SQL
select e.emp_name,
	   e.phone,
       d.dept_name,
       v.reason,
       u.unit_name
	from unit u inner join department d on u.unit_id = d.unit_id
				inner join employee e on d.dept_id = e.dept_id
                inner join vacation v on e.emp_id = v.emp_id
    where e.dept_id = d.dept_id
		and e.emp_id = v.emp_id
		and d.unit_id = u.unit_id
		and d.dept_name = '영업'
        and v.reason = '두통';

-- 2014년부터 2016년까지 입사한 사원들 중에서 퇴사하지 않은 사원들의
-- 사원아이디, 사원명, 부서명, 입사일, 소속본부를 조회
-- 소속본부 기준으로 오름차순 정렬

select e.emp_id,
	   e.emp_name,
       d.dept_name,
       e.hire_date,
       u.unit_name
	from employee e, department d, unit u
	where e.dept_id = d.dept_id
			and d.unit_id = u.unit_id
			and year(e.hire_date) between '2014' and '2016'
            and e.retire_date is null
			order by u.unit_id asc;

-- 부서별 총급여, 평균급여, 총휴가사용일수를 조회
-- 부서명, 부서아이디, 총급여, 평균급여, 휴가사용일수
-- 평균급여는 소수점2자리, 총급여, 평균급여는 3자리 구분
-- rollup 함수 추가
select 	if(grouping(d.dept_id),'합계', d.dept_id) as '부서아이디',
		ifnull(d.dept_name, '-') as '부서명',
		concat(format(sum(e.salary),0), '만원') as '총급여',
	    concat(format(truncate(avg(e.salary), 2), 0), '원') as '평균급여',
	    sum(v.duration) as '휴가사용일수'
	from department d, employee e, vacation v
    where d.dept_id = e.dept_id
		and e.emp_id = v.emp_id
		group by d.dept_id, d.dept_name with rollup
        having (grouping(d.dept_id) = grouping(d.dept_name));

-- 본부별 > 부서별 > 사원별로 그룹핑한 후 부서의 휴가사용 일수를 조회
select 	u.unit_id,
		u.unit_name,
        d.dept_name,
        e.emp_name,
        sum(v.duration) as '휴가사용 일수' -- 휴가 사용 일수
	from employee e, department d, unit u, vacation v
     where e.dept_id = d.dept_id
		and d.unit_id = u.unit_id
        and e.emp_id = v.emp_id
	group by u.unit_id, d.dept_id, e.emp_id;
    
-- [OUTER JOIN]
-- 오라클 INNER JOIN(EQUI JOIN) 문법에 (+) 코드를 추가하여 사용
-- 현재 오라클 문법은 MySQL에서는 사용불가
-- SELECT [컬럼리스트]
-- FROM [테이블1] LEFT/RIGHT OUTER JOIN [테이블2]
-- 			     ON [테이블1.조인컬럼] = [테이블2.조인컬럼]

select distinct dept_id from employee; -- 6
select dept_id from department; -- 7

-- LEFT OUTER JOIN : LEFT에 부서테이블 위치
-- 부서별 사원수 조회, 전체 부서 출력!!
select  d.dept_id,
		d.dept_name,
		count(e.emp_id) as '사원수'
	from department d left outer join employee e on d.dept_id = e.dept_id
		group by d.dept_id;

-- RIGHT OUTER JOIN : RIGHT에 부서테이블 위치
select  d.dept_id,
		d.dept_name,
		count(e.emp_id) as '사원수'
	from employee e left outer join department d on d.dept_id = e.dept_id
		group by d.dept_id;

-- 모든 부서의 아이디, 부서명, 본부명을 조회
-- 본부에 속하지 않은 부서는 '준비중'으로 출력
select	d.dept_id,
		d.dept_name,
        ifnull(u.unit_name, '준비중') as unit_name
	from department d left outer join unit u 
					  on d.unit_id = u.unit_id;

-- 본부별 > 부서별로 그룹핑 한후 부서의 휴가 사용일수를 조회
-- 부서의 누락없이 모두 출력

select 	u.unit_id,
		u.unit_name,
        d.dept_id,
        d.dept_name,
        sum(ifnull(v.duration, 0)) as '휴가사용일수'
	from employee e right outer join department d on e.dept_id = d.dept_id
					left outer join unit u on d.unit_id = u.unit_id
                    left outer join vacation v on e.emp_id = v.emp_id
	group by u.unit_id, d.dept_id
    order by sum(ifnull(v.duration, 0)) desc;


-- 2017년부터 2018년도까지 입사한 사원들의 사원명, 입사일, 연봉, 부서명, 본부명 조회
-- 단, 퇴사한 사원들 제외
select e.emp_name,
	   e.hire_date,
       e.salary,
       d.dept_name,
       u.unit_name
	from employee e right outer join department d on e.dept_id = d.dept_id
				    left outer join unit u on d.unit_id = u.unit_id
	where year(e.hire_date) between '2017' and '2018'
    and e.retire_date is null;
 
-- 서브쿼리(inner join + outer join)
select e.emp_name,
	   e.hire_date,
       e.salary,
       d.dept_name,
       u.unit_name
	from department d inner join
    (select * 
			from employee 
            where retire_date is null 
            and year(hire_date) between 2017 and 2018) e 
		on e.dept_id = d.dept_id
		left outer join unit u on d.unit_id = u.unit_id;

-- 서브쿼리(outer join)
select  e.emp_name,
		e.hire_date,
        e.salary,
        d.dept_name,
        u.unit_name
from (select emp_name, hire_date, salary, dept_id
		from employee 
		where retire_date is null) e right outer join department d 
									on e.dept_id = d.dept_id
									left outer join unit u 
                                    on d.unit_id = u.unit_id
where left(hire_date, 4) between '2017' and '2018';          
        
-- [SELF JOIN] 자신의 테이블을 조인
-- SELF 조인은 서브쿼리 형식으로 변환하여 사용됨!
-- 형식1> SELECT [컬럼리스트]
-- 	  	 FROM [테이블원본] LEFT/RIGHT JOIN [테이블사본]
-- 		 				ON [테이블원본.조인컬럼] = [테이블사본.조인컬럼]

-- 형식2> SELECT [컬럼리스트]
-- 	  	 FROM [테이블원본], [테이블사본]
-- 		 WHERE [테이블원본.조인컬럼] = [테이블사본.조인컬럼]

select * 
	from employee e1 left join employee e2 
					 on e1.emp_id = e2.emp_id;

select * 
	from employee e1, employee e2
    where e1.emp_id = e2.emp_id;
    
/**************************************************************
	서브쿼리(SubQuery) : 메인 쿼리에 다른 쿼리를 추가하여 실행방식
    -> (쿼리작성) 괄호안에 쿼리를 작성하여 메인쿼리에 추가
    형식 > SELECT [컬럼리스트 추가 -> (스칼라 서브쿼리)] 🔅오라클 사용❌
		  FROM [테이블명 추가 -> (인라인뷰)]
          WHERE [조건절 -> (서브쿼리 : 단일행, 다중행)]
***************************************************************/
-- [서브쿼리 : 단일행은 '='로 비교함]
-- '정보시스템' 부서의 사원들의 사번, 사원명, 입사일, 부서아이디, 급여 조회
select emp_id,
	   emp_name,
       hire_date,
       dept_id,
       salary
	from employee
    where dept_id  = (select dept_id from department 
						where dept_name = '정보시스템');
select dept_id
	from department
    where dept_name = '정보시스템';

select e.emp_id,
	   e.emp_name,
       e.hire_date,
       d.dept_id,
       e.salary
	from employee e, department d
    where e.dept_id = d.dept_id
		and d.dept_name = '정보시스템';

-- [서브쿼리: 단일행]
-- 홍길동 사원이 속한 부서아이디, 부서명, 부서오픈일 조회
select dept_id from employee where emp_name = '홍길동';
select dept_id,
	   dept_name,
       start_date
	from department
    where dept_id = (select dept_id from employee 
						where emp_name = '홍길동');

-- [서브쿼리 : 단일행]
-- 홍길동 사원의 휴가사용 내역을 조회
select emp_id from employee where emp_name = '홍길동';
select  vacation_id,
		emp_id,
        (select emp_name from employee where emp_name = '홍길동') as emp_name, -- 권장❌
        begin_date,
        end_date,
        reason,
        duration
	from vacation
    where emp_id = (select emp_id from employee where emp_name = '홍길동');

-- [서브쿼리 : 단일행]
-- '제3본부'에 속한 모든 부서를 조회
select unit_id from unit where unit_name = '제3본부';
select *
	from department
    where unit_id = (select unit_id from unit where unit_name = '제3본부');

-- [서브쿼리 : 단일행]
-- 최고 연봉을 받는 사원의 정보를 조회
select max(salary) from employee;
select *
	from employee
	where salary = (select max(salary) from employee);
    
-- [서브쿼리 : 단일행]
-- 최근에 입사한 사원의 정보를 조회 
select max(hire_date) from employee;
select *
	from employee
    where hire_date = (select max(hire_date) from employee);

-- [서브쿼리 : 단일행]
-- 가장 먼저 퇴사한 사람의 정보
select min(retire_date) from employee;
select *
	from employee
    where retire_date = (select min(retire_date) from employee);

-- [서브쿼리 : 단일행]
-- 가장 많은 휴가기간(duration)을 사용한 사원이 속한 부서의 모든 사원들을 조회
select *
	from employee
    where dept_id = ( select dept_id from employee
						where emp_id = (select emp_id from vacation 
											order by duration desc limit 1));
select * from employee
where dept_id = (
select distinct e.dept_id
	from employee e, vacation v
    where e.emp_id = v.emp_id
		and e.emp_id = (select emp_id from vacation 
											order by duration desc limit 1));

-- [서브쿼리 : 다중행 - IN, EXIST ..] 
-- '제3본부'에 속한 모든 사원 정보 조회
select * from employee 
	where dept_id in (select dept_id 
						from department 
                        where unit_id = (select unit_id 
											from unit 
                                            where unit_name = '제3본부')); 


-- '제3본부'에 속한 모든 사원 휴가 사용 정보 조회
select * from vacation
	where emp_id 
		in (select emp_id from employee 
				where dept_id 
                in (select dept_id 
						from department 
						where unit_id = (select unit_id 
											from unit 
											where unit_name = '제3본부'))); 

-- 휴가를 한 번이라도 사용한 모든 사원 조회
select * from employee e
	where exists (select 1
				from vacation v
				where e.emp_id = v.emp_id);

-- [인라인뷰 : 메인쿼리의 테이블 자리에 들어가는 쿼리 형식]
-- [휴가를 사용한 사원기준]사원별 휴가사용 일수를 그룹핑하여, 사원번호, 사원명, 입사일, 급여, 휴가사용일수를 조회
-- 1) 사원별 휴가사용 일수 그룹핑
select emp_id, sum(duration) as count
	from vacation
    group by emp_id;
-- 2) employee 테이블과 inner join
select  e.emp_id,
		e.emp_name,
        e.hire_date,
        e.salary,
        v.count as '휴가사용일수'
	from employee e, 
         (select emp_id, sum(duration) as count
			from vacation
			group by emp_id) v
	where e.emp_id = v.emp_id;

-- ANSI SQL
select  e.emp_id,
		e.emp_name,
        e.hire_date,
        e.salary,
        v.count as '휴가사용일수'
	from employee e inner join 
					 (select emp_id, sum(duration) as count
						from vacation
						group by emp_id) v
					on e.emp_id = v.emp_id;	

-- [휴가를 사용한 사원 + 사용하지 않은 사원 포함]
-- 사원별 휴가사용 일수를 그룹핑하여, 사원번호, 사원명, 입사일, 급여, 휴가사용일수를 조회 
-- 휴가를 사용하지 않은 사원의 휴가사용일수는 0
-- 휴가사용일수는 내림차순 정렬
select 	e.emp_id,
		e.emp_name,
        e.hire_date,
        e.salary,
        ifnull(v.count, 0) as count
from employee e left outer join			
				(select emp_id, sum(duration) as count
					from vacation
					group by emp_id) v
				on e.emp_id = v.emp_id
order by count desc;

use hrdb2019;
-- '2015' ~ '2017'년도 입사한 사원들의 총휴가사용 일수 조회
-- 1) '2015' ~ '2017'년도 입사자 조회
select *
	from employee
    where left(hire_date, 4) between '2015' and '2017';

-- 2) 사원별 총휴가일수 조회
select emp_id, sum(duration) as count
	from vacation 
    group by emp_id;

select * from vacation;

-- 3) 1, 2을 조인 => 2015~2017년도 입사자들의 휴가사용 일수 모두 포함
select  t1.emp_id,
		t1.emp_name,
        t1.hire_date,
        ifnull(t2.count, 0) as count
	from (select *
			from employee
			where left(hire_date, 4) between '2015' and '2017') t1
		left outer join
		 (select emp_id, sum(duration) as count
			from vacation 
			group by emp_id) t2
		on t1.emp_id = t2.emp_id
	order by count desc ;

-- 1) 부서별 총급여, 평균급여를 조회
select  dept_id,
		sum(ifnull(salary, 0)) sum, 
		floor(avg(ifnull(salary, 0))) avg
	from employee
    group by dept_id;

-- 2) 부서테이블과 조인하여 모든 부서의 총급여, 평균급여 출력  
select count(*) from department; 
select  d.dept_id,
		d.dept_name, 
        d.unit_id,
        d.start_date,
        ifnull(t1.sum, 0) sum,
        ifnull(t1.avg, 0) avg
	from department d left outer join
					(select  dept_id,
							sum(ifnull(salary, 0)) sum, 
							floor(avg(ifnull(salary, 0))) avg
						from employee
						group by dept_id) t1
					on d.dept_id = t1.dept_id;

-- 3) 사원테이블을 조인하여, 사원명, 급여, 부서아이디, 부서명, 총급여, 평균급여 조회
select  e.emp_name,
		e.salary,
        s.dept_id,
        s.dept_name,
        s.sum,
        s.avg
	from employee e,
		(select  d.dept_id,
				d.dept_name, 
				d.unit_id,
				d.start_date,
				ifnull(t1.sum, 0) sum,
				ifnull(t1.avg, 0) avg
			from department d left outer join
							(select  dept_id,
									sum(ifnull(salary, 0)) sum, 
									floor(avg(ifnull(salary, 0))) avg
								from employee
								group by dept_id) t1
							on d.dept_id = t1.dept_id) s
	where e.dept_id = s.dept_id;

-- [스칼라서브쿼리 : 컬럼리스트에 사용하는 서브쿼리 형식]
-- 정보시스템 부서의 사원정보 출력
-- 정보시스템 부서의 총급여, 평균급여 함께 출력
select  emp_id,
		emp_name,
        dept_id,
        salary,
        (select sum(salary) from employee where dept_id='SYS') as '총급여',
        (select floor(avg(salary)) from employee where dept_id='SYS')
			as '평균급여'
	from employee
    where dept_id = 'SYS';


 /*******************************************************
	테이블 결과 합치기 : union, union all
	형식> 쿼리1 실행 결과 
         union  => 중복 제거
         쿼리2 실행 결과
	형식> 쿼리1 실행 결과 
         union all  => 중복 허용
         쿼리2 실행 결과   
	🔆 쿼리1, 쿼리2의 실행 컬럼의 타입과 이름이 동일해야함
********************************************************/ 
-- 영업(MKT), 정보시스템(SYS) 부서의 사원아이디, 사원명, 급여, 부서아이디 조회
-- union을 사용하여 실행결과 합치기
select emp_id, emp_name, salary, dept_id 
	from employee 
    where dept_id = 'MKT'
union    
select emp_id, emp_name, salary, dept_id 
	from employee 
    where dept_id = 'SYS'
union
select emp_id, emp_name, salary, dept_id 
	from employee 
    where dept_id = 'MKT';

-- 영업(MKT), 정보시스템(SYS) 부서의 사원아이디, 사원명, 급여, 부서아이디 조회
-- union all을 사용하여 실행결과 합치기
select emp_id, emp_name, salary, dept_id 
	from employee 
    where dept_id = 'MKT'
union    
select emp_id, emp_name, salary, dept_id 
	from employee 
    where dept_id = 'SYS'
union    
select emp_id, emp_name, salary, dept_id 
	from employee 
    where dept_id = 'SYS'    
union all
select emp_id, emp_name, salary, dept_id 
	from employee 
    where dept_id = 'MKT';

/*******************************************************
	논리적인 테이블 : 뷰(View)
    - SQL을 실행하여 생성된 결과를 가상테이블로 정의
    - 생성> CREATE VIEW [VIEW NAME]
			AS [ SQL 정의 ]
	- 삭제> DROP VIEW [VIEW NAME]
    🔆 VIEW 생성시 권한을 할당 받아야 함!! => MySQL,Maria 기본할당
********************************************************/    
-- 시스템에 생성된 뷰 정보 확인
-- information_schema.views
select *
	from information_schema.views
    where table_schema = 'hrdb2019';
    
-- 부서 총급여가 30000 이상인 뷰 정의
create view sum_salary
as 
	select  dept_id, 
			ifnull(sum(salary), 0) as sum
		from employee
		group by dept_id
		having ifnull(sum(salary), 0) >= 30000;

-- sum_salray 조회
select dept_id from sum_salary;
select * from sum_salary;     

-- sum_salary 뷰삭제     
drop view sum_salary;
select * from information_schema.views
	where table_schema = 'hrdb2019';

-- 사원테이블을 조인하여, 사원명, 급여, 부서아이디, 부서명, 총급여, 평균급여 조회
create view emp_dept_sum
as
	select  e.emp_name,
			e.salary,
			s.dept_id,
			s.dept_name,
			s.sum,
			s.avg
		from employee e,
			(select  d.dept_id,
					d.dept_name, 
					d.unit_id,
					d.start_date,
					ifnull(t1.sum, 0) sum,
					ifnull(t1.avg, 0) avg
				from department d left outer join
								(select  dept_id,
										sum(ifnull(salary, 0)) sum, 
										floor(avg(ifnull(salary, 0))) avg
									from employee
									group by dept_id) t1
								on d.dept_id = t1.dept_id) s
		where e.dept_id = s.dept_id;
        
select * from emp_dept_sum;

-- view 확인
select * from information_schema.views
	where table_schema = 'hrdb2019';
   
-- emp_dept_sum 테이블에서 '홍길동'사원의 정보 조회
select * from emp_dept_sum;
select *
	from emp_dept_sum
    where emp_name = '홍길동';

-- 사원별 전체휴가사용일수, 부서아이디, 부서명을 조회한 후 뷰로 생성
-- 전체 사원 대상, null은 0으로 대체
create view v_emp_dept
as
select 	e.emp_id,
		e.emp_name,
        e.hire_date,
        e.salary,
        ifnull(v.duration, 0) as duration,
        d.dept_id,
        d.dept_name,
        d.unit_id
	from ( select emp_id, sum(duration) as duration
			from vacation
			group by emp_id ) v right outer join employee e
		 on v.emp_id = e.emp_id
         right outer join department d
         on e.dept_id = d.dept_id;
            
select * from information_schema.views
	where table_schema = 'hrdb2019';

-- 
select * from v_emp_dept;
drop view v_emp_dept;
drop view emp_dept_sum;

-- '제3본부' 소속 부서의 사원들 휴가사용 일수를 조회
select *
	from unit u, v_emp_dept ve
    where ve.unit_id = u.unit_id
		and u.unit_name = '제3본부';

-- 휴가사용일수가 15일 이상되는 사원들의 사원명, 부서아이디, 부서명, 본부아이디, 본부명 조회
select  ve.emp_name,
		ve.dept_id,
        ve.dept_name,
        u.unit_id,
        u.unit_name
	from unit u, v_emp_dept ve
    where u.unit_id = ve.unit_id
		and ve.duration >= 15
	order by ve.duration desc;
    
/*******************************************************************************
	DDL(Data Definition Language) : 생성, 수정, 삭제 -> 테이블 기준
    테이블 생성 형식 >
		CREATE TABLE [테이블명] (
			컬럼명 데이터 타입 옵션(제약사항, 널포함...)
		....
		)
        
	데이터 타입 정리
    분류    		타입          	크기/형식            설명                사용예
    --------------------------------------------------------------------------
    정수형  		tinyint 	    1byte			 작은정수값 		 	상태값(0/1)
				smallint	    2byte 			 				 	카운트
				int				4byte			 디폴트값			 	일반정수값
				bigint	    	8byte			 큰 정수값			 	pk,주문번호
	실수형  		float 			4byte			 부동소수점			 	거의 사용안함
				double			8byte			 디폴트값			 	통계수치
	문자형(고정) 	char  			고정길이			 빠른공간확보(장)	 	코드값
												 공간낭비(단)			
    문자형(가변)	varchar			가변길이			 가장 많이 사용됨		이름,주소...
    텍스트 		text 			~ 64kb			 긴 문장 저장			게시글
				longtext		~ 4GB			 초대형 텍스트 			로그
	바이너리		blob			~ 64, ~4GB		 이미지 파일, 파일저장
	날짜			date			yyyy-mm-dd		 날짜					생일
				datetime		date + 시간		 날짜, 시간....		작업완료
	JSON 		JSON			JSON 구조			 API 데이터처리			API 응답...
*******************************************************************************/
desc employee;

-- emp 테이블 생성
-- emp_id(사번): 4, ename(사원명): 5, hire_date(입사일): date
-- salary(급여): 4
create table emp(
	emp_id		char(4), -- 0001, 0002...
    ename		varchar(5),
    hire_date   date,
    salary 		int
); 
 show tables;
 desc emp;
 select * 
	from information_schema.tables
    where table_schema = 'hrdb2019';
    
/*****************************************************************************
	테이블 삭제
    형식 > DROP TABLE [테이블명];
*****************************************************************************/
show tables;
select * from information_schema.tables
	where table_name = 'emp';
    
drop table emp;

/*****************************************************************************
	테이블 복제(CAS)
    형식 > CREATE TABLE [테이블명]
			AS [서브쿼리];
*****************************************************************************/
-- 2016년도 입사한 사원의 정보를 조회하여 EMPOLYEE_2016 테이블 생성
create table employee_2016
as  
select * 
	from employee
	where year(hire_date) = '2016';
 
show tables; 
select * from information_schema.tables
	where table_name = 'employee_2016';

desc employee_2016; -- 🌟원본의 제약사항은 복제되지 않음!!
desc employee;

-- employee_department 테이블 생성
-- employee + department 테이블 조인, dept_id는 하나만 저장

create table employee_department
as
select e.emp_id,
	   e.emp_name,
       e.gender,
       e.hire_date,
       e.phone,
       e.email,
       e.salary,
       d.dept_id,
       d.dept_name,
       d.unit_id,
       d.start_date
	from employee e, department d
	where e.dept_id = d.dept_id;

show tables;
select * from information_schema.tables
	where table_name = 'employee_2016';
    
desc employee_department;
select * from employee_department;

-- 테이블 구조만 복제
create table emp
as
select * from employee
	where 1 = 0;
    
select * from information_schema.tables
	where table_name = 'emp';
desc emp;

/*****************************************************************************
	데이터 생성(Create :: Insert)
    형식 > INSERT INTO [테이블명](컬럼리스트..) -- 컬럼리스트 생략가능
			VALUES(데이터1, 데이터2...)
*****************************************************************************/
desc emp;
insert into emp(emp_id,   	 -- char(5)
			    emp_name, 	 -- varchar(4)
                eng_name, 	 -- varchar(20)
                gender,   	 -- char(1)
                hire_date,	 -- date
                retire_date, -- date, null 허용
                dept_id,	 
                phone,
                email,
                salary)
	 values('S0001', '홍길동', null, 'M', curdate(), null, 'SYS', '010-1234-1234', 'hong@naver.com', null);
     
select * from emp;

-- 컬럼리스트 상의 순서와 입력 데이터가 정확 매핑되어야함.
insert into emp(emp_name,    -- char(5)
			    emp_id, 	 -- varchar(4)
                eng_name, 	 -- varchar(20)
                gender,   	 -- char(1)
                hire_date,	 -- date
                retire_date, -- date, null 허용
                dept_id,	 
                phone,
                email,
                salary)
	 values('이순신', 'S002', null, 'M', curdate(), null, 'SYS', '010-1234-1234', 'hong@naver.com', null);
     
select * from emp;
desc emp;

-- 컬럼리스트 생략 시 테이블 구조를 기준으로 입력
insert into emp
	 values('S0003', '김삼순', null, 'F', curdate(), null, 'SYS', '010-1234-1234', 'Kim@naver.com', null);
select * from emp;

-- null이 허용되는 컬럼은 컬럼리스트에서 생략 가능
insert into emp(emp_id,  -- char(5)
			    emp_name, 	 -- varchar(4)
                gender,   	 -- char(1)
                hire_date,	 -- date
                dept_id,	 
                phone,
                email)
	 values('S0004', '홍길순', 'M', curdate(), 'SYS', '010-1234-1234', 'hong@naver.com');
     
select * from emp;

/*****************************************************************************
	DDL - 테이블의 데이터 절삭(Truncate), 데이터가 영구적으로 삭제
    형식 > TRUNCATE TABLE [테이블명];
*****************************************************************************/
select count(*) from emp;
select * from emp;
truncate table emp;
drop table emp;
show tables;
select * from information_schema.tables
	where table_name = 'emp';

-- emp 생성 : eid(char, 4, not null), ename(varchar, (5)), gender(char, 1)
-- 			 hire_date(datetime), salary(int)
-- eid, ename, gender 컬럼은 null을 허용하지 않음 : not null
create table emp(
	eid char(4) not null,
    ename varchar(5) not null,
    gender char(1) not null,
    hire_date datetime,
    salary int
);
desc emp;
show tables;
select * from information_schema.tables
	 where table_name = 'emp';
     
insert into emp(eid, ename, gender, hire_date, salary)
	values('S001', '홍길동', 'M', null, null);

insert into emp(gender, ename, eid, hire_date, salary)
	values('F', '홍길순', 'S003', now(), 1000);
    
select * from emp;

/*****************************************************************************
	자동 번호 생성기 : auto_increment
    - 테이블 생성시 옵션 자리에 기술, pk 컬럼에 사용, 정수형 데이터 생성
    - 반드시 primary key 제약과 함께 사용
    형식 > CREATE TABLE [테이블명] (
		  컬럼명 데이터타입    AUTO_INCREMENT
          ...
	)
*****************************************************************************/

-- emp2 생성 : eid(int, 자동번호 생성), ename(varchar, (5)), gender(char, 1)
-- 			 hire_date(datetime), salary(int)
-- eid, ename, gender 컬럼은 null을 허용하지 않음 : not null
create table emp2(
	eid int auto_increment primary key, -- uniq + not null
    ename varchar(5) not null,
    gender char(1) not null,
    hire_date datetime,
    salary int
);
show tables;
select * from information_schema.tables
	where table_name = 'emp2';
desc emp2;

insert into emp2(ename, gender) values('홍길동','M');
insert into emp2(ename, gender, hire_date) values('이순신','M', now());
insert into emp2(ename, gender, hire_date, salary) values('김유신','M', now(), 3000);
select * from emp2;

/*****************************************************************************
	DDL - 테이블 변경 : ALTER TABLE
    형식 > ALTER TABLE [테이블명]
			ADD COLUMN[NEW COLUMN, 데이터 타입] -- NULL 허용
            MODIFY COLUMN [MODIFY COLUMN, 데이터 타입] -- 크기 고려
            DROP COLUMN [DROP COLUMN]
*****************************************************************************/

show tables;
desc emp;

-- emp 테이블에 phone(char, 13, '-'포함) 컬럼 추가
alter table emp
	add column phone char(13);
	
desc emp;
select * from emp;

-- phone 컬럼의 크기를 20으로 변경
alter table emp
	modify column phone char(20);
desc emp;

-- ename 컬럼에 데이터가 존재하는 경우
-- ename 컬럼의 크기를 varchar(2)로 변경, 크기를 작게 변경하는 경우
-- 데이터 유실이 발생하므로, 에러 발생
-- ename 컬럼의 크기를 varchar(10)로 변경, 크게 변경은 정상실행
select * from emp;
alter table emp
	modify column ename varchar(10) not null;
desc emp;

/*****************************************************************************
	데이터 수정 : UPDATE 
    형식 > UPDATE [테이블명]
		  SET [컬럼명 = NEW 데이터, ...]
		  WHERE [조건절]
	!! MySQL은 Update 권한 변경 후 진행
    => SET SQL_SAFE_UPDATE = 0(허용) / 1(불가)
*****************************************************************************/
select * from emp;

-- S001 사번의 폰번호 업데이트
set sql_safe_updates = 0;
update emp 
	set phone = '010-1234-4567'
    where eid = 'S001';

-- 모든 사원의 폰번호를 '010-1111-1234' 수정
update emp
	set phone = '010-1111-1234';

select * from emp;

-- phone 컬럼에 not null 제약 추가
alter table emp
	modify phone char(20) not null;
desc emp;

-- emp 테이블에 email 컬럼 추가 후 not null 제약 정의
-- 1) 컬럼 추가 시 null 허용
-- 2) update 명령으로 기존 데이터 추가
-- 3) not null 제약 정의

alter table emp add email varchar(20);

desc emp;
select * from emp;
update emp set email = 'test@naver.com';
alter table emp modify email varchar(20) not null;

-- employee 테이블을 복제하여 copy_emp 테이블 생성
show tables;

create table copy_emp
as
select * from employee;

alter table copy_cmp
      rename to copy_emp;

-- 홍길동 사원의 급여를 6000으로 수정
update copy_emp
	set salary = 6000
    where emp_name = '홍길동';

-- 안경태 사원의 입사일을 '20210705'로 수정
update copy_emp
	set hire_date = cast('20210705' as date) -- cast 함수
    where emp_name = '안경태';
    
select * from copy_emp
where emp_name in ('홍길동','안경태');

show tables;
desc emp2;
-- (1) emp2 테이블에 retire_date 컬럼 추가 : date, null 허용
alter table emp2
	add column retire_date date;
    
-- (2) null 데이터를 현재 날짜로 수정
update emp2
	set retire_date = curdate();
    
-- (3) retire_date를 'not null' 제약 정의
alter table emp2
	modify column retire_date date not null;

desc emp2;
select * from emp2;

-- '정보 시스템' 부서의 모든 사원 급여를 20% 증가
update copy_emp
	set salary = salary + salary * 0.2
where dept_id = (select dept_id from department where dept_name = '정보시스템');

-- 'S0003'인 강우동 사원의 영어이름을 'kang', 입사일은 현재날짜, 부서를 MKT로 변경
update copy_emp
	set eng_name = 'kang' ,
		hire_date = curdate(),
        dept_id = 'MKT'
    where emp_id = 'S0003';
    
select * from copy_emp where emp_id = 'S0003';

-- 트랜잭션별 업데이트 정의
-- 트랜잭션 관리 명령어 DTL : commit(작업완료), rollback(작업복원)
-- 현재 트랜잭션 방식 확인 1, 시스템에서 자동 트랜잭션 관리
-- DML 명령어에 영향을 줌, DDL은 관리방식에 상관없이 무조건 autocommit
select @@autocommit; 
set autocommit = 0; -- 트랜잭션 관리 방식을 수동 전환

commit; -- 새로운 트랜잭션 시작
select * from emp;

-- 이순신의 급여를 3000으로 수정
update emp set salary = 3000 where eid = 'S002'; -- 물리적 DB에 반영되기 전
select * from emp;
-- rollback;
commit;
select * from emp;
rollback;

/**************************************************************
	데이터 삭제 : DELETE
    형식 > DELETE FROM [테이블명]
		  WHERE [조건절]
	!! MySQL은 Update 권한 변경 후 진행
    => SET SQL_SAFE_UPDATE = 0(허용) / 1(불가)
*****************************************************************/
select @@sql_safe_updates; -- 업데이트 모드 확인
select @@autocommit; 	  -- 트랜잭션 방식 확인
commit;
-- emp 테이블의 이순신, 홍길동 사원 삭제
select * from emp;
delete from emp where eid in ('S001','S002');
-- rollback;
commit;
select * from emp;

--
commit;
-- emp 테이블의 모든 사원 삭제, truncate 명령어 사용
truncate table emp;
select * from emp;
rollback; -- truncate table 명령은 ddl이므로 autocommit 됨
commit;

set autocommit = 1;
select @@autocommit;


/*********************************************************************
	제약사항(Constraints) : 데이터 무결성 원칙을 적용하기 위한 규칙
    - Unique 제약사항 : 중복을 방지하는 제약
    - Not null 제약사항 : null 값을 허용하지 않는 제약
    - Primary 제약사항 : Unique + Not null, Auto-increment 함께 사용
    - Foreign 제약사항 : 타 테이블의 기본키를 참조하는 제약, 컬럼 정의하여 참조하는 제약,
					  기본키와 참조하는 컬럼은 데이터타입이 동일해야함.
	- Default 제약사항 : 데이터 입력 시 기본으로 저장되는 데이터를 정의하는 제약
    
    ** 제약사항은 테이블 생성시, 테이블 수정시 정의할 수 있음.
**********************************************************************/
-- 제약사항 확인
show tables;
desc employee;
select * from information_schema.table_constraints
	where table_schema = 'hrdb2019';

-- emp_const 테이블 생성, 기본키 제약(primary), 참조키 제약(foreign), not null

create table emp_const(
	emp_id char(4) primary key,
    emp_name varchar(5) not null,
    hire_date date,
    salary int
);

create table emp_const2(
	emp_id char(4),
    emp_name varchar(5) not null,
    hire_date date,
    salary int
);

show tables;
select * from information_schema.tables
	where table_name like 'emp%';
    
desc emp_const;
desc emp_const2;

-- 데이터 insert 작업 시 제약사항 체크함
insert into emp_const(emp_id, emp_name, hire_date, salary)
	values('S001', '홍길동', curdate(), 1000);
insert into emp_const2(emp_id, emp_name, hire_date, salary)
	values('S001', '홍길동', curdate(), 1000);
    
insert into emp_const(emp_id, emp_name)
	values('S002', '스미스');
insert into emp_const2(emp_id, emp_name)
	values('S002', '스미스');
    
select * from emp_const;
select * from emp_const2;

create table emp_const3(
	emp_id char(4),
    emp_name varchar(5) not null,
    hire_date date,
    salary int,
    constraint pk_emp_const3_emp_id primary key(emp_id)
);

desc emp_const3;
select * from information_schema.table_constraints
	where table_name = 'emp_const3';
    
select * from information_schema.table_constraints
	where table_schema = 'hrdb2019';
    
/*********************************************************************
	제약사항 추가/수정/삭제
    형식 > ALTER TABLE [테이블명]
		ADD CONSTRAINT [제약사항명] 제약사항(컬럼)
        MODIFY CONSTRAINT [제약사항명] 제약사항(컬럼)
        DROP [제약사항명]
	🔅 제약사항은 삭제 후 재정의하는 것을 원칙으로함!!
**********************************************************************/

-- emp_const 테이블의 제약사항 확인
select * from information_schema.table_constraints
	where table_name = 'emp_const';
desc emp_const;

-- emp_const 테이블에 phone 컬럼 추가, char(13) 타입
select * from emp_const;
alter table emp_const
	add phone char(13);
desc emp_const;

-- phone 컬럼에 null 값을 '010-1111-1234' 수정
select @@sql_safe_updates;
update emp_const set phone = '010-1111-1234';
select * from emp_const;

-- phone 컬럼에 default 제약사항 추가 '010-1111-1234' 수정
alter table emp_const
	modify phone char(13) default '010-1111-1234';
desc emp_const; -- not null, default, check(?) 제약 확인
select * from information_schema.table_constraints
	where table_name = 'emp_const'; -- pk fk 확인

select * from emp_const;
insert into emp_const(emp_id, emp_name, hire_date)
	values('S003', '홍길동', now());

-- salary 컬럼에 default 제약 추가 기본값 : 1000
alter table emp_const
	modify salary int default 1000;
desc emp_const;

-- hire_date 컬럼에 default 제약 추가 curdate() 함수사용 불가, '년-월-일'
alter table emp_const
	modify hire_date date default '2026-01-01';
desc emp_const;

insert into emp_const(emp_id, emp_name) values('S004', '김유신');
select * from emp_const;

-- check 제약 : mysql 8.0(+)
desc emp_const;
desc emp_const3;
-- emp_const3 테이블의 hire_date 컬럼은 default 제약 추가, '2026-04-01'
-- salary 컬럼은 not null 제약 변경
select * from emp_const3;
alter table emp_const3
	modify hire_date date default '2026-04-01';
    
alter table emp_const3
	modify salary int not null;
desc emp_const3;

-- salary 값 입력시 '3000' 이상인 값만 저장되도록 check 제약사항 추가
alter table emp_const3
	add constraint chk_emp_const3_salary check (salary >= 3000);
desc emp_const3;
select * from information_schema.table_constraints
	where table_name = 'emp_const3';
    
insert into emp_const3(emp_id, emp_name, salary) values('S001', '홍길동', 4000);
select * from emp_const3;

-- emp_const3 테이블에 emp_name 컬럼에 unique 제약 추가
select * from information_schema.table_constraints
	where table_name = 'emp_const3';

select * from information_schema.key_column_usage
	where table_name = 'emp_const3';
    
alter table emp_const3
	add constraint un_emp_const3_emp_name unique(emp_name);

select * from emp_const3;
insert into emp_const3
	values('S002', '홍길순', curdate(), 3000);
    
desc emp_const2;
select * from emp_const2;

-- emp_const2 데이터 삭제
delete from emp_const2;

-- emp_id 기본키 제약 추가
alter table emp_const2
	add constraint pk_emp_const2_emp_id primary key(emp_id);
    
desc emp_const2;
select * from information_schema.table_constraints
	where table_name = 'emp_const2';

select * from emp_const2;
-- dept_id 컬럼 추가 char(3) , not null 제약 추가
alter table emp_const2
	add column dept_id char(3) not null;
desc emp_const2;

-- department를 복제하여 department2 테이블 생성
create table department2
			as select * from department;

desc department;
desc department2;
select * from department2;
-- dept_id 컬럼에 기본키 제약 추가
alter table department2
	add constraint pk_department2_dept_id primary key(dept_id);
desc department2;

select * from information_schema.key_column_usage
		where table_name = 'department2';

-- 컬럼명 변경
alter table emp_const2
	rename column dept_id to did;
    
desc emp_const2; -- did
desc department2; -- dept_id

-- emp_const2 테이블의 did(부서아이디) 컬럼에 참조키 제약 추가 --> department2의 dept_id
alter table emp_const2
	add constraint fk_emp_const2_did foreign key(did)
		references department2(dept_id);

select * from information_schema.table_constraints
	where table_name = 'emp_const2';

desc emp_const2;
select * from emp_const2;

insert into emp_const2(emp_id, emp_name, did)
		values('S001', '홍길동', 'SYS');
insert into emp_const2(emp_id, emp_name, did)
		values('S002', '이순신', 'ACC');

-- department2 테이블의 SYS 부서 삭제한다면.... emp_const2에서 참조하므로, 삭제불가!!!
-- (1) emp_const2 테이블의 sys 참조 행을 삭제
-- (2) department2 테이블의 sys 데이터 삭제 가능
delete from department2
	where dept_id = 'SYS';
    
-- (1)
delete from emp_const2 where did = 'SYS';
select * from emp_const2;

-- (2)
delete from department2 where did = 'SYS';
select * from department2;

-- 참조하는 부모테이블의 컬럼이 변화함에 따라 자식도 함께 적용받도록 옵션 정의
-- ON [DELETE / UPDATE] CASCADE; 참조키 제약 정의시 마지막에 추가
select * from information_schema.table_constraints
		where table_name = 'emp_const2';
        
-- emp_const2 테이블의 참조키 제약 삭제
alter table emp_const2
	drop constraint fk_emp_const2_did;

-- emp_const2 테이블의 참조키 제약 정의, on delete/update cascade 추가
alter table emp_const2
	add constraint fk_emp_const2_did foreign key(did)
		references department2(dept_id) 
			on delete cascade
            on update cascade;

select * from information_schema.table_constraints
		where table_name = 'emp_const2';
        
select * from information_schema.key_column_usage
		where table_name = 'emp_const2';

-- department2의 'ACC' 부서를 'ABC' 부서로 수정
update department2
	set dept_id = 'ABC'
		where dept_id = 'ACC';
select * from emp_const2;

-- department2의 'ABC' 부서를 삭제
delete from department2
	where dept_id = 'ABC';
select * from emp_const2;

/*********************************************************************
	행번호 : row_number() over() as '별칭'
**********************************************************************/

-- 정보시스템 부서의 사원들 연봉이 높은 순으로, 사번, 사원명, 급여 조회
select  row_number() over(order by salary desc) as rno,
		emp_id,
        emp_name,
        salary
	from employee 
		where dept_id = 'SYS';

-- 휴가를 많이 사용한 사원순으로 조회, 행번호, 사원명, 부서아이디, 휴가일수(총합)
select  row_number() over(order by sum(duration) desc) as rno,
		e.emp_id,
	    e.emp_name,
        e.dept_id,
        sum(v.duration) as '휴가일수(총합)'
	from employee e, vacation v
		where e.emp_id = v.emp_id
		group by v.emp_id;
        
/*********************************************************************
	석차 : rank() over() as '별칭'
**********************************************************************/
-- 사원이 급여가 높은순으로 정렬
select  rank() over(order by salary desc) as 'rank',
		emp_id,
        emp_name,
        salary
	from employee;

-- 입사일이 빠른 순서대로 정렬
select  rank() over(order by hire_date asc) as 'rank',
		emp_id,
        emp_name,
        salary,
        hire_date
	from employee;
    
    
/*********************************************************************
	트리거 생성 : 테이블의 pk 정의 :: '문자' + '000' + 1(auto_increment)
**********************************************************************/
-- trigger 생성 : 여러개의 sql문 포함
/************************************************
delimiter $$
create trigger [트리거명]
before insert on [테이블명]
for each row
begin
declare max_code int;  --  'M0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right([기본키 컬럼명], 4) AS UNSIGNED)), 0)
INTO max_code
FROM [테이블명]; 

-- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자형식) : M0001
SET NEW.[기본키 컬럼명] = concat('M', LPAD((max_code+1), 4, '0'));

end $$
delimiter ;
/************************************************/

show tables;
create table member(
	mid char(5) primary key, -- 'M0001'
    name varchar(5) not null,
	mdate datetime
);
desc member;
select * from information_schema.triggers
	where trigger_schema = 'hrdb2019';

/************************************************
	mid에 들어가는 'M0001' 타입의 회원아이디 트리거
/************************************************/
delimiter $$
create trigger trg_member_mid
before insert on member
for each row
begin
declare max_code int;  --  'M0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(mid, 4) AS UNSIGNED)), 0)
INTO max_code
FROM member; 

-- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자형식) : M0001
SET NEW.mid = concat('M', LPAD((max_code+1), 4, '0'));

end $$
delimiter ;
/************************************************/
desc member;

insert into member(name, mdate)
	values('홍길동', now()),
		  ('홍길순', now()),
          ('이정후', now()),
          ('이예빈', now());

select * from member;
    










            

















        


    

    



    

    
    
	










	   

       
    

	
	





			






















































