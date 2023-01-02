-- 고객명, 주문id, 주문일자, 주문접수 직원명, 배송업체명을 구할것. 
select a.customer_id, a.contact_name, b.order_id, b.order_date
	, c.first_name||' '||c.last_name as employee_name, d.company_name as shipper_name  
from nw.customers a
	join nw.orders b on a.customer_id = b.customer_id
	join nw.employees c on b.employee_id = c.employee_id
	join nw.shippers d on b.ship_via = d.shipper_id
where a.city = 'Berlin';
