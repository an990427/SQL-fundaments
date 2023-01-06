-- rank, dense_rank, row_number 사용하기 - 1
select a.empno, ename, job, sal 
	, rank() over(order by sal desc) as rank 
	, dense_rank() over(order by sal desc) as dense_rank
	, row_number() over (order by sal desc) as row_number 
from hr.emp a;

-- rank, dense_rank, row_number 사용하기 - 2
select a.empno, ename, job, deptno, sal 
	, rank() over(partition by deptno order by sal desc) as rank 
	, dense_rank() over(partition by deptno order by sal desc) as dense_rank
	, row_number() over (partition by deptno order by sal desc) as row_number 
from hr.emp a
