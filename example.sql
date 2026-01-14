--- INNER JOIN examples
SELECT
	o.order_id,
	o.order_date,
	o.ship_country,
	e.last_name
FROM orders o
JOIN employees e
--	ON o.employee_id = e.employee_id
	USING(employee_id)
ORDER BY o.order_date DESC
LIMIT 5

SELECT
	p.product_id,
	p.product_name,
	c.category_name
FROM products p
INNER JOIN categories c
--	ON p.category_id = c.category_id
	USING(category_id)
LIMIT 5

SELECT
	o.order_id,
	o.customer_id,
	e.last_name,
	s.company_name
FROM orders o
INNER JOIN shippers s
	ON o.ship_via = s.shipper_id
INNER JOIN employees e
	USING(employee_id)
WHERE e.last_name = 'King' AND s.company_name = 'Federal Shipping'
ORDER BY o.order_id ASC
LIMIT 7