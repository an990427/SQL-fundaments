with
temp_01 as (
select c.category_id, date_trunc('day', b.order_date) as ord_date, sum(a.amount) sum_by_daily_cat
from order_items a
	join orders b on a.order_id = b.order_id 
	join products c on a.product_id = c.product_id 
group by c.category_id, date_trunc('day', b.order_date) 
order by 1, 2
)
select *
	, sum(sum_by_daily_cat) over (partition by category_id order by ord_date 
	                              rows between 2 preceding and current row)
	, sum(sum_by_daily_cat) over (partition by category_id order by ord_date 
	                              range between interval '2' day preceding and current row)
from temp_01;
