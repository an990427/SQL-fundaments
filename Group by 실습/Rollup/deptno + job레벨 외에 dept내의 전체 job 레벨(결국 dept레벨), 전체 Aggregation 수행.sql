select deptno, job, sum(sal)
from hr.emp
group by rollup(deptno, job)
order by 1, 2;
