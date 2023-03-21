create view emp_vl as select empno, ename, job, deptno from emp where deptno = 10;
-- ���� ���̺��� ������, select�� �����ͼ� ��¥ �פ��̺�ó�� ���
select * from emp_vl;
create or replace view emp_vl as select 
empno, ename, job, e.deptno from emp e, dept d where e. deptno = d.deptno;
select * from emp_vl;
drop view emp_vl;

create or replace view emp_vl(worker, manager) as
select w.ename , m.ename  from emp w, emp m where w.mgr = m.empno;
 --�÷� ���� ���Ƽ� ���ų�(��), ������� ���ų�(�Ʒ�)
create or replace view emp_vl as
select w.ename worker , m.ename manager  from emp w, emp m where w.mgr = m.empno;
select * from emp_vl;

select empno, ename, job, manager from emp, emp_vl where ename = worker;

create or replace view v_emp2 (�����ȣ, �̸�, �μ���ȣ)
as select empno, ename, deptno from emp where deptno =20;
--join������ ���� Į���� �ϋ��� ��Ī�� ����ϰų� view �� �÷����� �Ἥ �ٸ��� ����
-- ������ ��������� �÷��� ����
select * from v_emp2;
create or replace view v_emp2 as select empno, ename, sal*12 year_sal from emp;

--�μ��� �޿� �հ�, ��ձ޿�(�ݿø�)�� �μ��ڵ�, �޿��հ�, ��ձ޿��� ���� emp_v2�� ����ÿ�
create or replace view emp_v2(�μ��ڵ�, �޿��հ�, ��ձ޿�) 
as select deptno, sum(sal), round(avg(sal)) from emp group by deptno;
select * from emp_v2;

select ename, sal, e.deptno, ��ձ޿� from emp e, emp_v2 ev where e.deptno = ev.�μ��ڵ�;

insert into emp03 values(2222, '����Ʈ��', 3000);
select * from emp03;
--������ �÷����� ������ VIEW �� �����ϸ� ������ ������, but �÷����� �ٸ��ٸ�, 

CREATE OR REPLACE VIEW test_v
AS 
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO 
FROM EMP
WHERE DEPTNO=30 WITH CHECK OPTION;

update test_v set deptno = 20;
select * from test_v;

select empno, ename, sal from emp e 
where sal > (select round(avg(sal)) from emp e, where e.deptno = deptno);

select * from emp_v2;
select empno, ename, sal, e.deptno
from emp e, (select deptno, round(avg(sal)) ��ձ޿� from emp group by deptno) v where e.deptno = v.�μ��ڵ�;


--1
create or replace view emp_v1 as select empno, ename, job, hiredate, deptno from emp;
--2
create or replace view emp_v2 as select  empno, ename, job, coalesce((sal+comm)*12, sal *12) "����" from emp;
--3
create or replace view emp_v3 as select w.empno, w.ename �ٹ��ڸ�, m.ename �����ڸ�, w.job, w.sal from emp m, emp w where w.mgr = m.empno;
select * from emp_v3;

--4 
create or replace view emp_dept_v1 as select empno, ename, job, e.deptno, dname, loc
from emp e, dept d where e.deptno = d.deptno;
--5
create or replace view emp_v4(deptno, �ִ�޿�, �ּұ޿�, �޿��հ�)
as select deptno, max(sal), min(sal), sum(sal) from emp group by deptno;

--5???????????/
selct ename, job, sal, sal, deptno 
from emp e, (select deptno from where sal > (select avg(sal) from emp)) v 
where e.deptno = v.deptno ; 


select rownum ,ename, sal from emp;
select rownum ,ename, sal from emp order by sal desc;
select rownum ,rn,ename, sal from (select rownum rn, ename, sal from emp order by sal desc);

-- �Ʒ�, �����͸� �������� ���� �츮�� ���ϴ� �γ�6 - 10 �� �γ� 1- 5���ǹǷ� ����
select rownum ,rn,ename, sal from (select rownum rn, ename, sal from emp order by sal desc)
where rownum between 6 and 10;
--?????????????????
select rownum,rn, ename, sal  from (select rownum rn, a.* from (select ename, sal from emp order by sal desc) a)
where rn between 6 and 10;
select rownum rn1,rn, ename, sal from(  select rownum rn, a.* from(select ename, sal from emp order by sal desc) a ) 
where rn between 6 and 10;

--1
create or replace view emp_view as select empno, ename, job from emp;
--2
select  * from emp e, emp_view v where e.empno = v.empno and e. deptno = 10;
select empno, ename, job from emp where deptno = 10;
--3
select * from (select * from emp order by sal desc ) where rownum < = 3;

select empno, ename, sal, rank() over (order by sal desc) rank from emp;
--(�Ʒ�) ����, where : table �� �����͸� �����ϴ� �����̹Ƿ� �Ʒ� �ȵ�
select empno, ename, sal, rank() over (order by sal desc) rank from emp where rank <= 5;
select  * from (select empno, ename, sal, rank() over (order by sal desc) rank from emp) where rank <= 5;

select empno, ename, sal, rank() over(order by sal desc) rank,
dense_rank() over(order by sal desc) dense,
row_number() over(order by sal desc) rn from emp;

--?????????????????????????
select empno, ename, sal, rank() over (order by sal desc) rank,
dense_rank() over(order by sal desc) dense,
row_number() over(order by sal desc) rn, deptno,
rank() over(partition by deptno order by sal desc) part from emp;
--??????????????????????????
select empno, ename, sal, rank() over(partition by deptno order by sal desc) part, deptno from emp;

--1
create or replace view emp_view as select empno, ename, job, deptno  from emp;
--2
select * from emp e, emp_view v where e.empno = v.empno and e.deptno =10; 
--3
create or replace view emp_dept as select ename, job, sal, dname, loc from emp e, dept d where e.deptno = d.deptno;
---------------------------------
--1
create or replace view dname_ename_vu as select dname, ename from emp e, dept d where e.deptno = d. deptno;
--2????????
create or replace view worker_manager_vu as select w.ename �����, m.ename �����
from emp m, emp w where m.empno = w.mgr;
--3
select empno, ename, hiredate from emp order by hiredate desc;
--4
select * from (select empno, ename, hiredate from emp order by hiredate desc) where rownum <= 5;
--5
select * from (select rownum rn, a.* from 
(select * from emp order by hiredate desc) a )where rn between 6 and 10;

drop view v_emp2;
create table sawon (num number(5) primary key, val varchar2(20));
--sawon_seq.nextval 1���� �����ؼ� 1�� ����
--�ٸ�  DB������ auto_increment�� ����ϸ� 1���� 1�� ����
create sequence sawon_seq;
alter sequence sawon_seq increment by 2;
create sequence sawon_seq2 increment by 2 start with 11;
insert into sawon values(sawon_seq2.nextval,'Ű');
insert into sawon values(sawon_seq.nextval,'�ʹ�');
select * from sawon;
select sawon_seq2.currval from dual;
drop sequence sawon_seq;

--1
create sequence emp_seq start with 1 increment by 1 maxvalue 100000;
--2
DROP TABLE EMP01;
CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR(10),
HIREDATE DATE
); 

insert into emp01 values(emp_seq.nextval, 'new sawon',sysdate); 
select * from emp01;

--1
create sequence test_seq start with 1 increment by 1 maxvalue 999999;


create user kim identified by kl;
grant create session to kim;
grant select on scott.emp to kim;
grant update (dname,loc) on scott.dept to kim;
--��� ����  kim���� �ش�
grant dba to kim;

drop user kim;

--1 
create user kim identified by lion;
grant create table, create session to kim;
grant select on scott.dept to kim;
grant select on scott.emp to kim;
grant update (sal,comm) on scott.emp to kim;
revoke update on scott.emp from kim;

create user ksh identified by kim;
grant connect, resource to ksh;
revoke connect, resource from ksh;
drop user ksh;

drop table emp;
drop table dept;
select * from emp;

select rownum, a.* from emp a;
select rownum , a.* from (select b.* from emp b order by b.ename)a;
select row_number()over (order by a.job, a.ename)row_num, a.* from emp a order by a.job, a.ename;


select rownum , ename, sal, deptno from
(select rownum rn ,a.* from 
(select ename, sal, deptno from emp order by deptno) a)   where rn between 2 and 4;


select empno, ename, sal, rank() over (order by sal desc) rank,
dense_rank() over(order by sal desc) dense,
row_number() over(order by sal desc) rn, deptno,
rank() over(partition by deptno order by sal desc) part from emp;
--??????????????????????????
select empno, ename, sal, rank() over(partition by deptno order by sal desc) part, deptno from emp;