-- isolate (or group) the transactions of each cardholder
select card_holder.holder_name,
round(cast(sum("transaction".amount) as numeric),2) as totalsum
from card_holder
inner join credit_card 
on card_holder.holder_id = credit_card.holder_id
inner join "transaction" 
on credit_card.card_number = "transaction".card_number
group by card_holder.holder_name
order by totalsum asc;

-- time period 7:00 a.m. to 9:00 a.m
select ch.holder_name card_holder, t.date, t.amount
from "transaction" t
join credit_card cc
on t.card_number = cc.card_number
join card_holder ch
on cc.holder_id = ch.holder_id
where extract(hour from t.date) between 7 and 8;

-- Find the top 10 by largest amount transactions 
select ch.holder_name card_holder, t.date, 
round(cast(t.amount as numeric),2) as amount
from "transaction" t
join credit_card cc
on t.card_number = cc.card_number
join card_holder ch
on cc.holder_id = ch.holder_id
where extract(hour from t.date) between 7 and 8
order by t.amount desc
limit 10;

-- top 5 merchants with under $2 transactions
select 'merchant_name', count (*) from transaction t
inner join merchant m
on m.merchant_id = t.merchant_id
where t.amount <= 2
group by merchant_name
having count(*) >= 5
order by count(*) desc;

-- all transactions under $2 between 7am - 9am
select count(*) from transaction --3500
where transaction.amount <= 2 --353
and extract(hour from transaction.date) between 7 and 8;

-- Create view for at risk merchants
create view at_risk_merchants as
select merchant_name, count(*) from transaction t
inner join merchant m
on m.merchant_id = t.merchant_id
where t.amount <= 2
group by merchant_name
having count(*) >= 5;

-- create view for most expensive purchases
create view most_expensive as
select ch.holder_name card_holder, t.date, 
round(cast(t.amount as numeric),2) as amount
from transaction t
join credit_card cc
on t.card_number = cc.card_number
join card_holder ch
on cc.holder_id = ch.holder_id
where extract(hour from t.date) between 7 and 8;

