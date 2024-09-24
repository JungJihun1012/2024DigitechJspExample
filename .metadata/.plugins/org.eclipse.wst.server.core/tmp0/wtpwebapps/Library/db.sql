--drop table member_tbl_001;
create table member_tbl_001(
	cust_no number(6) primary key,
	cust_name varchar2(20) not null,
	phone varchar2(13) not null,
	address varchar2(60),
	join_date date,
	stat_fg varchar2(2)
);

drop table book_tbl_001;
create table book_tbl_001
(
	book_code varchar2(10) primary key,
	book_name varchar2(50) not null,
	book_type varchar2(2),
	book_author varchar2(20),
	in_date date,
	stat_fg varchar2(2)
);

drop table rental_tbl_001;
create table rental_tbl_001
(
	rent_ymd varchar2(8) not null,
	rent_no varchar2(5) not null,
	rent_book varchar2(10) not null,
	rent_rent number(6) not null,
	close_ymd varchar2(8) not null,
	return_ymd varchar2(8),
	return_fg varchar2(2),
	primary key(rent_ymd, rent_no)
);


insert into member_tbl_001
values
(100001, '김유정', '010-1111-2222', '서울시 용산구', '20180501', '0');

insert into member_tbl_001
values
(100002, '김윤경', '010-2222-3333', '서울시 동작구', '20180822', '0');

insert into member_tbl_001
values
(100003, '최승필', '010-3333-4444', '서울시 강남구', '20180913', '1');

insert into member_tbl_001
values
(100004, '강지현', '010-4444-5555', '서울시 송파구', '20181107', '1');

insert into member_tbl_001
values
(100005, '이원석', '010-5555-6666', '서울시 성동구', '20190108', '0');

insert into member_tbl_001
values
(100006, '김승현', '010-6666-7777', '서울시 광진구', '20190117', '0');


insert into book_tbl_001
values
('A0001', '언어의 온도', 'A', '이기주', '20180501', '1');

insert into book_tbl_001
values
('A0002', '골든아워', 'A', '이국종', '20180501', '1');

insert into book_tbl_001
values
('B0001', '12가지 인생의 법칙', 'B', '피터슨', '20180601', '1');

insert into book_tbl_001
values
('B0002', '당신이 옳다', 'B', '정혜신', '20180601', '0');

insert into book_tbl_001
values
('C0001', '마력의 태동', 'C', '양윤옥', '20180901', '1');

insert into book_tbl_001
values
('C0002', '꽃을 보듯 너를 본다', 'C', '나태주', '20180901', '1');



insert into rental_tbl_001
values
('20190318', '00001', 'A0001', '100001', '20190325', null,  0);

insert into rental_tbl_001
values
('20190318', '00002', 'B0001', '100001', '20190325', null, 0);

insert into rental_tbl_001
values
('20190318', '00003', 'C0001', '100001', '20190325',null, 0);

insert into rental_tbl_001
values
('20190320', '00001', 'B0002', '100005', '20190327', '20190324' , 1);

insert into rental_tbl_001
values
('20190322', '00001', 'A0002', '100006', '20190329', null , 0);

insert into rental_tbl_001
values
('20190323', '00001', 'C0002', '100003', '20190330', null, 0);


select * from member_tbl_001;


select rownum, cust_no, cust_name, phone, address, join_date, case stat_fg when '0' then '정상' when '1' then '휴면' when '2' then '탈퇴' end
from member_tbl_001;

select rent_ymd, rent_no, rent_book, book_name, cust_no, cust_name, close_ymd 
from rental_tbl_001 r, book_tbl_001 b, member_tbl_001 m
where r.rent_book = b.book_code
and r.rent_rent = m.cust_no
and return_fg = 0
order by rent_ymd, rent_no, rent_book

select rownum, book_code, book_name, case book_type when 'A' then '에세이' when 'B' then '인문' when 'C' then '소설' end book_type, book_author, in_date, case stat_fg when '0' then '대여가능' when '1' then '대여중' end stat_fg
from book_tbl_001

select sysdate rent_ymd, sysdate+7 close, to_char(nvl(max(rent_no), 0) +1, 'fm0000') from rental_tbl_001 where rent_ymd = sysdate;



drop table Departments;
create table Departments (
    Deptno NUMBER PRIMARY KEY,
    Deptname VARCHAR2(50),
    Floor NUMBER
);

insert into Departments
values
('1', '기획', '8');

insert into Departments
values
('2', '개발', '10');

insert into Departments
values
('3', '영업', '9');
insert into Departments
values
('4', '총무', '9');
insert into Departments
values
(5, '인사', 7);
insert into DEPARTMENTS
(Deptno, Deptname)
values
(6, '자제');

select * from Deparments;

drop table Empno;
create table Empno (
	Empno varchar2(10) primary key,
	Empname varchar2(4),
	Title varchar2(2),
	Salary number(30),
	Dno number	
);

insert into Empno
values
('1001', '박철수', '대리', '3000000', '1002', 1);
insert into Empno
values
('1002', '이민호', '과장', '3500000', '1003', 3);
insert into Empno
values
('1003', '김영희', '부장', '4000000', '1006', 2);
insert into Empno
values
('1004', '황진희', '대리', '3000000', '1002', 2);
insert into Empno
values
('1005', '정진우', '사원', '2500000', '1004', 1);
insert into Empno
values
('1006', '박현석', '이사', '5500000', null, 1);
insert into Empno
values
('1007', '김정현', '사원', '2500000', '1001', null);



-- 모든 사원의 직급을 조회하기
select Title
from employee
-- 모든 사원의 직급을 중복 없이 조회하기
select distinct Title
from employee
-- 월급이 300만원~400만원인 사원의 모든 정보 조회하기
select * from EMPLOYEES where Salary >= 3000000 and Salary <= 4000000;

select * from EMPLOYEES where Salary between 3000000 and 4000000;
-- 부서코드가 1인 사원의 모든 정보 조회하기
select * from EMPLOYEES where Dno != 1;
select * from EMPLOYEES where Dno in 1;
-- 부서코드가 1이 아닌 사원의 모든정보 조회하기
select * from EMPLOYEES where Dno != 1;
-- 부서코드가 1 또는 2인 사원의 모든 정보 조회하기
select * from EMPLOYEES where Dno = 1 or Dno = 2;
-- 부서코드가 1또는 2가 아닌 사원의 모든 정보 조회하기
select * from EMPLOYEES where 1 !== 2;



select * from EMPLOYEES where empname like '박%';
select * from EMPLOYEES where empname not like '박%';
insert into EMPLOYEES (1008, '진효빈', '인턴', '18000000', null, null);
select * from EMPLOYEES where empname like '%진%';


select title, empname, salary from EMPLOYEES where Dno = 1 order by empname desc;
select title, empname, salary from EMPLOYEES where Dno = 1 order by 2 desc;


select title, empname, dno, salary from EMPLOYEES order by dno asc, salary desc;
select * from (select * from EMPLOYEE order by salary asc) where rownum <= 2;



select count(*) from employee;

select avg(salary), max(salary) from employee;

select count(distinct salary), avg(distinct salary) from employee;

select count(supervisor) from employee;

delete employee where Empno = 1008;
update EMPLOYEE set salary = 185500;
select * from employee where empno = 1008;

--급여의 평균을 소수점 둘째 자리까지 조회하기
select tp_char(avg(salary), '9999999.99') from employee;
--급여를 천 단위마다 쉼표 찍어서 조회하기
select to_char(salary, '9,999,999') from employee;

select to_char(salary , 'fm9,999,999')
from employee;
--각 부서별 급여의 합계를 구하기
select Dno, sum(salary)
from employee
group by Dno;
--각 부서별 사원수 구하기
select Dno, count(*)
from employee
group by Dno;
--사원수가 2명 이상인 부서에 대해서 부서별 사원수 구하기
select Dno, count(*)
from employee
group by Dno
having count(*) >= 2
--부서 번호가 1이 아닌 부서에 대하여 부서별 사원수 구하기
select count(*)
from employee
where Dnp != 1
group by Dno;
--평균급여가 300만원을 초과하는 부서에 대하여 부서별 사원수와 평균 급여 구하여 부서별 사원수의 오름차순으로 조회하기
select Dno, count(*), avg(salary)
from employee
group by dno
having avg(salary) > 30000000
order by count(*) asc;

