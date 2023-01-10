-- lag 적용 시 windows에서 가져올 값이 없을 경우 default 값을 설정할 수 있음. 이 경우 반드시 offset을 정해 줘야함. 
select empno, deptno, hiredate, ename
	, lag(ename, 1, 'No Previous') over (partition by deptno order by hiredate) as prev_ename 
from hr.emp;

-- Null 처리를 아래와 같이 수행할 수도 있음. 
select empno, deptno, hiredate, ename
	, coalesce(lag(ename) over (partition by deptno order by hiredate), 'No Previous') as prev_ename 
from hr.emp;
