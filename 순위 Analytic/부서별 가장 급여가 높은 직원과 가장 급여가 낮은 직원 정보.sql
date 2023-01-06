-- 부서별 가장 급여가 높은 직원과 가장 급여가 낮은 직원 정보. 공동 순위는 없으며 반드시 고유 순위를 정함
select a.*
	, case when sal_rn_desc=1 then 'top'
	       when sal_rn_asc=1 then 'bottom'
	       else 'middle' end as gubun
from (
	select a.*
		, row_number() over (partition by deptno order by sal desc) as sal_rn_desc
		, row_number() over (partition by deptno order by sal asc) as sal_rn_asc
	from hr.emp a
) a where sal_rn_desc = 1 or sal_rn_asc=1;


-- 부서별 가장 급여가 높은 직원과 가장 급여가 낮은 직원 정보 그리고 두 직원값의 급여차이도 함께 추출. 공동 순위는 없으며 반드시 고유 순위를 정함
with
temp_01 as (
	select a.*
		, case when sal_rn_desc=1 then 'top'
		       when sal_rn_asc=1 then 'bottom'
		       else 'middle' end as gubun
	from (
		select a.*
			, row_number() over (partition by deptno order by sal desc) as sal_rn_desc
			, row_number() over (partition by deptno order by sal asc) as sal_rn_asc
		from hr.emp a
	) a where sal_rn_desc = 1 or sal_rn_asc=1
),
temp_02 as (
	select deptno
		, max(sal) as max_sal, min(sal) as min_sal
	from temp_01 group by deptno
)
select a.*, b.max_sal - b.min_sal as diff_sal 
from temp_01 a 
	join temp_02 b on a.deptno = b.deptno
order by a.deptno, a.sal desc;

-- 회사내 커미션 높은 순위. rank와 row_number 모두 추출. 
select a.*
	, rank() over (order by comm desc) as comm_rank
	, row_number() over (order by comm desc) as comm_rnum
from hr.emp a;
