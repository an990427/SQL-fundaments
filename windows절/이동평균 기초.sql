-- 3일 이동 평균 매출
with
temp_01 as (
select date_trunc('day', b.order_date)::date as ord_date, sum(amount) as daily_sum
from order_items a
	join orders b on a.order_id = b.order_id
group by date_trunc('day', b.order_date)::date 
)
select ord_date, daily_sum
	, avg(daily_sum) over (order by ord_date 
	                              rows between 2 preceding and current row) as ma_3days
from temp_01;

-- 3일 중앙 평균 매출
with
temp_01 as (
select date_trunc('day', b.order_date)::date as ord_date, sum(amount) as daily_sum
from order_items a
	join orders b on a.order_id = b.order_id
group by date_trunc('day', b.order_date)::date 
)
select ord_date, daily_sum
	, avg(daily_sum) over (order by ord_date 
	                              rows between 1 preceding and 1 following) as ca_3days
from temp_01;
