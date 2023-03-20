create table a(val char(1) primary key);
insert into a values('A');
insert into a values('B');
insert into a values('C');
insert into a values('D');
insert into a values('E');
select * from a;
create table b(num number(1) primary key, val char(1));
insert into b values(1,'C');
insert into b values(2,'D');
insert into b values(3,'E');
insert into b values(4,'F');
insert into b values(5,'G');
select * from b;

--union 합집합, 중복된 데이터는 1회 정열 : 출력되는 컬럼의 데이터 힘과 갯수가 일치해야함 (val)
select val from a union select val from b;
--중복된 것 포함 정열 안됨
select val from a union all select val from b;
select null, val from a union select num, val from b;
-- intersect 공통집합, 교집합
select val from a intersect select val from b;
select val from b intersect select val from a;
--minus 차집합
select val from a minus select val from b;
select val from b minus select val from a;

--양쪽 테이블에 공통으로 사용하는 컬럼이 한개 존재
select ename,sal,dname from emp natural join dept;
select ename,sal,dname from emp join dept using(deptno);

--연습문제 join 마지막

--1
select ename, e.deptno, dname from emp e, dept d where e.deptno = d.deptno;
--2
select ename, job, sal, dname from emp e, dept d where e.deptno = d.deptno and loc = 'NEW YORK';
--3
select ename, dname, loc from emp e, dept d where e.deptno = d.deptno and comm is not null;
--4
select ename, job, dname, loc from emp e, dept d where e.deptno = d.deptno and ename like '%L%' ;
--5
select empno, ename, e.deptno, dname from emp e, dept d where e.deptno = d.deptno order by ename desc;
--6
select empno, ename, sal, dname from emp e, dept d where e.deptno = d.deptno and sal>2000 order by ename;
--7
select empno, ename, job, sal, dname from emp e, dept d where e.deptno = d.deptno and job = 'MANAGER' and sal >= 2500 
order by empno desc;
--8
select empno, ename, job, sal, grade from emp , salgrade where sal between losal and hisal  order by sal desc;
--9
select w.ename 사원명, m.ename 관리자명 from emp w, emp m where w.mgr = m.empno;
--10
select w.ename 사원명, m.ename 관리자명, mm.ename 관관리자명 from emp w, emp m, emp mm where w.mgr = m.empno and m.mgr = mm.empno;
--11
select w.ename 사원명, m.ename 관리자명, mm.ename 관관리자명 from emp w, emp m, emp mm where w.mgr = m.empno(+) and m.mgr = mm.empno(+);
