select sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp;
select * from emp;
select sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp where deptno =10;
--�׷��Լ��� ���� ����ϴ� �÷��� �ݵ�� group by�� �־���Ѵ�.
select deptno, sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp group by deptno;
select deptno, job, sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp group by deptno, job order by deptno, job;

select sum(sal), avg(sal)/count(*) from emp;
-- sum(comm) Ŀ�̼��� �޴� Ŀ�̼� �հ�, comm �� nyll ����� ����
-- �����ϳ� data������ null ���� ���°��� ����
select sum(comm), avg(comm), sum(comm)/count(*), sum(comm) / count(*), sum(nvl(comm)) from emp;

--1
select deptno, sum(sal), avg(sal) from emp group by deptno;
--2
select job, max(sal), min(sal) from emp group by job;
--3
select sum(sal), avg(sal) from emp where job in('MANAGER', 'CLERK');
--4
select dname, sum(sal), max(sal) from emp e, dept d where e.deptno = d.deptno group by dname;
--5 
select dname, loc, sum(sal), count(*) from emp, dept where emp.deptno = dept.deptno group by dname, loc order by dname;
--6
select dname, max(sal), min(sal), count(*) from emp e, dept d where e.deptno = d.deptno and comm is not null
group by dname;
--7
select job, max(sal), min(sal), count(*) from emp group by job  order by job;
--8
select dname, job, max(sal), min(sal), count(*) from emp e, dept d where e.deptno = d.deptno
group by job, dname order by dname, job;
--9
select sum(sal), max(sal),min(sal),count(*) from emp; 

--�μ��� �ο����� 4�� �̻��� �μ��� �ִ�޿�, �޿��հ�, �ο���
-- where�� ���̺�� ���� �����͸� �����ϴ� ���� : ���̺�� ���� ������ �� check => ����
select deptno, max(sal), sum(sal), count(*) from emp where count(*) >= 4 group by deptno;
--having �� �׷��Լ��� ���� ����
select deptno, max(sal), sum(sal), count(*) from emp  group by deptno having count(*) >= 4;
-- ��ø�Լ� : �Լ��� 2�� �̻� ���� ���
select max(max(sal)), min(min(sal)), max(min(sal)) from emp group by deptno;

--1 
select deptno, sum(sal),  max(sal) from emp group by deptno having max(sal) >= 2900;
--2
select job, sum(sal), max(sal), count(*) from emp group by job having count(*) >= 3;
--3
select  max(max(sal)), min(max(sal)) from emp group by job; 
--4
select  max(sum(sal)) , min(sum(sal)), max(count(*)) from emp group by deptno;
--5
select dname, sum(sal) from emp e, dept d where e.deptno = d.deptno group by dname having sum(sal) >= 9000;

--6 
select dname, round(avg(sal),1) from emp e, dept d where e.deptno = d.deptno group by dname
having avg(sal) >= 2000 order by dname;

--------------------------------------------------
--1
select count(*), max(sal), min(sal), sum(sal) from emp;
--2
select job, max(sal), min(sal), sum(sal) from emp group by job;
--3
select job, count(*) from emp group by job;
--4
select max(sal) - min(sal) from emp;
--5
select to_char(hiredate,'yy'), count(*), min(sal), max(sal), avg(sal), sum(sal) from emp group by to_char(hiredate,'yy');
--6
select sum(count(*)) TOTAL,sum(decode(to_char(hiredate,'yy'),80,count(*))) "1980", sum(decode(to_char(hiredate,'yy'),81,count(*))) "1981",
sum(decode(to_char(hiredate,'yy'),82,count(*))) "1982"
, sum(decode(to_char(hiredate,'yy'),83,count(*))) "1983"from emp group by to_char(hiredate,'yy');
--7
select job, sum(decode(deptno,10,sal)) "Deptno 10", sum(decode(deptno,20,sal))"Deptno 20", sum(decode(deptno,30,sal))"Deptno 30"
, sum(sal) TOTAL from emp group by job order by job;
---------------------------------------------
select deptno, job, sum(sal) from emp group by deptno, job order by deptno;
select deptno, sum(decode(job,'CLERK',sal)) CLERK,sum(decode(job,'MANAGER',sal)) MANAGER, sum(decode(job,'PRESIDENT',sal)) PRESIDENT,
sum(decode(job,'ANALYST',sal)) ANALYST, sum(decode(job,'SALESMAN',sal))SALESMAN, sum(sal) �հ� 
from emp group by deptno order by deptno;
-----------------------------------
select deptno, sum(decode(job,'CLERK',sal)) CLERK,sum(decode(job,'MANAGER',sal)) MANAGER, sum(decode(job,'PRESIDENT',sal)) PRESIDENT,
sum(decode(job,'ANALYST',sal)) ANALYST, sum(decode(job,'SALESMAN',sal))SALESMAN, sum(sal) �հ� 
from emp group by rollup(deptno) order by deptno;

-----------------------------------------
--1
select max(sal), min(sal), sum(sal), avg(sal) from emp;
--2
select deptno, count(*) from emp group by deptno;
--3
select deptno, count(*) from emp group by deptno having count(*) >= 6;
--4
select dname, sum(decode(job,'CLERK',sal)) CLERK, sum(decode(job,'MANAGER',sal)) MANAGER, 
sum(decode(job,'PRESIDENT',sal)) PRESIDENT, sum(decode(job,'ANALYST',sal)) ANALYST,
 sum(decode(job,'SLAESMAN',sal)) SALESMAN from emp e ,dept d where e.deptno = d.deptno group by dname;
 
 --5
 select e1.ename, count(e2.sal) + 1�� from emp e1, emp e2 where e1.sal < e2.sal group by e1.ename order by ��;
 
 select ename, rank() over (order by sal desc) ��� from emp;