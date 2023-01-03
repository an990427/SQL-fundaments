select b.empno, max(b.ename) as ename, avg(c.sal) as avg_sal --, count(*) as cnt
from hr.dept a
	join hr.emp b on a.deptno = b.deptno
	join hr.emp_salary_hist c on b.empno = c.empno
where  a.dname in('SALES', 'RESEARCH')
group by b.empno
order by 1;
