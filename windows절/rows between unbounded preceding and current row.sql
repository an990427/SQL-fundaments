/* rows between unbounded preceding and current row */
select *, sum(unit_price) over (order by unit_price) as unit_price_sum from products;

select *, sum(unit_price) over (order by unit_price rows between unbounded preceding and current row) as unit_price_sum from products;

select *, sum(unit_price) over (order by unit_price rows unbounded preceding) as unit_price_sum from products;

/* 중앙합, 중앙 평균(Centered average) */
select product_id, product_name, category_id, unit_price
	, sum(unit_price) over (partition by category_id order by unit_price rows between 1 preceding and 1 following) as unit_price_sum 
	, avg(unit_price) over (partition by category_id order by unit_price rows between 1 preceding and 1 following) as unit_price_avg 
from products;

/* rows between current row and unbounded following */
select product_id, product_name, category_id, unit_price
, sum(unit_price) over (partition by category_id order by unit_price rows between current row and unbounded following) as unit_price_sum 
from products;
