select ename, sal from emp where sal >= 2000 and sal <= 3000;
select ename, sal from emp where sal between 2000 and 3000; 
--                                           3000 and 2000 --> 불가능 , 작은 숫자가 앞으로 와야함
select ename, sal from emp where sal not between 2000 and 3000; 
select ename, sal from emp where sal < 2000 or sal > 3000; 
-- 이름이 k나 s로 시작하는 사람, 앞에 한글자씩 비교해서 같으면 다음 글자
select ename from emp where ename between 'K' and 'SZZ';
-- 10번 또는 20번에 근무하는 사람
select ename, deptno from emp where deptno = 10 or deptno = 20;
select ename, deptno from emp where deptno in(10,20); --괄호 안에 갯수 제한이 없음
select ename, deptno from emp where deptno not in (10,20);

select empno, ename, hiredate, sal from emp where sal between 1500 and 3000;
select ename, sal, hiredate, comm from emp where sal not between 2000 and  3500 or comm is null;
select ename, sal, hiredate, comm from emp where sal not between 2000 and 4000 or comm is null;
select empno, ename, job from emp where job in('SALESMAN','CLERK');
select empno, ename, deptno from emp where dept in (10, 30);
select empno, ename,job from emp where jon not in('MANAGER', 'CLERK');
select empno, ename, hiredate from emp where hiredate between '81/01/01' and '81/12/31';
select empno, ename, hiredate from emp where hiredate like '81%';
--81로 시작하고 나머지는 모두(%)
select ename from emp where ename between 'D' and 'TZZ';
select ename from emp where ename like 'S%';
--S로 시작하는 것
select ename from emp where ename like '%T';
--T로 끝나는 것
--언더바(_) 는 아무글자나 관계없지만 글자수 한개
select ename from emp where ename like '_A%';
-- A앞에는 한 글자만 올수 있고 A뒤에는 무제한
select ename from emp where ename like '__R%';
-- 앞에서부터 세번째 글자가 R이여야하며 뒤에는 무제한
select * from emp;
update emp set ename = 'SMI%TH' where empno = 7369;
-- 사번이 7369 인 사람의 이름을 'SMI%TH'로 바꾸라
select * from emp;
select ename from emp where ename like '%\%%' escape '\';
-- %나 _가 포함된 문자를 검색할 때는 escape 문자를 활용
select ename from emp where ename not like '%\%%' escape '\';
select ename, sal, comm, coalesce((sal+comm)*12, sal *12) "연봉" from emp where sal between 1000 and 3000;
select ename || '(' || job || ')'||'은 급여가'||sal||'이고 연봉은'||(sal + nvl(comm, 0))*12|| '이다' from emp;

select * from emp where ename like '%R%';
select * from emp where ename like '%S';
select * from emp where hiredate like '81%' and job = 'MANAGER';
select * from emp where ename like '_L%';
select * from emp where ename like '%R_';
select * from emp where ename like '%\%%' escape '\';
select ename from emp where ename like '%TT%';
select * from emp where ename like '%L%L%';
select ename, sal, deptno from emp where deptno like '3%' or sal between 2500 and 3000;
select ename from emp where ename like '%N__';
select ename from emp where ename not like 'S%';

select empno, ename, job, sal from emp where job = 'SALESMAN' or job = 'MANAGER' and sal >= 2000;
--and를 먼저 실행 , 매니저이면서 급여가 2000이상이거나 세일즈맨
select empno, ename, job, sal from emp where job = 'SALESMAN' or (job = 'MANAGER' and sal >= 2000);
-- 업무가 세일즈맨 혹은 매니저 중 급여가 2000이상
select empno, ename, job, sal from emp where (job = 'SALESMAN' or job = 'MANAGER') and sal >= 2000;
--where 조건 order by 컬럼(순서, 식, 별칭) ; 작은순 (asc 생략)
select ename 이름, sal from emp order by 이름 desc;
select ename 이름, sal from emp order by sal;
select ename, sal, comm, sal + nvl(comm,0) from emp order by sal + nvl(comm,0);
--부서 별 작은순으로 정렬하되, 같은 부서내에서 급여를 큰순으로 정렬
select ename, sal, deptno from emp order by deptno, sal desc;
--오라클에서 null은 큰값으로 인식 BUT, mysql에서는 null을 작은 값으로 인식
select ename, sal, comm from emp order by comm;


select empno, ename, sal from emp order by sal desc;
select ename, job, sal, hiredate from emp order by job , sal ;
select ename, deptno, job, hiredate, sal from emp order by deptno, job, sal desc;
select ename, deptno, job, hiredate, sal from emp where hiredate like '81%' order by job , hiredate;
select ename, deptno, job, hiredate, sal from emp where hiredate like '81%' order by job , 4;
select ename, sal, comm, coalesce((sal+comm)*12, sal*12) "연봉" from emp order by coalesce((sal+comm)*12, sal*12) desc;
select ename, sal, deptno, hiredate from emp where sal between 1500 and 3500 order by hiredate;

select empno, ename, job, sal from emp where sal >= 3000;
select ename, deptno, empno from emp where empno = 7788;
select ename,job,hiredate from emp where hiredate between '81/02/20' and '81/05/01' order by hiredate;
select * from emp where deptno in(10,20) order by ename;
select ename "employee", sal "Monthly Salary" from emp where sal >= 1500 and deptno in(10,30);
select * from emp where hiredate like '82%';


select * from emp where comm is not null;
select ename, sal, comm from emp where comm >= sal*1.1;
select * from emp where job in('CLERK','ANALYST') and sal not in(1000,3000,5000);
select * from emp where ename like '%L%L%' and deptno = 30 or mgr = 7782;
select * from emp where ename like '%L%L%' and (deptno = 30 or mgr = 7782);

select empno, ename, hiredate, job, sal from emp where hiredate like '81%';
select empno, ename, hiredate, job, sal from emp where hiredate like '81%' and jon not in('SALESMAN');
select empno, ename, hiredate, job, sal from emp order by sal desc , hiredate ;
select empno, ename from emp where ename like '__N%';
select empno, ename, sal * 12 "연봉" from emp where sal*12 >= 35000;