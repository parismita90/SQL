--Top 3 products in terms of sales
select tb2.prod_key, prod_name, sales from
(select prod_key, sales, dense_rank() over(order by sales desc) as rnk
from (select prod_key, sum(sales_amt) as sales
from practise.sales
group by prod_key) as tb1 ) as tb2
inner join practise.product
on practise.product.prod_key = tb2.prod_key
where rnk <= 3
order by rnk


--Top 3 products in terms of sales by store
select prod_name, store_name, sales from
(select prod_key, sales, store_key, dense_rank() over(partition by store_key order by sales desc) as rnk
from (select prod_key, store_key, sum(sales_amt) as sales
from practise.sales
group by prod_key, store_key) as tb1 ) as tb2
inner join practise.product
on practise.product.prod_key = tb2.prod_key
inner join practise.store
on practise.store.store_key = tb2.store_key
where rnk <= 3
order by tb2.store_key, sales desc


--Cumulative sales by store for year 2018!! The 'unbounded preceding' is what makes the cumulation from the above row
select date, store_key, sales_amt, sum(sales_amt) over(partition by store_key order by date rows unbounded preceding)
from practise.sales
where date between '2018-01-01' and '2018-12-31'


--Cumulative sales % by store for year 2018
select date, store_key, sales_amt,
    sum(sales_amt) over(partition by store_key order by date rows unbounded preceding) as cum_sales,
sum(sales_amt) over(partition by store_key) as grand_tot,
       sum(sales_amt) over(partition by store_key order by date rows unbounded preceding)::float/
sum(sales_amt) over(partition by store_key) as cum_perct
from practise.sales
where date between '2018-01-01' and '2018-12-31'


--3 month moving average of store wise sales
select date, store_key, sales_amt,
       avg(sales_amt) over(partition by store_key order by date rows between 2 preceding and current row) as MMA3
FROM practise.sales


create table postgres.practise.sales (
    date date,
    prod_key int,
    store_key int,
    sales_amt float,
    sales_qty int
);

create table postgres.practise.product (
    prod_key int,
    prod_name text
);

create table postgres.practise.store (
    store_key int,
    store_name text
);



insert into practise.SALES values ( '2018-06-01','1','2','100','2' )
insert into practise.SALES values ( '2018-07-01','4','2','123.50','2' )
insert into practise.SALES values ( '2018-08-01','2','3','122','1' )
insert into practise.SALES values ( '2018-09-01','2','1','143','5' )
insert into practise.SALES values ( '2018-10-01','4','5','1000','5' )
insert into practise.SALES values ( '2018-11-01','5','4','250','10' )
insert into practise.SALES values ( '2018-12-01','4','3','1100','15' )
insert into practise.SALES values ( '2019-06-01','1','7','100','1' )
insert into practise.SALES values ( '2019-07-01','2','2','126','3' )
insert into practise.SALES values ( '2019-08-01','8','1','120','4' )
insert into practise.SALES values ( '2019-09-01','2','3','350','5' )
insert into practise.SALES values ( '2019-10-01','1','1','1000','4' )
insert into practise.SALES values ( '2019-11-01','2','2','250','1' )
insert into practise.SALES values ( '2019-12-01','4','1','200','1' )
insert into practise.SALES values ( '2020-10-01','1','1','100','4' )
insert into practise.SALES values ( '2020-11-01','2','1','200','1' )
insert into practise.SALES values ( '2020-12-01','4','1','300','1' )
insert into practise.SALES values ( '2020-10-01','1','2','400','3' )
insert into practise.SALES values ( '2020-11-01','2','2','500','4' )
insert into practise.SALES values ( '2020-12-01','4','2','600','2' )
insert into practise.SALES values ( '2020-10-01','1','3','700','6' )
insert into practise.SALES values ( '2020-11-01','2','3','800','4' )
insert into practise.SALES values ( '2020-12-01','4','3','900','2' )
insert into practise.SALES values ( '2020-10-01','1','4','1000','1' )
insert into practise.SALES values ( '2020-11-01','2','4','1100','6' )
insert into practise.SALES values ( '2020-12-01','4','4','1200','2' )
insert into practise.SALES values ( '2020-10-01','1','5','1300','1' )
insert into practise.SALES values ( '2020-11-01','2','5','1400','3' )
insert into practise.SALES values ( '2020-12-01','4','5','1500','4' )


insert into practise.product values ( '1','Product 1' )
insert into practise.product values ( '2','Product 2' )
insert into practise.product values ( '3','Product 3' )
insert into practise.product values ( '4','Product 4' )
insert into practise.product values ( '5','Product 5' )


insert into practise.store values ( '1','Store 1' )
insert into practise.store values ( '2','Store 2' )
insert into practise.store values ( '3','Store 3' )
insert into practise.store values ( '4','Store 4' )
insert into practise.store values ( '5','Store 5' )


