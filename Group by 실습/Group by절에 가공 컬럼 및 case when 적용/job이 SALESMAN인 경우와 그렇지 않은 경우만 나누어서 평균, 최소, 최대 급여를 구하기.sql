select case when job = 'SALESMAN' then 'SALESMAN'
		      else 'OTHERS' end as job_gubun
	   , avg(sal) as avg_sal, max(sal) as max_sal, min(sal) as min_sal --, count(*) as cnt
from hr.emp
group by case when job = 'SALESMAN' then 'SALESMAN'
		      else 'OTHERS' end ;
