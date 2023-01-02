select a.*, b.dname 
from hr.emp a
	join hr.dept b on a.deptno = b.deptno
where job = 'SALESMAN';
