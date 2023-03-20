desc emp;
select * from emp;
select * from emp where sal > = 2000;
select * from emp where sal >= 2000 and job = 'MANAGER';
select * from emp where sal < 1500 or job = 'ANALYST';
select * from emp where deptno != 10;
select ename, job, deptno from emp where job = 'MANAGER' or job = 'SALESMAN';
select ename, job, sal from emp where job != 'SALESMAN' or sal >= 2000;
select ename, job, sal, comm, deptno from emp where comm = 300;
select empno, ename, job, hiredate, deptno from emp where hiredate >= '82/01/01';
--java 에서는 null이 값이 없다
--DB에서는 null --> 알 수 없다. 사용할 수 없다. 즉 '='으로 비교할 수 없다. is 또는 is not 으로 사용 사능
select ename, sal, sal + 100, sal *2 from emp;
select ename, job, sal, comm from emp where comm is null;
select ename, job, sal, comm from emp where comm is not null;
select empno, ename, sal, comm from emp where comm is null;
select empno, sal, comm, sal + comm from emp where comm is not null;
select ename, job, sal, comm from job where job = 'MANAGER' or comm is null;
select ename, job, sal, comm from emp where comm is not null and deptno = 30;
select ename, job, hiredate from emp where hiredate >= '82/01/01' and hiredate <= '82/12/31';

select ename, sal, comm, sal + comm from emp;
-- null 값을 처리하는 방법
-- nvl(null vlaue logic)          comm이 null이면 100으로
select ename, sal, comm, sal + nvl(comm, 100), sal + nvl(comm, 0)  from emp;
-- nvl2                                        comm이 null이 아니면, sal + comm 이고 comm이 null이면 sal    
-- coalesce(sal + comm, sal) coalesce 앞에서 부터 null이 아닐때까지 다음행 실행
select ename, sal, comm, sal+nvl(comm, 0), nvl2(comm, comm+ sal, sal), coalesce(sal + comm, sal) from emp;
-- 별칭 생성 가능 / as '별칭' / as생략 가능
select ename as "이름", sal "급여", comm, sal+nvl(comm, 0) "급여와 보너스합", nvl2(comm, comm+ sal, sal), coalesce(sal + comm, sal) "합계" from emp;

select ename, sal, comm, sal+nvl(comm,0), sal + nvl2(comm,comm+sal, sal), coalesce(sal + comm, sal) from emp;
select ename, sal comm, coalesce((sal+comm)*12, sal * 12) "연봉"  from emp;
select * from emp where hiredate >= '81/01/01' and hiredate <= '81/12/31' and job = 'MANAGER';
select sal + comm "급여 + 보너스" from emp where comm is null;
select ename, sal, comm, coalesce((sal+comm) * 12, sal * 12) "연봉" from emp where comm is not null and sal >= 1500;
select ename "이름", sal "급여", deptno "부서코드" from emp where deptno = 10 or job = 'MANAGER';
select ename, sal, comm, coalesce(sal + comm, sal) "실급여" from emp where sal <= 1500 or job = 'CLERK';
-- oracle에서 concat 두개 항목만 가능
select concat(ename, sal) from emp;
select ename || '(' || sal || ')' from emp; 
select ename ||'의 급여는' || sal||'이다' from emp;
select distinct job from emp;
--distinct 중복이 있는 경우 