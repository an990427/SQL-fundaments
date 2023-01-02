select a.category_id, a.category_name, b.product_id, b.product_name, c.supplier_id, c.company_name 
from nw.categories a
	join nw.products b on a.category_id = b.category_id
	join nw.suppliers c on b.supplier_id = c.supplier_id
where category_name = 'Beverages';
