-- sales by customer
select 
	c.last_name, sum(p.amount) as total_amount
from
	customer c inner join payment p
	on c.customer_id = p.customer_id
group by c.last_name
having sum(p.amount)>150
order by sum(p.amount)desc
-- fetch first 10 rows only