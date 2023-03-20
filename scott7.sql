select deptno, sum(sal) from emp group by deptno;
--roll up 하니까 전체 합계 + 기준 오름차순 정렬
select deptno, sum(sal) from emp group by rollup(deptno) order by deptno;
select deptno, job, sum(sal) from emp group by rollup(deptno,job) order by deptno;
select deptno, job, sum(sal) from emp group by cube(deptno,job) order by deptno;
select grouping(deptno), deptno, sum(sal) from emp group by rollup(deptno);

--회사에서 제일 급여가 많은 사람의 이릅과 급여
select max(sal) from emp;
select ename, sal from emp where sal = 5000;
-- main query                             sub query
select ename,sal from emp where sal = (select max(sal) from emp);
select dname, deptno from dept where deptno = (select deptno from emp where ename = 'BLAKE');

--1
select ename, sal from emp where sal = (select min(sal) from emp);
--2
select ename, hiredate, sal, grade from emp, salgrade where (sal between losal and hisal)
and hiredate = (select min(hiredate) from emp);
--3 
select ename, sal, grade dname from emp e, dept d, salgrade where e.deptno = d.deptno and sal between losal and hisal
and  hiredate = (select max(hiredate) from emp);
--4
select ename, job, hiredate, dept.deptno from emp, dept where emp.deptno = dept.deptno and loc = 'NEWYORK';
--5
select ename, sal, job, comm from emp where job = (select job from emp where ename = 'ALLEN');
--6
select ename, sal, deptno from emp where sal > (select avg(sal) from emp);
--7 
select ename, sal, dname from emp e, dept d where sal < (select avg(sal) from emp) and e.deptno = d.deptno order by dname;
--8
select ename, sal, job, grade, dname from emp e, dept d , salgrade where e.deptno = d.deptno and (sal between losal and hisal) 
and dname = 'RESEARCH';
--9 ??
select ename, sal, dname, grade from emp e, dept d , salgrade where e.deptno = d.deptno and sal between losal and hisal
and to_char(hiredate,'yy') = 81 and sal > (select avg(sal) from emp);


--1
select empno, ename, sal from emp where sal > (select sal from emp where ename = 'BLAKE');
--2
select deptno, ename, hiredate from emp where hiredate > (select hiredate from emp where ename = 'MILLER');
--3
select empno, ename, sal from emp where sal > (select avg(sal) from emp);
--4??
select empno, ename, sal from emp  where deptno = (select deptno from emp  where ename = 'CLARK') 
and sal > (select sal from emp where empno = 7698);
--5 ??
select empno, ename, deptno, sal from emp where sal in (select max(sal) from emp group by deptno);


--1
select ename , deptno from emp where deptno = (select deptno from emp where ename = 'SCOTT');
--2
select * from emp where job = (select job from emp where ename = 'SCOTT');
--3
select ename, sal from emp where sal >= (select sal from emp where ename = 'SCOTT');
--4??
select ename, e.deptno from emp e, dept d where e.deptno = d.deptno and loc = 'DALLAS';
--5
select ename, sal from emp e, dept d where e.deptno = d.deptno and dname = 'SALES';
select ename, sal from emp where deptno = (select deptno from dept where dname = 'SALES');
--6
select ename, sal  from emp where mgr = (select empno from emp where ename = 'KING');

select deptno, min(sal) from emp group by deptno having min(sal) > (select min(sal) from emp);
-- 아래 오류 why? where 절에 sal 값이 여러개 나옴
select ename, sal from emp where sal = (select min(sal) from emp group by deptno);


--1
select ename, hiredate from emp where hiredate in (select min(hiredate) from emp group by deptno);
--2
select ename, sal ,job from emp where sal in (select max(sal) from emp group by job);
--3
select ename, job, sal, dname from emp e , dept d where e.deptno = d.deptno and sal in (select min(sal) from emp group by deptno);
--4
select ename, job, hiredate, sal, grade, dname from emp e, dept d , salgrade where  
e.sal between losal and hisal and (e.deptno = d.deptno )and (job, hiredate) in (select job, min(hiredate) from emp group by job);

select deptno, round(avg(sal)) from emp group by deptno order by deptno;

select ename, sal from emp where sal >all (select avg(sal) from emp group by deptno);
select ename, sal from emp where sal >any (select avg(sal) from emp group by deptno);
select ename, sal from emp where sal > (select min(avg(sal)) from emp group by deptno);
select ename, sal, deptno from emp where (sal, deptno) in (select sal, deptno from emp where deptno = 30 and comm is not null);


select empno, job, deptno from emp where (job, deptno) in (select job, deptno from emp where empno in (7369, 7499));
--위에꺼 분리
select empno, job, deptno from emp where job in (select job from emp where empno in (7369, 7499)) and  
deptno in (select deptno from emp where empno in (7369, 7499)) ;
--parewise 비교 두개 컬럼이상 같이 일치
--nonparewise              따로따로 일치

--1
select empno, ename, sal, deptno from emp where sal in (select max(sal) from emp group by deptno);
--2
select e.deptno, dname, loc from emp e, dept d where e.deptno = d.deptno and job in (select job from emp where job = 'MANAGER')
order by deptno;
