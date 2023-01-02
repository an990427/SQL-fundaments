select a.contact_name, a.address, b.order_id, b.order_date, b.shipped_date, b.ship_address
from nw.customers a
	join nw.orders b on a.customer_id = b.customer_id
where a.contact_name = 'Antonio Moreno'
and b.order_date between to_date('19970101', 'yyyymmdd') and to_date('19971231', 'yyyymmdd');
