select ename, lower(ename), upper(ename), initcap(ename) from emp;

select *from emp where lower(job) in('manager', 'salesman'); 
-- 다 소문자로 바꿔서 찾아봐
select ename, substr(ename, 2, 3) from emp; 
select ename, substr(ename, 2, 3), substr(ename, -4, 2) from emp; 
-- dual은 dummy table
select length('oracle'), length('오라클') from dual;
select lengthb('oracle'), lengthb('오라클') from dual;

select ename, hiredate from emp where substr(hiredate,4,2) = 02;

select * from emp where substr(hiredate, 1,2) = 87;
select * from emp where hiredate like '87%';
select * from emp where substr(ename,-1,1) = 'E';
select substr('welcome oracle', 3, 3), substr('환영합니다 오라클',3,3) from dual;
--instr(컬럼, 문자, 시작, 순서)
select ename, instr(ename, 'L') e_null, instr(ename, 'L', 1,1) e_11, instr(ename, 'L', 1,2) e_12, instr(ename, 'L', 4,1) e_41, 
instr(ename, 'L', 4,2) e_42 from emp order by ename;
-- lpad, rpad
select ename, lpad(ename, 7, ''), rpad(ename,7, '*') from emp;
select ename, ltrim(ename, 'A'), rtrim(ename, 'S'), trim('S' from ename) from emp;

select empno, ename, translate(ename, 'ABCDEFG', '0123456') from emp;
select ename, job, replace(job, 'MAN', 'PERSON') from emp;

select job, lower(job), initcap(job), upper(job) from emp;
select ename, job from emp where lower(job) in ('manager', 'clerk');
select ename, job, hiredate from emp where substr(hiredate, 1, 2) = 81;
select ltrim(ename, 'S'), rtrim(ename, 'S'), trim('S' from ename) from emp;
select sal , lpad(sal, 5, '#') from emp;
select substr(ename, 2, 3), coalesce((sal + comm) * 12, sal * 12) "연봉" from emp order by 2 desc;
select ename, job, replace(job, 'MAN', 'PERSON') from emp;
select ename, sal, translate(sal, '0123456789', '영일이삼사오륙칠팔구') from emp;
select ename, length(ename) from emp order by 2 desc; 

select abs(10), abs(-10) from dual;
--양수의 경우, trunc와 floor 같은 결과
select ename, sal/3, round(sal/3), trunc(sal/3,0), ceil(sal/3), floor(sal/3) from emp;
--음수의 경우, trunc와 deil 같은 결과
select ename, -sal/3, round(-sal/3), trunc(-sal/3,0), ceil(-sal/3), floor(-sal/3) from emp;
select ename, sal, mod(sal, 30) from emp; --mod는 나머지
select ename, sal, power(sal, 2) from emp;
select sqrt(10), sqrt(4), sqrt(2) from dual;

select ename, sal/7, round(sal/7), trunc(sal/7,0), ceil(sal/7), floor(sal/7) from emp;
select ename, -sal/7, round(-sal/7), trunc(-sal/7,0), ceil(-sal/7), floor(-sal/7) from emp;
select ename, sal/7, round(sal/7), round(sal/7,1), round(sal/7,2), round(sal/7, -2), round(sal/7, -3) from emp;
select ename, sal/7, trunc(sal/7), trunc(sal/7,1), trunc(sal/7,2), trunc(sal/7, -2), trunc(sal/7, -3) from emp;
select ename, sal, mod(sal,8), mod(sal,7) from emp;
select power(2,10), sqrt(3), chr(66) from dual;

select sysdate from dual;
select ename, sysdate, hiredate, round(sysdate - hiredate) "근무일", round((sysdate - hiredate)/ 7) "근무주" from emp;
select ename, hiredate, add_months(hiredate, 2), next_day(hiredate, '금') from emp;
select ename, hiredate, to_char(hiredate, 'yy/mm/dd hh:mi:ss'), to_char(hiredate, '(dy) yyyy/mm/dd'),
to_char(hiredate, '(day)yyyy-mm-dd (am)hh : mi: ss') from emp;

select 76 - to_number('45') from dual;
select round(sysdate - to_date('900528', 'yy/mm/dd')) from dual;
select round(sysdate - to_date('19900528', 'yyyy/mm/dd')) from dual;

select ename, hiredate, round(sysdate - hiredate) "근무일",sal, trunc(months_between(sysdate, hiredate) *sal) 총급여 from emp;
select ename, hiredate, add_months(hiredate, 2) from emp;
select ename, to_char(hiredate, '(day) yyy-mm-dd (am) hh : mi:ss')from emp;
select ename, to_char(sal, 'L99,999') from emp;
select round(sysdate-to_date('94/07/14', 'rr/mm/dd')) from dual;

select empno, ename, sal, job, case job when 'ANALYST' then sal * 1.1 when 'CLERK' then sal*1.2 when  'MANAGER' then  sal*1.3 
when 'PRESIDENT' then sal * 1.4 else sal end 급여인상분 from emp;

select ename, job, sal from emp;

select empno, ename, sal, job, decode (job , 'ANALYST', sal * 1.1 , 'CLERK' , sal*1.2 ,  'MANAGER' ,  sal*1.3 
, 'PRESIDENT' , sal * 1.4 , sal)  급여인상분 from emp;

select empno, deptno, decode(deptno, 10, '회계팁', 20, '연구소', 30, '영업팀', '운영팀') "부서명" from emp;

