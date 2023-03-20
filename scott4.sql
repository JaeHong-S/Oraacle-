select deptno, dname, rpad(rtrim(dname, 'G'), 10, '*') from dept;
select ename, sal, hiredate, extract(year from hiredate), extract(month from hiredate), extract(day from hiredate) from emp;

select * from emp where extract(month from hiredate) = 02;

select sysdate "Current Date" from dual;
select empno, ename, job, sal, sal * 1.15 "New Salary", (sal * 1.15) - sal "Increase" from emp;
select ename, hiredate, next_day(add_months(hiredate,6), '��') from emp;
select ename, hiredate, months_between(sysdate, hiredate) ����, sal, months_between(sysdate, hiredate) * sal "�޿��� �Ѱ�" from emp;
select empno, Lpad(sal, 15, '*') from emp;
select ename, job, hiredate, to_char(hiredate, 'day') from emp;
select ename, length(ename) from emp where length(ename) = 6;
select ename, job, sal, comm, sal + comm from emp;

select ename, substr(ename, 2, 3) from emp; 
select empno, ename, hiredate from emp where extract(month from hiredate) = 12 ;
select empno, ename, lpad(sal, 10, '*') from emp;
select empno, ename, to_char(hiredate, 'yyy-mm-dd') from emp;
select empno, ename, sal,case trunc(sal/1000) when 0 then 'E' when 1 then 'D' when 2 then 'C' when 3 then 'B' else 'A' end "���" from emp;
select empno, ename, sal, decode(trunc(sal/1000), 0 , 'E' ,1 ,'D' ,2 ,'C' , 3 ,'B', 'A' ) "���" from emp;

select sal, decode(trunc((sal-1)/1000), 0 , 'E' ,1 ,'D' ,2 ,'C' , 3 ,'B', 'A' ) "���" from emp;
                        -- king(����) ���� ����  king���   ���� ������ ���
select ename from emp start with mgr is null connect by prior empno = mgr;
-- top -> down / left -> right  �ٵ� ��ó�� ���� ��� ž���� �ٿ����� �������� ���������� �˱� ����
select lpad(ename, length(ename) + (level*3) -2, ' ') "�̸�" from emp start with ename = 'KING' connect by prior empno = mgr 
and ename != 'FORD';
--�ƴ� ����
select lpad(ename, length(ename) + (level*3) -2, ' ') "�̸�" from emp start with ename = 'ADAMS' connect by prior mgr = empno;
-- ���ʿ� ���� �������� �� ������ ������ ����
select lpad(ename, length(ename) + (level*3) -2, ' ') "�̸�" from emp where ename != 'FORD' start with ename = 'KING' connect by prior empno = mgr 
;

select * from emp;
select empno, ename, job, dname, loc from emp, dept where emp.deptno = dept.deptno;
select empno, ename, job, e.deptno, dname, loc 
from emp e, dept d where e.deptno = d.deptno;

select empno, ename, job, hiredate, dname from emp, dept where emp.deptno = dept.deptno;
select ename, job, hiredate, dname,loc from emp, dept where hiredate like '81%' and  emp.deptno = dept.deptno ;
select ename, job, hiredate, emp.deptno, dname from emp, dept where comm is null and emp.deptno = dept.deptno ;
select ename, job, hiredate, dname, loc from emp, dept where loc = 'DALAS' and emp.deptno = dept.deptno ;
select ename, job, dname, loc from emp, dept where job in('MANAGER','CLERK') and emp.deptno = dept.deptno ;
select ename, job, dname, comm, coalesce((sal+comm)*12, sal*12) "����" from emp, dept where emp.deptno = dept.deptno 
order by ���� desc;

select empno, ename, job, emp.deptno, dname, sal from emp, dept where (sal between 1000 and 3000) and emp.deptno = dept.deptno
order by dname, sal desc;

select empno, ename, sal, comm, coalesce((sal+comm)*12, sal*12) "����", emp.deptno, dname, loc from emp, dept 
where emp.deptno = dept.deptno order by emp.deptno ,sal ;

select empno, ename, job, sal, dname, loc from emp, dept where dname = 'RESEARCH' and emp.deptno = dept.deptno 
order by sal desc;
