with 
temp_01 as (
select to_char(b.order_date, 'yyyy') as year
	, to_char(b.order_date, 'mm') as month
	, to_char(b.order_date, 'dd') as day
	, sum(a.amount) as sum_amount
from nw.order_items a
	join nw.orders b on a.order_id = b.order_id
group by rollup(to_char(b.order_date, 'yyyy'), to_char(b.order_date, 'mm'), to_char(b.order_date, 'dd'))
)
select case when year is null then '총매출' else year end as year
	, case when year is null then null
		else case when month is null then '년 총매출' else month end
	  end as month
	, case when year is null or month is null then null
		else case when day is null then '월 총매출' else day end
	  end as day
	, sum_amount
from temp_01
order by year, month, day;
