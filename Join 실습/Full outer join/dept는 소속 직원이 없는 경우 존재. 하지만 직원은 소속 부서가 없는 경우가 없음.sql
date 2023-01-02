select a.*, b.empno, b.ename
from hr.dept a
	left join hr.emp b on a.deptno = b.deptno;
