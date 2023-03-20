-- non equi 비동등 조인, between
select empno, ename, sal, grade from emp, salgrade where sal between losal and hisal;
select * from dept;
select ename, job, sal, dname, loc from emp e, dept d where e.deptno = d.deptno;
--outer join 두개 이상의 테이블에서 한쪽에만 존재하는 데이터도 출력하고 싶을 때 --> 부족한 부분에 (+)표시(오라클만 가능)
select ename, job, sal, dname, loc from emp e, dept d where e.deptno(+) = d.deptno;
select ename, job, sal, dname, loc from emp e right outer join  dept d on e.deptno(+) = d.deptno;


select empno, ename, job, dname, loc from emp e, dept d where e.deptno =d.deptno order by dname;

select ename, job, hiredate, sal, d.deptno, dname from emp e, dept d
where e.deptno =d.deptno order by d.deptno, sal desc;

select empno, ename, job, sal from emp, salgrade where sal between losal and hisal order by grade;

select empno, dname, job, sal, grade, dname from emp, salgrade, dept
where emp.deptno = dept.deptno and sal between losal and hisal; 

select ename, job, hiredate, sal, d.deptno, dname, loc from emp e, dept d  where e.deptno(+) = d.deptno;

select ename, job, hiredate, dname, loc from emp e, dept d where (sal between 1500 and 3000) and e.deptno = d.deptno;

select ename,job,sal, coalesce((sal+comm)*12, sal*12) "연봉", grade, dname, loc from emp,dept,salgrade
where emp.deptno = dept.deptno and sal between losal and hisal;

select ename, job, hiredate, dname, loc from emp e, dept d where hiredate like '81%' and e.deptno = d.deptno;

select ename, job, hiredate, d.deptno, dname , loc from emp e, dept d where e.deptno(+) = d.deptno order by loc, sal;

select w.ename 직원, m.ename 관리자 from emp m , emp w where m.empno(+)=w.mgr;
select w.ename 직원, m.ename 관리자 from emp m , emp w where m.empno = w.mgr(+);
select w.ename 직원, m.ename 관리자 from emp m full outer join emp w on m.empno = w.mgr;


--1
select w.ename||'의 상사는 '||m.ename||'입니다' from emp w, emp m where w.mgr = m.empno;
--2
select w.ename, w.job from emp w, emp m where m.empno = w.mgr and m.ename = 'KING';
--3
select w.ename 직원, d.deptno, w.hiredate, dname, m.ename 사수 from emp w,emp m, dept d 
where w.deptno = d.deptno and w.mgr = m.empno;
--4
select w.ename 직원, w.job, w.hiredate, w.sal, dname, m.ename 사수 from emp w, emp m, dept d 
where w.deptno = d.deptno and w.mgr = m.empno(+);
--5
select w.ename 직원명, w.sal, grade, dname, loc, m.ename 관리자명 from emp w, emp m, dept d, salgrade
where w.mgr = m.empno(+) and d.deptno = w.deptno and w.sal between losal and hisal;
--6
select w.ename 직원명, w.job, w.sal, grade, dname, loc, m.ename 관리자명 from emp w, emp m, dept d, salgrade
where w.job in('SALESMAN','MANAGER') and  w.mgr = m.empno and d.deptno = w.deptno and w.sal between losal and hisal;
--7
select w.ename 직원명, w.job, w.sal, grade, coalesce((w.sal+w.comm)*12, w.sal*12) "연봉", dname, m.ename 관리자명 
from emp w, emp m, dept d, salgrade
where w.mgr = m.empno and d.deptno = w.deptno and w.sal between losal and hisal;
--8
select w.ename 직원명, w.sal, grade , dname, m.ename 관리자명 from emp w, emp m, dept d, salgrade
where w.mgr = m.empno(+) and d.deptno = w.deptno and w.sal between losal and hisal order by dname desc;

-- ========================================================

create table a(val char(1) primary key);
insert into a values('A');






