select ename, sal from emp e where sal > (select avg(sal) from emp where e.deptno = deptno);
select avg(sal), deptno from emp group by deptno;
select empno, ename, sal from emp e where exists (select empno from emp where e.empno = mgr);
-- 관리자면 출력

--1
select ename, sal, job from emp e where sal >(select avg(sal) from emp where e.job = job);
--2
select ename, sal, e.deptno, dname from emp e,dept d where e. deptno = d.deptno and 
sal > (select avg(sal) from emp e where e.deptno =deptno);
--3
select empno, ename from emp e where exists (select empno from emp where e.empno = mgr);
--4
select empno, ename from emp e where e.empno in (select mgr from emp);
--5
select empno, ename from emp e where not exists (select empno from emp where e.empno = mgr);
--6
select empno , ename from emp e where e.empno not in (select mgr from emp where e.empno = mgr); 
select empno , ename from emp e where e.empno not in (select mgr from emp where mgr is not null); 
--7
select ename, sal, dname, grade from emp e, dept d, salgrade where e.deptno = d.deptno and sal between losal and hisal and
sal > (select avg(sal) from emp where mgr is not null);

--1
select ename, hiredate from emp e where deptno =(select deptno from emp where ename = 'BLAKE'); 

--2
select empno, ename from emp  where 
sal >= (select avg(sal) from emp)  order by sal desc;
--3
select empno, ename, sal from emp where ename like '%T%' order by empno;
--4??
select ename, job, sal from emp e , dept d where loc = 'DALLAS' and e.deptno = d.deptno; 
select ename, job, sal from emp where deptno = (select deptno from dept where loc  = 'DALLAS');
--5 
select ename, sal from emp where mgr in (select empno from emp where ename = 'KING');
--6
select ename, job from emp e , dept d where dname = 'SALES' and e.deptno = d.deptno;
--7
select * from emp where sal > (select min(sal) from emp where deptno = 30);
--8
select ename, job from emp where job in (select job from emp where deptno = 30) and deptno = 10; 
--9
select * from emp where( sal,job) = (select sal,job from emp where ename = 'FORD') and ename != 'FORD'; 
--10 ??
select ename, job, deptno, sal from emp  where job = (select job from emp where ename = 'JONES') 
and sal >= (select sal from emp where ename = 'FORD') order by sal desc;
--11 
select ename, job, sal from emp where sal in (select sal from emp where ename in ('SCOTT' , 'WARD'));
--12
select ename, job from emp where job = (select job from dept where loc = 'CHICAGO');
select ename, job from emp where job in (select job from emp where deptno = (select deptno from dept where loc = 'CHICAGO'));
--13
select deptno, ename, sal from emp e where sal > (select avg(sal) from emp where e.deptno = deptno); 
--14
select deptno, ename, sal from emp e where sal < (select avg(sal) from emp where e.job = job);
--15
select job, ename, empno, deptno from emp e where exists (select * from emp where e.empno = mgr);
--16
select empno, ename, job, deptno from emp e where not exists (select * from emp where e.empno = mgr);

 create table emp_test(
    empid varchar2(5) primary key,
    firstname varchar2(10),
    LASTNAME varchar(10),
    salary number(7)
    );
    
drop table emp_test;

 create table MY_DATA1(
    ID number(4) primary key,
    NAME varchar2(10),
    USERID varchar2(30),
    SALARY number(10,2)
    );
    
drop table MY_DATA1;

create table emp1 as select * from emp;
select * from emp1;
create table emp2 as select empno, ename, hiredate, sal from emp;

select rowid, ename, sal from emp;

create table EMP01(
    empno number(4),
    ename varchar2(20),
    sal number(7, 2));
    
drop table EMP01;

create table EMP04  as select empno, ename, sal from emp;
select * from EMP04;
create table emp05 as select * from emp where deptno = 10;
select * from emp05;

--테이블의 구조만 복사 where false가 되는 조건
create table emp01 as select * from emp where 1 = 0;
--데이터는 없고 컬럼명과 데이터 유형만 복사
select * from emp01;
desc emp01;

create table DEPT02 as select * from dept where 1=0;
desc DEPT02;

create table emp001 (
    empno number(4) primary key,
    ename varchar2(20) default '아무개',
    sal number(5) default 1000);
    
desc emp001;

select * from emp001;
insert into emp001(empno, ename) values(2,'로제');
insert into emp001(empno, sal) values(3,3000);
select * from emp001;

alter table emp001 add (job varchar2(20), hiredate date);
alter table emp001 modify (job varchar2(15));
desc emp001;

drop table EMP001;
drop table EMP01;
drop table EMP04;
drop table EMP05;
drop table EMP1;
drop table EMP2;

create table emp01 as select empno, ename, sal from emp where 1=0;

create table dept02 as select * from dept where 1 = 0;

--1
alter table emp01  add (job char(10));
--2
alter table dept02 add (DGMR varchar2(10));
--3
alter table emp01 modify (job varchar2(30));
--4
alter table dept02 modify (DGMR number(10));