select *
from nw.customers a
	left join nw.orders b on a.customer_id = b.customer_id
where b.customer_id is null;
