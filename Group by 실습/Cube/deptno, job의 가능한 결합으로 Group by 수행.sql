select deptno, job, sum(sal)
from hr.emp
group by cube(deptno, job)
order by 1, 2;
