--Finding dept whose  avg salary per employee is less than 10000

select dept_name, avg(salary) as avg_sal
from practise.employee e
    inner join practise.salary s
on e.emp_id = s.emp_id
group by dept_name
having avg(salary) < 10000

--Getting the top 3 authors who sold most number of books

select author_name from
(select author_name, sum(copies_sold),
       dense_rank() over(order by sum(copies_sold) desc) as rank
from practise.authors a
inner join practise.books b
on a.book_name = b.book_name
group by author_name) as TB1
where rank <= 3

/*
create table postgres.practise.authors (author_name text, book_name text)

create table postgres.practise.books (book_name text, copies_sold int)




/*
create table postgres.practise.employee (dept_name text, emp_id int, emp_name text);
create table postgres.practise.salary (salary int, emp_id int, emp_name text);

insert into practise.employee values ( 'Sales','11','AA' )
insert into practise.employee values ( 'HR','12','AB' )
insert into practise.employee values ( 'Marketing','13','AC' )
insert into practise.employee values ( 'Finance','14','AD' )
insert into practise.employee values ( 'Sales','15','AE' )
insert into practise.employee values ( 'HR','16','AF' )
insert into practise.employee values ( 'Marketing','17','AG' )
insert into practise.employee values ( 'Finance','18','AH' )
insert into practise.employee values ( 'Sales','19','BA' )
insert into practise.employee values ( 'HR','20','BB' )
insert into practise.employee values ( 'Marketing','21','BC' )
insert into practise.employee values ( 'Finance','22','BD' )
insert into practise.employee values ( 'Sales','23','BE' )
insert into practise.employee values ( 'HR','24','BF' )
insert into practise.employee values ( 'Marketing','25','BG' )
insert into practise.employee values ( 'Finance','26','BH' )
insert into practise.employee values ( 'Sales','27','CA' )
insert into practise.employee values ( 'HR','28','CB' )
insert into practise.employee values ( 'Marketing','29','CC' )
insert into practise.employee values ( 'Finance','30','CD' )
insert into practise.employee values ( 'Sales','31','CE' )
insert into practise.employee values ( 'HR','32','CF' )
insert into practise.employee values ( 'Marketing','33','CG' )
insert into practise.employee values ( 'Finance','34','CH' )
insert into practise.employee values ( 'Sales','35','DA' )
insert into practise.employee values ( 'HR','36','DB' )
insert into practise.employee values ( 'Marketing','37','DC' )
insert into practise.employee values ( 'Finance','38','DD' )
insert into practise.employee values ( 'Sales','39','DE' )
insert into practise.employee values ( 'HR','40','DF' )
insert into practise.employee values ( 'Marketing','41','DG' )
insert into practise.employee values ( 'Finance','42','DH' )
insert into practise.employee values ( 'Sales','43','EA' )
insert into practise.employee values ( 'HR','44','EB' )
insert into practise.employee values ( 'Marketing','45','EC' )
insert into practise.employee values ( 'Finance','46','ED' )
insert into practise.employee values ( 'Sales','47','EE' )
insert into practise.employee values ( 'HR','48','EF' )
insert into practise.employee values ( 'Marketing','49','EG' )
insert into practise.employee values ( 'Finance','50','EH' )

insert into practise.salary values ( '1100','11','AA' )
insert into practise.salary values ( '100','12','AB' )
insert into practise.salary values ( '126','13','AC' )
insert into practise.salary values ( '120','14','AD' )
insert into practise.salary values ( '350','15','AE' )
insert into practise.salary values ( '1000','16','AF' )
insert into practise.salary values ( '250','17','AG' )
insert into practise.salary values ( '200','18','AH' )
insert into practise.salary values ( '100','19','BA' )
insert into practise.salary values ( '200','20','BB' )
insert into practise.salary values ( '300','21','BC' )
insert into practise.salary values ( '400','22','BD' )
insert into practise.salary values ( '500','23','BE' )
insert into practise.salary values ( '600','24','BF' )
insert into practise.salary values ( '700','25','BG' )
insert into practise.salary values ( '800','26','BH' )
insert into practise.salary values ( '900','27','CA' )
insert into practise.salary values ( '1000','28','CB' )
insert into practise.salary values ( '1100','29','CC' )
insert into practise.salary values ( '1200','30','CD' )
insert into practise.salary values ( '1300','31','CE' )
insert into practise.salary values ( '1400','32','CF' )
insert into practise.salary values ( '1500','33','CG' )
insert into practise.salary values ( '10000','34','CH' )
insert into practise.salary values ( '20000','35','DA' )
insert into practise.salary values ( '20000','36','DB' )
insert into practise.salary values ( '40000','37','DC' )
insert into practise.salary values ( '10000','38','DD' )
insert into practise.salary values ( '50000','39','DE' )
insert into practise.salary values ( '1000','40','DF' )
insert into practise.salary values ( '2000','41','DG' )
insert into practise.salary values ( '20000','42','DH' )
insert into practise.salary values ( '5000','43','EA' )
insert into practise.salary values ( '7000','44','EB' )
insert into practise.salary values ( '90000','45','EC' )
insert into practise.salary values ( '10000','46','ED' )
insert into practise.salary values ( '100','47','EE' )
insert into practise.salary values ( '1000','48','EF' )
insert into practise.salary values ( '1220','49','EG' )
insert into practise.salary values ( '10000','50','EH' )
*/

insert into practise.authors values ( 'Author  1','Book 1' )
insert into practise.authors values ( 'Author 1','Book 2' )
insert into practise.authors values ( 'Author 1','Book 3' )
insert into practise.authors values ( 'Author 2','Book 4' )
insert into practise.authors values ( 'Author 2','Book 5' )
insert into practise.authors values ( 'Author 3','Book 6' )
insert into practise.authors values ( 'Author 3','Book 7' )
insert into practise.authors values ( 'Author 3','Book 8' )
insert into practise.authors values ( 'Author 3','Book 9' )
insert into practise.authors values ( 'Author 4','Book 10' )
insert into practise.authors values ( 'Author 5','Book 11' )
insert into practise.authors values ( 'Author 5','Book 12' )
insert into practise.authors values ( 'Author 6','Book 13' )
insert into practise.authors values ( 'Author 7','Book 14' )
insert into practise.authors values ( 'Author 7','Book 15' )
insert into practise.authors values ( 'Author 7','Book 16' )
insert into practise.authors values ( 'Author 7','Book 17' )

insert into practise.books values ( 'Book 1','100' )
insert into practise.books values ( 'Book 2','200' )
insert into practise.books values ( 'Book 3','12' )
insert into practise.books values ( 'Book 4','100' )
insert into practise.books values ( 'Book 5','40' )
insert into practise.books values ( 'Book 6','1222' )
insert into practise.books values ( 'Book 7','1555' )
insert into practise.books values ( 'Book 8','1998' )
insert into practise.books values ( 'Book 9','4000' )
insert into practise.books values ( 'Book 10','400' )
insert into practise.books values ( 'Book 11','5000' )
insert into practise.books values ( 'Book 12','100' )
insert into practise.books values ( 'Book 13','411' )
insert into practise.books values ( 'Book 14','8776' )
insert into practise.books values ( 'Book 15','1000' )
insert into practise.books values ( 'Book 16','500' )
insert into practise.books values ( 'Book 17','200' )

