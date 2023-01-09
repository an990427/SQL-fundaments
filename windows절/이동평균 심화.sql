-- N 이동 평균에서 맨 처음 N-1 개의 데이터의 경우 정확히 N이동 평균을 구할 수 없을 때 Null 처리 하기. 
with
temp_01 as (
select date_trunc('day', b.order_date)::date as ord_date, sum(amount) as daily_sum
from order_items a
	join orders b on a.order_id = b.order_id
group by date_trunc('day', b.order_date)::date 
)
select ord_date, daily_sum
	, avg(daily_sum) over (order by ord_date 
	                              rows between 2 preceding and current row) as ma_3days_01
	, case when  row_number() over (order by ord_date) <= 2 then null 
	             else avg(daily_sum) over (order by ord_date 
	                              rows between 2 preceding and current row) 
	             end as ma_3days_02
from temp_01;

-- 또는 아래와 같이 작성
with
temp_01 as (
select date_trunc('day', b.order_date)::date as ord_date, sum(amount) as daily_sum
from order_items a
	join orders b on a.order_id = b.order_id
group by date_trunc('day', b.order_date)::date 
), 
temp_02 as (
select ord_date, daily_sum
	, avg(daily_sum) over (order by ord_date 
	                              rows between 2 preceding and current row) as ma_3days_01
	, row_number() over (order by ord_date) as rn
from temp_01
)
select ord_date, daily_sum
	, ma_3days_01
	, case when rn <= 2 then null 
		   else ma_3days_01 end as ma_3days_02
from temp_02;
