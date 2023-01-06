-- 회사내 근무 기간 순위(hiredate) : 공동 순위가 있을 경우 차순위는 밀려서 순위 정함
select a.*
	, rank() over (order by hiredate) as hire_rank 
from hr.emp a;

-- 부서별로 가장 급여가 높은/낮은 순으로 순위: 공동 순위 시 차순위는 밀리지 않음.
select a.*
	, dense_rank() over (partition by deptno order by sal desc) as sal_rank_desc
	, dense_rank() over (partition by deptno order by sal ) as sal_rank_asc
from hr.emp a;

-- 부서별 가장 급여가 높은 직원 정보:  공동 순위는 없으며 반드시 고유 순위를 정함.  
select * 
from 
(
	select a.*
		, row_number() over (partition by deptno order by sal desc) as sal_rn
	from hr.emp a
) a where sal_rn = 1;

-- 부서별 급여 top 2 직원 정보: 공동 순위는 없으며 반드시 고유 순위를 정함. 
select * 
from 
(
	select a.*
		, row_number() over (partition by deptno order by sal desc) as sal_rn
	from hr.emp a
) a where sal_rn <=2;
