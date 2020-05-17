-- Highest grossing store

select sto.store_id, sum(p.amount)
from
	store sto inner join staff sta
	on sto.store_id = sta.store_id
	inner join payment p
	on sta.staff_id = p.staff_id
group by
	sto.store_id
order by
	sum(amount) desc
fetch first 2 rows only;

-- Where are the stores
select 
from

group by

order by