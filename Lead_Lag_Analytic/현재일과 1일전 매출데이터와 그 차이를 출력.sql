-- 1일전 매출 데이터가 없을 경우 현재일 매출 데이터를 출력하고, 차이는 0
with
temp_01 as (
select date_trunc('day', b.order_date)::date as ord_date, sum(amount) as daily_sum
from nw.order_items a
	join nw.orders b on a.order_id = b.order_id
group by date_trunc('day', b.order_date)::date 
)
select ord_date, daily_sum
	, coalesce(lag(daily_sum) over (order by ord_date), daily_sum) as prev_daily_sum
	, daily_sum - coalesce(lag(daily_sum) over (order by ord_date), daily_sum) as diff_prev
from temp_01;
