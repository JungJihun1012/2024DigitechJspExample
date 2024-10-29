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



drop table department
create table department
(
    deptno number primary key,
    deptname varchar(10),
    floor number
);
drop table employee
create table employee
(
    empno number primary key,
    empname varchar2(10),
    title varchar2(10),
    salary number(8),
    supervisor number,
    dno number
);


insert into department
(deptno, deptname, floor)
values (1, '기획', 8 );

insert into department
values
(2, '개발', 10);

insert into department
values
(3, '영업', 9);

insert into department
values
(4, '총무', 9);

select * from employee;

insert into employee
values
(1001, '박철수', '대리', 3000000, 1002, 1);

insert into employee
values
(1002, '이민호', '과장', 3500000, 1003, 3);

insert into employee
values
(1003, '김영희', '부장', 4000000, 1006, 2);

insert into employee
values
(1004, '황진희', '대리', 3000000, 1002, 2);

insert into employee
values
(1005, '정진우', '사원', 2500000, 1004, 1);

insert into employee
values
(1006, '박현석', '이사', 5500000, null, 1);

insert into employee
values
(1007, '김정현', '사원', 2500000, 1001, null);



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

select Dno, count(*), avg(salary), max(salary)
from employee
where salary <= 5000000 and Dno is not null Dno <> 2
group by Dno
having count(*) >= 2;

select Dno from employee where empname = '김영희'
union
select Deptno from department where Deptno 

select Deptname name
from department, employee
where department Deptno = employee.Dno





select e1.empname, e1.empno, e1.title, e2.empname, e2.empno, e2.title
from employee e1, employee e2
where e1.title = e2.title
and e1.empname <> e2.empname
and e1.empno < e2.empno;

select Dno, Deptname, empname, title
from employee left outer join department
on dno = deptno;


select e1.empname, e1.title, e2.empname, e2.title
from employee e1 full outer join employee e2
on e1.superviser = e2.empno;

-- 부서코드가 1인 직원의 모든 정보 조회하기
select * from employee where dno = 1;
-- 기획부인 직원의 모든 정보 조회하기
select employee * from employee, department where dno = deptno and deptname = '기획';
-- 부서코드가 1이 아닌 직원의 모든정보 조회하기

-- 기획부가 아닌 직원의 모든 정보 조회하기

-- 부서코드가 1 또는 2인 사원의 모든 정보 조회하기

-- 부서가 '기획' 또는 '개발'인 직원의 모든 정보 조회하기

-- 부서코드가 1또는 2가 아닌 직원의 모든 정보 조회하기
select * from employee right outer join departmnet d on d.deptname = '개발' or d.dpetname = '기획';
-- 부서가 '기획' 또는 '개발' 이 아닌 직원의 모든 정보조회하기
select * from employee where dno != 1 or dno != 2;
-- 1번 부서에 근무하는 직원들의 직급, 이름, 급여를 검색하여 급여의 오름차순으로 정렬하기

-- 기획부에 근무하는 직원들의 직급, 이름, 급여를 검색하여 급여의 오름차순으로 정렬하기

-- 각 부서별 급여의 한계를 구하
-- 각 부셔별 사원수 구하기
select d.deptname, count(e.empno) as employee_count
from department d
left outer join employee e on d.deptno = e.dno
group by d.deptname;

select deptname, count(*) from employee, department where deptno = dno group by deptname;
-- 각 부서별 급여의 최댓값 구하기
select deptname, max(salary)
from department, employee
where deptno = dno
group by deptname;
-- 영업부가 아닌 부서의 사원수와 월급의 한계 구하기
select count(*), sum(salary)
from employee, department
where dno = deptno
and deptname <> '영업';


select title
from employee

select empno,empname, title, salary, '가장 높은 급여'
from employee
where salary = (select max(salary) from employee)
union all
select empno, empname, title, salary, '가장 낮은 급여'
from employee
where salary = (select min(salary) from employee);

select e.* from employee e
where e.dno = (select dno from employee where salary = (select max(salary) from employee));

select count(e.empno)
from department d
left outer join employee e on d.deptno = e.dno
where d.floor = 8

select e.*
from employee e
where e.dno <> (select dno from employee where empno= e.supervisor)
and e.supervisor is not null;

select e.*
from employee e
where e.dno = (select dno from employee where empno = e.supervisor)
and e.supervisor is not null;

select sum(salary * 1.15)
from employee;

select e.empname, d.deptname, e.salary
from employee e
join department d on e.dno = d.deptno
where d.floor = 8 and e.title = '대리';

select title, avg(salary)
from employee
group by title;

select avg(e.salary)
from employee e
join department d on e.dno = d.deptno
where d.deptname <> '기획';

select title, avg(salary), count(empno)
from employee
group by title
having sum(salary) = (
	select max(5500000)
	from (
		select sum(salary)
		from employee
		group by title
	)
)

select e.empname, e2.empname
from employee e
left outer join employee e2 on e.supervisor = e2.empno;

select e.empname, d.deptname
from employee e
join department d on e.dno = d.deptno;

select e.empname, e2.empname
from employee e
left outer join employee e2 on e.empno = e2.supervisor;

	select e.empname
	from employee e
	join department d on e.dno = d.deptno
	where d.deptname in ('기획', '영업');

SELECT e.empname AS 사원이름
FROM employee e
JOIN department d ON e.dno = d.deptno
WHERE d.deptname IN ('기획', '영업'); 

select * from employee where salary in ((select max(salary) from employee), (select min(salary) from employee))

-- 모든 부서에 속한 사원의 수를 부서명과 사원수로 검색하세요.
select deptname, count(empno)
from department left outer join employee
on deptno = dno
group by deptname


-- 8층에 있는 사원수를 검색하시오
select count(empno)
from employee, department
where dno = deptno
and floor = 8;

-- 상사와 다른 부서에 속한 모든 사원의 정보를 검색하세요
select e.*
from employee e, employee s
where e.supervisor = s.empno
and s.dno <> e.dno

select sum(salary * 1.15) - sum(salary)
from employee




-- 황진희와 같은 부서에 근무하는 사원들의 이름과 부서 이름 조회하기
select empname, deptname
from employee, department
where dno = deptno
and dno in (select dno from employee where empname = '황진희')

-- 부서별 평균급여가 황진희보다 높은 부서에 대하여 부서번호와 평균급여를 조회하기
select dno, avg(salary)
from employee
having avg(salary) > (select salary from employee where empname = '황진희')
group by dno

-- 각 부서별 급여를 가장 많이 받는 직원 조회하기
select *
from employee e1
where salary = (select max(salary) from employee e2 where e1.dno = e2.dno group by dno)
-- 부서의 모든 직원이 황진희 보다 월급을 많이 받는 부서의 직원 조회하기
--select * from employee where salary >all(select salary from employee where empname = '황진희')
select * from employee e1 where (select salary from employee wher empnamee = '황진희') < all (select salary from employee where e1.dno = e2.dno)
and dno is not null
;
-- 급여가 300만원을 초과하는 직원이 속한 부서와 같은 부서에 근무하는 직원 조회하기
select *
from employee
where dno in (select dno from employee where salary > 3000000);

-- 개발부서의 최대급여보다 많은 급여를 받는 직원 조회하기
select *
from employee
where salary >= (
	select max(salary)
	from employee, department
	where dno = deptno
	and deptname = '개발'
);
-- 개발부서의 급여보다 많은 급여를 받는 직원 조회하기(all)select *
select *
from employee
where salary >= all(
	select max(salary)
	from employee, department
	where dno = deptno
	and deptname = '개발'
);

-- 개발부서의 최소급여보다 적은 급여를 받는 직원 조회하기(min 사용하지 않고 해결하기)
select *
from employee
where salary < all(
	select max(salary)
	from employee, department
	where dno = deptno
	and deptname = '개발'
);

-- 기획부나 영업부에 근무하는 직원들의 이름과 부서번호를 조회하기
-- 기획부나 영업부에 근무하지 않는 직원들의 이름과 부서 조회하기

select dno, sum(salary)
from employee
group by rollup(dno)

select dno, title, sum(salary)
from employee
group by rollup(dno, title)

select dno, title, sum(salary)
from employee
group by rollup(dno) title

-- cube

select dno, sum(salary)
from employee
group by cube(dno);

select dno, title, sum(salary)
from employee
group by cube(b)

select dno, title, sum(salary)
from empoloy

--insert
create table smp
as
select * from employee

-- delete emp와 같음

truncate tale = dempertment



insert into emp()

--insert
--기본구조
-- insert into 

--한꺼번에 여러개의 테이블에 여러개의 행을 삽입하는 이유

insert all
into devpt value(2, '개발', 10)
into devpt value(1, '개발', 9)
into devpt value(3, '개발', 8)
into emp values(1001, '박철수', ;대리, 3000000, 1002, 1)
select * from all
l
insert all
into emp(empno, empname, salary)
select empno, empname, salary
from employee
where empno > 1001 and empno 1004

-- insert all select from구조에서는 구조만 가져오고 키는 안겨져옴
-- alter ㅁ여령어로 기본치 

alter table emp
add foreign key(dno) reference dept (deptno);

alter table dept
add primary key(deptno);


drop table emp;
drop table dept

create table emp
as select * from employee;

create table dept
as select * from department;

-- 기본키 추가
alter table emp
add primary key(empno);

alter table dept
add primary key(deptno);

alter table emp
add foreign key(dno) references dept(deptno) on delete cascade

alter table emp
add foreign key(dno) references dept(deptno) on update cascade;

select * from emp;

delete emp
where dno = 3

select * from dept;

delete dept
where deptno = 2;

--Update 테이블 이름
-- SET 속성=값, [ 속성= 값...]
-- [WHERE 조건]

-- emp테이블의 1번 부서를 5번 부서로 수정하기
update emp
set dnp = 5;
where dno = 1;

select * from emp;

-- 김정현의 부서를 3번 부서로 수정하기
update emp
set dno = 3;
where empname = '김정현';

-- 월급을 10% 인상하기

update emp
set salary = salary * 1.1

-- 이름에 정이 들어가면 10만월을 더주기

update emp
set salary = salary + 100000
where empname like '%정%';

-- 영업부의 월급을 5만원 식감하기

update emp
set salary - salary - 50000
where dno in (select deptno from dept where deptname = '영업');

update emp
inner join department
on dno = deptno
set salary = salary - 50000
where deptname = '영업';
 