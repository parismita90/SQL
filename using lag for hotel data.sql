--create schema practise

/*CREATE TABLE postgres.practise.hotel_transfers
    (guest_id TEXT,
     checkin_id TEXT,
     checkin_datetime TIMESTAMP,
     checkout_datetime TIMESTAMP,
     room char(1))*/


select * from practise.hotel_transfers

/*insert into practise.hotel_transfers values ( 'a573443f-d5c4','954aac7d-47b2','21-05-2014 09:32','21-05-2014 12:05','A' )
insert into practise.hotel_transfers values ( 'j13cf7db-810f','od4e346f-f1e7','15-12-2018 18:34','18-12-2018 14:36','C' )
insert into practise.hotel_transfers values ( 'a573443f-d5c4','954aac7d-47b2','21-05-2014 12:12','01-06-2014 21:09','B' )
insert into practise.hotel_transfers values ( 'b1d0cac0-d50d','e3509710-5fed','05-09-2011 21:48','05-09-2011 23:02','A' )
insert into practise.hotel_transfers values ( 'a573443f-d5c4','237e9877-e79b','05-06-2014 11:05','06-06-2014 08:52','A' )
insert into practise.hotel_transfers values ( 'a573443f-d5c4','954aac7d-47b2','21-05-2014 12:20','01-06-2014 21:09','A' )
*/


--#1 Write a SQL query to find the room(s) with the highest average stay time (in days)
select room from
(select room, avg(checkout_datetime - checkin_datetime) as stay
from practise.hotel_transfers
group by room) as A
where stay = (select max(stay) from
(select room, avg(checkout_datetime - checkin_datetime) as stay
from practise.hotel_transfers
group by room) as B)


--#2 4.	Write a SQL query to find the number of guests who left room “A” for room “B” then went back to room “A” in a single checkin within 24 hours.

select count(distinct guest_id)
FROM    (select guest_id, checkin_id, room,
       lag(room,3) over(partition by guest_id order by checkout_datetime desc) as prev
from practise.hotel_transfers) as A
where room = prev





