drop table dept01;
drop table emp01;
drop table sam01;

create table dept01 as select * from dept; 
delete from dept01 where deptno = 20;

select * from dept01;
delete from dept01;
drop table dept01;

delete from sam01 where deptno = 1010;
delete from sam01 where sal >= 8000;
delete from sam01 where deptno =10;
delete from sam01;
drop table sam01;

create table emp01 as select * from emp;

delete from emp01 where deptno = (select deptno from dept where loc = 'NEW YORK');

select * from emp01;
delete from emp01 where deptno = (select deptno from dept where loc = 'DALLAS');
select * from dept;
drop table emp01;
create table emp01 as select * from emp where  deptno = 10;

merge into emp01 e1 using emp e on (e1.empno = e.empno) 
when matched then update set e1.ename = e.ename
when not matched then insert(e1.empno, e1.ename, e1.job, e1.mgr, e1.hiredate) 
values (e.empno , e.ename, e.job, e.mgr, e.hiredate);

select * from emp01;
drop table emp01;
insert into emp01 values(1111, '철수', '철수', '7839', sysdate, 2000, 100, 20);
insert into emp01 values(2345, '철', '철수', '7839', sysdate, 2000, 100, 20);
insert into emp01 values(4444, '수', '철수', '7839', sysdate, 2000, 100, 20);
insert into emp01 values(6666, '수cjf', '철수', '7839', sysdate, 2000, 100, 20);
delete from emp01 where empno = 7839;
rollback; --create로 만들어진 데이터들은 안지워짐
savepoint a1;
savepoint a2;
insert into emp01 values(6666, '수cjf', '철수', '7839', sysdate, 2000, 100, 20);
rollback to savepoint a1;

create table dept01 as select * from dept where deptno in(10,20);
select * from dept01;
savepoint a1;
insert into dept01 values(10, 'sdsdsds', 'LLLLL');
insert into dept01 values(10, 'sdsdsds', 'LLLL2');
savepoint a2;
insert into dept01 values(10, 'sdsdsds', 'LLLLL3');
insert into d
ept01 values(10, 'sdsdsds', 'LLLLL4');
rollback to savepoint a1;


insert into dept values(99,'관리자','대구');
select * from dept;
update dept set dname = '회계과' where deptno = 99;
delete from dept where deptno = 99;

drop table MY_DATA;
create table MY_DATA (ID number(4)primary key, NAME varchar2(10), userid varchar2(30), salary number(10,2)); 
select * from MY_DATA;
insert into MY_DATA values(1, 'Scott', 'sscott', 10000.00);
insert into MY_DATA values(2, 'Ford', 'fford', 13000.00);
insert into MY_DATA values(3, 'patel', 'ppatel', 33000.00);
insert into MY_DATA values(4, 'Report', 'rreport', 23500.00);
insert into MY_DATA values(5, 'Food', 'ggod', 44450.00);

update MY_DATA set salary = 65000.00 where id = 3;
delete from MY_DATA where name = 'Ford';
update MY_DATA set salary = 15000.00 where salary <= 15000.00;
drop table MY_DATA;

insert into dept values(10, '홍보', '강남');
select * from dept;

drop table dept;


create table dept(deptno number(2) primary key, danme varchar2(20), loc varchar2(20));
insert into dept(deptno, danme, loc) values (10,'ACCOUNTING', 'NEW YORK');
insert into dept(deptno, danme, loc) values (20,'RESEARCH', 'DALLAS');
insert into dept(deptno, danme, loc) values (30,'SALES', 'CHICAGO');
insert into dept(deptno, danme, loc) values (40,'OPERATIONS', 'BOSTON');
alter table dept rename column danme to dname;

select * from dept;
insert into dept values(10, '홍보', '강남');

create table sawon(
    s_no number(4),
    s_name varchar2(12) not null,
    job varchar2(20) constraint sal_nn not null,
    sal number(5)
    );
    
    desc sawon;

insert into sawon values(1, '제니', '뮤직', 1000);
insert into sawon values(null, '제니', '뮤직', null);
insert into sawon values(null, null, '뮤직', null);
select constraint_name from user_constraints where table_name = 'sawon';

create table emp02(
    empno number(4) not null,
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2)
    ); 

insert into emp02 values(null, null, 'SALESMAN', 10);
desc emp02;
drop table sawon;
create table sawon(
    s_no number(4),
    s_name varchar2(12),
    job varchar2(20) ,
    email varchar2(20) unique
    );
    
insert into sawon values(1, '하니', '홍보', 'c @com');
insert into sawon values(1, '하니', '홍보', 'c @co');
select * from sawon;

--하나의 기본키
create table buseo(
    b_no number(2) primary key,
    b_name varchar2(20),
    b_loc varchar2(20)
    );
drop table buseo;
-- 두 칼럼 더해서 하나의 기본키 
    create table buseo(
    b_no number(2),
    b_name varchar2(20),
    b_loc varchar2(20),
    primary key(b_no, b_name)
    );
    
drop table sawon;
select * from sawon;
select * from buseo;
create table sawon(
    s_no number(4) primary key,
    s_name varchar2(20),
    s_job varchar2(20),
    b_no number(2) references buseo(b_no)
    );