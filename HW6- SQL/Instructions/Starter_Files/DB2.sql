-- select merchant_name, count(*) from transaction t
-- inner join merchant m
-- on m.merchant_id = t.merchant_id
-- where t.amount <= 2
-- group by merchant_name 
-- order by count(*);

-- select card_number, count(*) from transaction t
-- where t.amount <= 2
-- group by card_number 
-- order by count(*) desc;

-- select count(*) from transaction --3500
-- where transaction.amount <= 2; --353

-- select count(*) from transaction --3500
-- where transaction.amount <= 2 --353
-- and extract(hour from transaction.date) between 7 and 8;

select merchant_name, count(*) from transaction t
inner join merchant m
on m.merchant_id = t.merchant_id
where t.amount <= 2
group by merchant_name
having count(*) >= 5
order by count(*) desc;