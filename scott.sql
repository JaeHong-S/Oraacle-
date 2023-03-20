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
--java ������ null�� ���� ����
--DB������ null --> �� �� ����. ����� �� ����. �� '='���� ���� �� ����. is �Ǵ� is not ���� ��� ���
select ename, sal, sal + 100, sal *2 from emp;
select ename, job, sal, comm from emp where comm is null;
select ename, job, sal, comm from emp where comm is not null;
select empno, ename, sal, comm from emp where comm is null;
select empno, sal, comm, sal + comm from emp where comm is not null;
select ename, job, sal, comm from job where job = 'MANAGER' or comm is null;
select ename, job, sal, comm from emp where comm is not null and deptno = 30;
select ename, job, hiredate from emp where hiredate >= '82/01/01' and hiredate <= '82/12/31';

select ename, sal, comm, sal + comm from emp;
-- null ���� ó���ϴ� ���
-- nvl(null vlaue logic)          comm�� null�̸� 100����
select ename, sal, comm, sal + nvl(comm, 100), sal + nvl(comm, 0)  from emp;
-- nvl2                                        comm�� null�� �ƴϸ�, sal + comm �̰� comm�� null�̸� sal    
-- coalesce(sal + comm, sal) coalesce �տ��� ���� null�� �ƴҶ����� ������ ����
select ename, sal, comm, sal+nvl(comm, 0), nvl2(comm, comm+ sal, sal), coalesce(sal + comm, sal) from emp;
-- ��Ī ���� ���� / as '��Ī' / as���� ����
select ename as "�̸�", sal "�޿�", comm, sal+nvl(comm, 0) "�޿��� ���ʽ���", nvl2(comm, comm+ sal, sal), coalesce(sal + comm, sal) "�հ�" from emp;

select ename, sal, comm, sal+nvl(comm,0), sal + nvl2(comm,comm+sal, sal), coalesce(sal + comm, sal) from emp;
select ename, sal comm, coalesce((sal+comm)*12, sal * 12) "����"  from emp;
select * from emp where hiredate >= '81/01/01' and hiredate <= '81/12/31' and job = 'MANAGER';
select sal + comm "�޿� + ���ʽ�" from emp where comm is null;
select ename, sal, comm, coalesce((sal+comm) * 12, sal * 12) "����" from emp where comm is not null and sal >= 1500;
select ename "�̸�", sal "�޿�", deptno "�μ��ڵ�" from emp where deptno = 10 or job = 'MANAGER';
select ename, sal, comm, coalesce(sal + comm, sal) "�Ǳ޿�" from emp where sal <= 1500 or job = 'CLERK';
-- oracle���� concat �ΰ� �׸� ����
select concat(ename, sal) from emp;
select ename || '(' || sal || ')' from emp; 
select ename ||'�� �޿���' || sal||'�̴�' from emp;
select distinct job from emp;
--distinct �ߺ��� �ִ� ��� 