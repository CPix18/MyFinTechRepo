create table stock_data(
	stock_data_id serial not null primary key,
	stock_ticker varchar(10) not null,
	close_date date not null,
	open float,
	high float,
	low float,
	close float,
	volume bigint
);

Create unique index 
close_data on stock_data (stock_ticker, close_date);

alter table stock_data add constraint 
	close_data unique using index close_data;
	
select * from stock_data;

-- which stocks do i have data for
select distinct stock_ticker
from stock_data
order by stock_ticker;

-- how long do i have data for

select stock_ticker, min(close_date) as start_date, max(close_date) as end_date
from stock_data
group by stock_ticker;

