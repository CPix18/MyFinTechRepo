create table myfintech.Sample(
	SampleId serial primary key,
	FirstName varchar(100),
	LastName varchar(100) not null,
	Birthdate date,
	Address varchar(200),
	City varchar(100),
	State char(2),
	Zip char(5)
);

insert into myfintech.sample (firstname, lastname, city, state)
values ('Collin', 'Pixley', 'Nashville', 'TN');

select * from myfintech.sample;