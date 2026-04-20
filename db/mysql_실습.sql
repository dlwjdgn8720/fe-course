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
show tables;
desc employee;
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
desc employee;
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
select emp_id '사원번호', emp_name, hire_date, salary
from employee where dept_id ='SYS'; -- 소문자 sys도 가능

-- ❓ 컬럼 별칭을 통해 조건절을 처리할 수 있을까요??
-- emp_name의 별칭인 '사원명'으로 '홍길동'을 조회 불가능!!
select emp_id, emp_name as '사원명', hire_date, salary from employee
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
select * from employee
where retire_date is null;

-- 퇴사한 사원들을 조회
select * from employee
where retire_date is not null;

-- 재직중인 사원들의 보너스컬럼을 추가하고, 급여의 20%를 설정하여 조회
-- 보너스 컬럼의 컬럼명은 'bonus'
select emp_id, emp_name, hire_date, salary, salary*0.2 as bonus from employee
where retire_date is null;

/*************************************************
	IFNULL 함수 : NULL을 다른값으로 대체해주는 함수
    형식 > IFNULL(NULL 포함 컬럼명, 대체값)
    출력하는 컬럼에 부여
**************************************************/
-- STG 부서에 속한 사원들의 정보 조회
-- 단, 급여가 NULL인 사원은 0값으로 치환
select emp_id, emp_name, dept_id, IFNULL(salary, 0) as salary from employee
where dept_id = 'STG';

-- 영어이름이 정해지지 않은 사원은 'smith' 이름으로 치환
-- 사원번호, 사원명, 영어이름, 입사일, 부서아이디
select emp_id, emp_name, IFNULL(eng_name, 'smith') as eng_name, hire_date, dept_id
from employee;

-- MKT 부서의 사원들을 조회, 재직중인 사원들의 retire_date를 현재 날짜로 치환
select emp_id, emp_name, IFNULL(retire_date, curdate()) as retire_date from employee
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
select * from employee
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




			






















































