select ename, sal from emp where sal >= 2000 and sal <= 3000;
select ename, sal from emp where sal between 2000 and 3000; 
--                                           3000 and 2000 --> �Ұ��� , ���� ���ڰ� ������ �;���
select ename, sal from emp where sal not between 2000 and 3000; 
select ename, sal from emp where sal < 2000 or sal > 3000; 
-- �̸��� k�� s�� �����ϴ� ���, �տ� �ѱ��ھ� ���ؼ� ������ ���� ����
select ename from emp where ename between 'K' and 'SZZ';
-- 10�� �Ǵ� 20���� �ٹ��ϴ� ���
select ename, deptno from emp where deptno = 10 or deptno = 20;
select ename, deptno from emp where deptno in(10,20); --��ȣ �ȿ� ���� ������ ����
select ename, deptno from emp where deptno not in (10,20);

select empno, ename, hiredate, sal from emp where sal between 1500 and 3000;
select ename, sal, hiredate, comm from emp where sal not between 2000 and  3500 or comm is null;
select ename, sal, hiredate, comm from emp where sal not between 2000 and 4000 or comm is null;
select empno, ename, job from emp where job in('SALESMAN','CLERK');
select empno, ename, deptno from emp where dept in (10, 30);
select empno, ename,job from emp where jon not in('MANAGER', 'CLERK');
select empno, ename, hiredate from emp where hiredate between '81/01/01' and '81/12/31';
select empno, ename, hiredate from emp where hiredate like '81%';
--81�� �����ϰ� �������� ���(%)
select ename from emp where ename between 'D' and 'TZZ';
select ename from emp where ename like 'S%';
--S�� �����ϴ� ��
select ename from emp where ename like '%T';
--T�� ������ ��
--�����(_) �� �ƹ����ڳ� ��������� ���ڼ� �Ѱ�
select ename from emp where ename like '_A%';
-- A�տ��� �� ���ڸ� �ü� �ְ� A�ڿ��� ������
select ename from emp where ename like '__R%';
-- �տ������� ����° ���ڰ� R�̿����ϸ� �ڿ��� ������
select * from emp;
update emp set ename = 'SMI%TH' where empno = 7369;
-- ����� 7369 �� ����� �̸��� 'SMI%TH'�� �ٲٶ�
select * from emp;
select ename from emp where ename like '%\%%' escape '\';
-- %�� _�� ���Ե� ���ڸ� �˻��� ���� escape ���ڸ� Ȱ��
select ename from emp where ename not like '%\%%' escape '\';
select ename, sal, comm, coalesce((sal+comm)*12, sal *12) "����" from emp where sal between 1000 and 3000;
select ename || '(' || job || ')'||'�� �޿���'||sal||'�̰� ������'||(sal + nvl(comm, 0))*12|| '�̴�' from emp;

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
--and�� ���� ���� , �Ŵ����̸鼭 �޿��� 2000�̻��̰ų� �������
select empno, ename, job, sal from emp where job = 'SALESMAN' or (job = 'MANAGER' and sal >= 2000);
-- ������ ������� Ȥ�� �Ŵ��� �� �޿��� 2000�̻�
select empno, ename, job, sal from emp where (job = 'SALESMAN' or job = 'MANAGER') and sal >= 2000;
--where ���� order by �÷�(����, ��, ��Ī) ; ������ (asc ����)
select ename �̸�, sal from emp order by �̸� desc;
select ename �̸�, sal from emp order by sal;
select ename, sal, comm, sal + nvl(comm,0) from emp order by sal + nvl(comm,0);
--�μ� �� ���������� �����ϵ�, ���� �μ������� �޿��� ū������ ����
select ename, sal, deptno from emp order by deptno, sal desc;
--����Ŭ���� null�� ū������ �ν� BUT, mysql������ null�� ���� ������ �ν�
select ename, sal, comm from emp order by comm;


select empno, ename, sal from emp order by sal desc;
select ename, job, sal, hiredate from emp order by job , sal ;
select ename, deptno, job, hiredate, sal from emp order by deptno, job, sal desc;
select ename, deptno, job, hiredate, sal from emp where hiredate like '81%' order by job , hiredate;
select ename, deptno, job, hiredate, sal from emp where hiredate like '81%' order by job , 4;
select ename, sal, comm, coalesce((sal+comm)*12, sal*12) "����" from emp order by coalesce((sal+comm)*12, sal*12) desc;
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
select empno, ename, sal * 12 "����" from emp where sal*12 >= 35000;