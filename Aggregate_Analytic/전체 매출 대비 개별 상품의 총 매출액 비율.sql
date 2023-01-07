-- product_id 총 매출액을 구하고, 전체 매출 대비 개별 상품의 총 매출액 비율을 소수점2자리로 구한 뒤 매출액 비율 내림차순으로 정렬
with 
temp_01 as (
	select product_id, sum(amount) as sum_by_prod
	from order_items
	group by product_id
)
select product_id, sum_by_prod
	, sum(sum_by_prod) over () total_sum
	, round(1.0 * sum_by_prod/sum(sum_by_prod) over (), 2) as sum_ratio
from temp_01
order by 4 desc;

-- 직원별 개별 상품 매출액, 직원별 가장 높은 상품 매출액을 구하고, 직원별로 가장 높은 매출을 올리는 상품의 매출 금액 대비 개별 상품 매출 비율 구하기
with 
temp_01 as (
	select b.employee_id, a.product_id, sum(amount) as sum_by_emp_prod
	from order_items a
		join orders b on a.order_id = b.order_id
	group by b.employee_id, a.product_id
)
select employee_id, product_id, sum_by_emp_prod
	, max(sum_by_emp_prod) over (partition by employee_id) as sum_by_emp
	, sum_by_emp_prod/max(sum_by_emp_prod) over (partition by employee_id) as sum_ratio
from temp_01
order by 1, 5 desc;
