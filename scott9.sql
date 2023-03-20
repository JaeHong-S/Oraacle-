create table juso(no number(3), name varchar2(10), addr varchar2(20), email varchar2(5));
alter table juso add phone varchar2(10);
alter table juso modify email varchar2(20);
alter table juso drop (addr);
drop table juso;

create table dept(deptno number(2) primary key, danme varchar2(20), loc varchar2(20));
insert into dept(deptno, danme, loc) values (10,'ACCOUNTING', 'NEW YORK');
insert into dept(deptno, danme, loc) values (20,'RESEARCH', 'DALLAS');
insert into dept(deptno, danme, loc) values (30,'SALES', 'CHICAGO');
insert into dept(deptno, danme, loc) values (40,'OPERATIONS', 'BOSTON');
alter table dept rename column danme to dname;

select * from dept;

create table emp01 as select * from emp;
select * from emp01;
insert into emp01(empno, ename, job, sal) values (1111, '제니', '인사', 1000);
insert into emp01(empno, ename, job, sal) values (1234, '보검', '인사', 1000);
insert into emp01(empno, ename, job, sal) values (2222, '로제','회계', 2000);
select * from emp01;

create table sam01 (empno number(4), ename varchar2(10), job varchar2(9), sal number(8));
desc sam01;

insert into sam01 values(1000, 'APPLE', 'POLICE', 10000);
insert into sam01 values(1010, 'BANANA', 'NURSE', 15000);
insert into sam01 values(1020, 'ORANGE', 'DOCTOR', 25000);

select * from sam01;
insert into sam01 values(1030, 'VERY', null, 25000);
insert into sam01 values(1040, 'CAT', null, 2000);
select * from sam01;

select empno, ename, &a from emp; -- 계속 물어봄
select empno, ename, &&kk from emp; -- 한번 물어보고 고정
select * from emp where sal >= &sal and Lower(job) = '&job';

accept department prompt '부서명'
select * from dept where dname = upper('&department');

create table dept01 as select * from dept where 1 = 0;
select * from sam01;
insert into dept01 select * from dept;
drop table sam01;
create table sam01 as select * from emp where 1 =0;
create table sam01 as select * from emp where 1 = 0;
insert into sam01 select empno, ename, job, mgr,hiredate,sal , comm, deptno  from emp ;
select * from emp;
select * from sam01;

update sam01 set deptno = deptno +2 ;
select * from sam01;
update sam01 set sal = sal * 1.3 where sal >= 2000;
update sam01 set sal = sal - 5000 where sal >= 10000;
update sam01 set ename = '차은우', sal = sal * 1.1 where empno = 1030;
update sam01 set job = 'music' where job is null;

insert into sam01 as select * from emp;
--1
update sam01 set hiredate = (select hiredate from sam01 where ename = 'SCOTT' ), 
sal = (select sal from sam01 where ename = 'ADAMS') where empno = 1000;
--2
alter table sam01 add(dname varchar2(20)); 
--3
update sam01 s set dname = (select dname from dept where s.deptno = deptno);
--4
update sam01 set hiredate = to_date ('21/05/05','rr/mm/dd') where empno = 1000;
--5
update sam01 set deptno = 30, dname = (select dname from dept where deptno =30) where empno = 30;
