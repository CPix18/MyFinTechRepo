-- sales by customer
select 
	c.last_name, sum(p.amount) as total_amount
from
	customer c inner join payment p
	on c.customer_id = p.customer_id
group by c.last_name
having sum(p.amount)>150
order by sum(p.amount)desc;
-- fetch first 10 rows only

-- sales by category
 select c.name, sum(p.amount) as total_sales
 from 
 	category c inner join film_category fc
	on c.category_id = fc.category_id
	inner join inventory i
	on fc.film_id = i.film_id
	inner join rental r 
	on i.inventory_id = r.inventory_id
	inner join payment p
	on r.rental_id = p.rental_id
group by c.name;
	
--highest grossing category
select c.name, sum(p.amount) as highest_grossing
from
	category c inner join film_category fc
	on c.category_id = fc.category_id
	inner join film f
	on fc.film_id = f.film_id
	inner join inventory i
	on f.film_id = i.film_id
	inner join rental r
	on i.inventory_id = r.inventory_id
	inner join payment p
	on r.rental_id = p.rental_id
group by c.name
order by sum(p.amount)desc;

--lowest grossing category?
select c.name, sum(p.amount) as lowest_grossing
from
	category c inner join film_category fc
	on c.category_id = fc.category_id
	inner join film f
	on fc.film_id = f.film_id
	inner join inventory i
	on f.film_id = i.film_id
	inner join rental r
	on i.inventory_id = r.inventory_id
	inner join payment p
	on r.rental_id = p.rental_id
group by c.name
order by sum(p.amount)asc;

-- Intro to CTEs
--CTE = Common Table Expression
--A Query that you can refer to later
-- inner, outer, cross joins

WITH 
total_dvds as ( 
	-- How many DVD's do we have in stock for each category
	select c.name,
		count(i.film_id) as total_dvds
	from
		category c
		inner join film_category fc
		on c.cateogry_id = fc.category_id
		inner join inventory i
		on f.film_id = i.film_id
	group by c.name
)
all_dvds as (
	select count(i.inventory_id) as total_dvds
	from inventory i
),
total_amounts_by_category as (
	select c.name, 
		sum(p.amount) as total_sales
	from
		category c 
		inner join film_category fc
		on c.category_id = fc.category_id
		inner join inventory i
		on fc.film_id = i.film_id
		inner join rental r
		on i.inventory_id = r.inventory_id
		inner join payment p
		on r.rental_id = p.rental_id
	group by c.name
),
all_amount as (
	select sum(p.amount) as total_sales
	from payment p
)
select dvds.name as category_name,
	cast(dvds.total_dvds as float) / cast(all_dvds.total_dvds as float) * 100.0 as percent_of_dvd_inventory,
	cats.total_sales / all_amount.total_sales * 100 as percent_of_total_sales
from total_dvds_by_category dvds cross join
	all_dvds inner join 
	total_amounts_by_category cats 
	on dvds.name = cats.name cross join
	all_amount
order by 2;

-- subquery
SELECT title
FROM film
WHERE film_id IN
  (
  SELECT film_id
  FROM inventory
  WHERE inventory_id IN
    (
    SELECT inventory_id
    FROM rental
    WHERE rental_id IN
      (
      SELECT rental_id
      FROM payment
      )
    )
  );

