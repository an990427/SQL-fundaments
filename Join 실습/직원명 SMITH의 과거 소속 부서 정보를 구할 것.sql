select a.ename, a.empno, b.deptno, c.dname, b.fromdate, b.todate  
from hr.emp a
	join hr.emp_dept_hist b on a.empno = b.empno
	join hr.dept c on b.deptno = c.deptno
where a.ename = 'SMITH';
