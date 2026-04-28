/****************************************
		학적과 수강신청 실습 데이터베이스
*****************************************/

-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS `enroll2026`;

show databases;
use enroll2026;
select database();

create table instructor(
	instructor_no int primary key,
    instructor_name varchar(10),
    age int,
    gender char(1)
);

create table subject(
	subject_no int primary key,
    subject_name varchar(20),
    class_room varchar(20),
    instructor_no int, 
	foreign key(instructor_no)
    references instructor(instructor_no)
	on delete cascade
	on update cascade
);

create table class_time(
	time_id int primary key,
    subject_no int,
    class_time varchar(20),
    foreign key(subject_no)
    references subject(subject_no)
    on delete cascade
    on update cascade
);

create table student(
	student_id int primary key,
    student_name varchar(10),
    address varchar(50)
);

create table enrollment(
	student_id int,
    subject_no int,
    grade char(1),
    foreign key(student_id)
	references student(student_id)
		on delete cascade
		on update cascade,
	foreign key(subject_no)
	references subject(subject_no)
		on delete cascade
		on update cascade
);

show tables;
desc instructor;

insert into instructor(instructor_no, instructor_name, age, gender) values
		(1, '김철수', 35, '남'),
		(2, '이영희', 29, '여'),
		(3, '박지민', 42, '남'),
		(4, '최수연', 31, '여'),
		(5, '정우성', 48, '남');
        
update instructor set instructor_no = case instructor_no
	when 1 then 201801001
	when 2 then 201905042
	when 3 then 202003015
	when 4 then 202101009
	when 5 then 201505021
    end
    where instructor_no in (1,2,3,4,5);
select * from instructor;

desc subject;

insert into subject(subject_no, subject_name, class_room, instructor_no) values
		(101, '데이터베이스 개론', 'A동 201호', 1),
		(102, '자바 프로그래밍', 'B동 105호', 1),
		(103, '기초 통계학', 'C동 302호', 2),
		(104, '심리학 입문', 'A동 401호', 2),
		(105, '알고리즘 분석', 'B동 202호', 3),
		(106, '운영체제론', 'B동 203호', 3),
		(107, '마케팅 원론', 'D동 101호', 4),
		(108, '비즈니스 영어', 'D동 102호', 4),
		(109, '서양 미술사', 'E동 501호', 5),
		(110, '현대 철학의 이해', 'E동 502호', 5);
        
select * from subject;

desc class_time;
insert into class_time(time_id, subject_no, class_time) values
		(1, 101, '월 09:00-12:00'),
		(2, 102, '화 13:00-16:00'),
		(3, 103, '수 09:00-12:00'),
		(4, 104, '목 10:00-13:00'),
		(5, 105, '금 14:00-17:00'),
		(6, 106, '월 14:00-17:00'),
		(7, 107, '화 09:00-12:00'),
		(8, 108, '수 15:00-18:00'),
		(9, 109, '목 14:00-17:00'),
		(10, 110, '금 10:00-13:00');

select * from class_time;

desc student;
insert into student(student_id, student_name, address) values
		(1, '강민준', '서울시 강남구 역삼동'),
		(2, '이서연', '경기도 수원시 영통구'),
		(3, '박도윤', '인천시 연수구 송도동'),
		(4, '정하윤', '서울시 송파구 잠실동'),
		(5, '최준우', '부산시 해운대구 우동'),
		(6, '윤지아', '대구시 수성구 범어동'),
		(7, '임현우', '광주시 남구 봉선동'),
		(8, '한지민', '대전시 유성구 상대동'),
		(9, '오건우', '서울시 마포구 망원동'),
		(10, '서유나', '경기도 용인시 수지구'),
		(11, '신진호', '서울시 관악구 봉천동'),
		(12, '권은비', '울산시 남구 신정동'),
		(13, '황주원', '제주시 노형동'),
		(14, '송지효', '경기도 고양시 일산동구'),
		(15, '전태양', '충북 청주시 상당구'),
		(16, '배수지', '서울시 성북구 안암동'),
		(17, '유재석', '서울시 서초구 반포동'),
		(18, '성시경', '서울시 강동구 천호동'),
		(19, '김태리', '경기도 안양시 동안구'),
		(20, '노유민', '강원도 춘천시 퇴계동');
        
select * from student;

UPDATE student
SET student_id = CASE student_id
    WHEN 1 THEN 20240001
    WHEN 2 THEN 20240002
    WHEN 3 THEN 20240003
    WHEN 4 THEN 20240004
    WHEN 5 THEN 20240005
    WHEN 6 THEN 20240006
    WHEN 7 THEN 20240007
    WHEN 8 THEN 20240008
    WHEN 9 THEN 20240009
    WHEN 10 THEN 20240010
    WHEN 11 THEN 20240011
    WHEN 12 THEN 20240012
    WHEN 13 THEN 20240013
    WHEN 14 THEN 20240014
    WHEN 15 THEN 20240015
    WHEN 16 THEN 20240016
    WHEN 17 THEN 20240017
    WHEN 18 THEN 20240018
    WHEN 19 THEN 20240019
    WHEN 20 THEN 20240020
END
WHERE student_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);

desc enrollment;

alter table enrollment
	modify grade char(2);

insert into enrollment(student_id, subject_no, grade) values
		(20240001, 101, 'A+'), 
		(20240001, 102, 'B+'),
		(20240002, 101, 'A0'), 
		(20240003, 103, 'C+'), 
		(20240004, 102, 'A+'), 
		(20240005, 104, 'B0'), 
		(20240006, 105, 'A0'), 
		(20240007, 101, 'B+'), 
		(20240008, 103, 'A+'), 
		(20240009, 102, 'D0'), 
		(20240010, 104, 'A+'), 
		(20240015, 101, 'C0'), 
		(20240017, 105, 'B+'),
		(20240020, 103, 'A0');
        
select * from enrollment;













