--lag() 현재 행보다 이전 행의 데이터를 가져옴. 동일 부서에서 hiredate순으로 이전 ename을 가져옴. 
select empno, deptno, hiredate, ename
	, lag(ename) over (partition by deptno order by hiredate) as prev_ename
from hr.emp;

-- lead( ) 현재 행보다 다음 행의 데이터를 가져옴. 동일 부서에서 hiredate순으로 다음 ename을 가져옴. 
select empno, deptno, hiredate, ename, 
	lead(ename) over (partition by deptno order by hiredate) as next_ename
from hr.emp;

-- lag() over (order by desc)는 lead() over (order by asc)와 동일하게 동작하므로 혼돈을 방지하기 위해 order by 는 asc로 통일하는것이 좋음. 
select empno, deptno, hiredate, ename
	, lag(ename) over (partition by deptno order by hiredate desc) as lag_desc_ename
	, lead(ename) over (partition by deptno order by hiredate) as lead_desc_ename
from hr.emp; 
