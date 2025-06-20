use Uber;
show tables;

create table passenger (passenger_id int primary key,passenger_name varchar (25) not null,signup_date varchar(100) not null,total_rides int not null,total_spent
 float not null,rating float not null );

 create table driver ( driver_id int primary key ,driver_name varchar(25) not null,join_date varchar(50) not null,rating float not null,
 total_rides int not null,earnings float not null);

create table ride (ride_id int primary key ,driver_id int ,passenger_id int,pickup_location varchar(100)not null,dropoff_location varchar(100) not null,
ride_distance float not null,ride_duration int not null,ride_timestamp varchar(50) not null,fare_amount float not null,payment_method varchar (20));

drop table passenger;
drop table driver;
drop table ride;


select version();


select *from passenger;
select *from driver;
select *from ride;
insert into passenger (passenger_id,passenger_name,signup_date,total_rides,total_spent,rating) values
(201,"Nitya Varma",2022/10/16,12,200.11,3.54);

insert into passenger (passenger_id,passenger_name,signup_date,total_rides,total_spent,rating) values
(201,"Nitya Varma",2022/10/16,12,200.11,3.54);

CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(25) NOT NULL,
    signup_date DATE NOT NULL,
    total_rides INT NOT NULL,
    total_spent FLOAT NOT NULL,
    rating FLOAT NOT NULL
);
 delete table passenger;

#1.           What are & how many unique pickup locations are there in the dataset?

# it gives unique pl and there count of rides from that
 select  pickup_location,count(*) as Unique_PL from ride group by pickup_location;

 #seperate one queries
select distinct pickup_location from ride;
select count(distinct pickup_location)from ride;

# this query merege above 2 querirs in this 
select distinct pickup_location,(
select count(distinct pickup_location )from ride) AS unique_pl
from ride;

#2.           What is the total number of rides in the dataset?
select count(ride_timestamp) from ride;

select count(*) from ride;

#3.           Calculate the average ride duration.

select avg(ride_duration) from ride;

#4.           List the top 5 drivers based on their total earning.

select driver_name,earnings from driver order by earnings desc limit 5;

SELECT driver_id, SUM(earnings) AS total_earnings 
FROM driver
GROUP BY driver_id 
ORDER BY total_earnings DESC LIMIT 5;

#5.           Calculate the total number of rides for each payment method.
select distinct(payment_method),
(select count(*)from ride) as total_ride
from ride;

select payment_method,count(*) as ride_count
from ride 
group by payment_method ;

#6.           Retrieve rides with a fare amount greater than 20.
select *from ride where fare_amount>20;

#7.           Identify the most common pickup location.
select pickup_location,count(*) as repeat_c
from ride
group by pickup_location 
order by repeat_c limit 1;

#8.          Calculate the average fare amount.
select avg(fare_amount)
from ride; 

select fare_amount,count(*) as fareamt
from ride 
group by fare_amount;

#9.           List the top 10 drivers with the highest average ratings.
select  driver_id,driver_name, avg(rating) as avg_rating
from driver 
group by driver_id 
order by avg_rating desc limit  10;

#10.      Calculate the total earnings for all drivers.
select sum(earnings)from driver ;


#11.      How many rides were paid using the "Cash" payment method?
select count(payment_method) from ride where payment_method ="cash";

#12.      Calculate the number of rides & average ride distance for rides originating from the 'Dhanbad' pickup location.
select pickup_location,count(*),avg(ride_distance)
from ride where pickup_location ="Dhanbad";

#13.      Retrieve rides with a ride duration less than 10 minutes.
select * from ride where ride_duration < 10;

#14.      List the passengers who have taken the most number of rides.

select passenger_id,count(*)  as cnt from ride
group by passenger_id 
order by cnt desc limit 1;


#15.      Calculate the total number of rides for each driver in descending order.

select total_rides,count(*)  as cnt_dri_ride 
from driver 
group by total_rides 
order by cnt_dri_ride desc;

#16.      Identify the payment methods used by passengers who took rides from the 'Gandhinagar' pickup location.

select payment_method ,pickup_location from ride where pickup_location ="Gandhinagar";


select payment_method ,pickup_location ,count(*) as cnt_pick from ride where pickup_location ="Gandhinagar"
group by payment_method ;

#solution
SELECT DISTINCT payment_method 
FROM ride
WHERE pickup_location = 'Gandhinagar';

#17.      Calculate the average fare amount for rides with a ride distance greater than 10.

select avg(fare_amount) as avg_rides from ride where ride_distance > 10;


#18.      List the passengers who have taken rides from at least 5 different pickup locations.

select * from ride where pickup_location=

SELECT passenger_id
FROM ride
GROUP BY passenger_id
HAVING COUNT(DISTINCT pickup_location) >= 5;



#19.      Calculate the average fare amount for rides taken by passengers with ratings above 4.


select passenger_id ,avg(fare_amount) as avgfare_amt from ride where ratings > 4 group by passenger_id;


SELECT passenger_id, AVG(fare_amount) AS avgfare_amt
FROM ride
WHERE passenger_rating > 4
GROUP BY passenger_id;


SELECT r.passenger_id, AVG(r.fare_amount) AS avgfare_amt
FROM ride r
JOIN passenger p ON r.passenger_id = p.passenger_id
WHERE p.rating > 4
GROUP BY r.passenger_id;

select r.passenger_id,avg(r.fare_amount) as avgfare_amt
from ride r
join passenger p on r.passenger_id =p.passenger_id 
where p.rating >4
group by r.passenger_id ;

#x20.      Retrieve rides where both pickup and dropoff locations are the same.

select * from ride where pickup_location=dropoff_location ;


# intermediate level 

#1.           List the passengers who have taken rides from at least 300 different pickup locations.

select passenger_id,count(distinct pickup_location) as diff_pickuplocation
from ride 
group by passenger_id 
having diff_pickuplocation >=300;

#2.           Calculate the average fare amount for rides taken on weekdays.

select avg(fare_amount)
from ride 
where dayofweek(STR_TO_DATE(ride_timestamp, '%m/%d/%Y %H:%i'))>5;

#3.           Identify the drivers who have taken rides with distances greater than 19.

select r.driver_id from ride r
join driver d on r.driver_id=d.driver_id
where ride_distance >10
group by r.driver_id;

#4.           Calculate the total earnings for drivers who have completed more than 100 rides.

select r.driver_id,count(*) as ttotal_rides 
from ride r 
join driver d on r.driver_id =d.driver_id 
where total_rides >100
group by r.driver_id;

#5.           Retrieve rides where the fare amount is less than the average fare amount.

select ride_id,fare_amount from ride where fare_amount < (select avg(fare_amount) from ride);

#6.           Calculate the average rating of drivers who have driven rides with both 'Credit Card' and 'Cash' payment methods.


# both query have the difference in this 
#1 query chechk  atleast any of condition is true then working and 

select d.driver_id,avg(d.rating)
from driver d 
join ride r on d.driver_id =r.driver_id 
where payment_method in ('Cash','Credit Card')
group by d.driver_id ;

#  2 check all the condition is true custmoer make payment from both cah and credit

select driver_id,avg(rating) as avg_rating
from driver
where driver_id in (select driver_id from ride where payment_method in('credit card','cash') group by driver_id having count(distinct payment_method)=2)
group by driver_id ;

#7.           List the top 3 passengers with the highest total spending.

select max(total_spent) where (select max(total_spent) from passenger) from passenger ;


select  passenger_id, max(total_spent)
from passenger 
group by passenger_id 
order by passenger_id limit 3;

select p.passenger_id,p.passenger_name,sum(r.fare_amount) as total_spending
from passenger p 
inner join ride r on p.passenger_id = r.passenger_id
group by p.passenger_id,p.passenger_name 
order by total_spending desc limit 3;

SELECT p.passenger_id, p.passenger_name, SUM(r.fare_amount) AS total_spending
FROM passenger p
JOIN Ride r ON p.passenger_id = r.passenger_id
GROUP BY p.passenger_id, p.passenger_name
ORDER BY total_spending DESC
LIMIT 3;

#8.           Calculate the average fare amount for rides taken during different months of the year.

select month(STR_TO_DATE (ride_timestamp, '%m/%d/%Y %H:%i')) as month_of_year ,avg(fare_amount)as avg_fm
from ride r 
group by month_of_year;

#9.           Identify the most common pair of pickup and dropoff locations	

select pickup_location,dropoff_location,count(*) as common_loc
from ride r 
group by pickup_location ,dropoff_location 
order by common_loc desc limit 1;


#10.      Calculate the total earnings for each driver and order them by earnings in descending order.

select driver_id,driver_name,sum(earnings) as sum_of_earning
from driver d 
group by driver_id ,driver_name 
order by sum_of_earning desc;

#11.      List the passengers who have taken rides on their signup date.

select * from driver where total_rides =date(STR_TO_DATE(join_date,'%m/%d/%Y %H:%i'));

select p.passenger_id,p.passenger_name
from passenger p 
join ride r on p.passenger_id =r.passenger_id 
where DATE(STR_TO_DATE(p.signup_date, '%m/%d/%Y %H:%i'))=DATE(STR_TO_DATE(r.ride_timestamp, '%m/%d/%Y %H:%i'));

#12.      Calculate the average earnings for each driver and order them by earnings in descending order.

select driver_id,driver_name,avg(earnings)as total_earnings
from driver d 
group by driver_id ,driver_name 
order by total_earnings desc;

#13.      Retrieve rides with distances less than the average ride distance.

select ride_id,avg(ride_distance)
from ride r where ride_distance < (select  avg(ride_distance) from ride)
group by ride_id;

#14.      List the drivers who have completed the least number of rides.

select driver_id,driver_name,count(driver_id) as Total_ride
from driver d 
group by driver_id ,driver_name 
order by total_ride;

SELECT driver_name,  COUNT(driver_id) AS ride_count
FROM driver 
GROUP BY driver_id
ORDER BY ride_count ASC;

#15.      Calculate the average fare amount for rides taken by passengers who have taken at least 20 rides.

select r.passenger_id,avg(r.fare_amount) as avg_fm
from ride r where p.total_ride >= (select count(total_ride)from passenger p )
join passenger p on r.passenger_id =p.passenger_id 
group by r.passenger_id ;

select avg(fare_amount)
from ride r where passenger_id in (select passenger_id from ride group by passenger_id having count(*) >= 20);

SELECT AVG(fare_amount)
FROM ride
WHERE passenger_id IN (SELECT passenger_id FROM ride GROUP BY passenger_id HAVING COUNT(*) >= 20);


#16.      Identify the pickup location with the highest average fare amount.

select r.pickup_location,avg(r.fare_amount) as avg_fm
from ride r 
group by r.pickup_location
order by avg_fm desc limit 1;

SELECT pickup_location, AVG(fare_amount) AS avg_fare
FROM ride 
GROUP BY pickup_location
ORDER BY avg_fare desc
LIMIT 1;

#17.      Calculate the average rating of drivers who completed at least 100 rides.

select avg(rating)
from driver where driver_id in(select driver_id from ride group by driver_id having count(*) > 100);

select dc.driver_id, avg(rating) as Avg_Rating
from driver dc inner join ride rdc
on dc.driver_id = rdc.driver_id 
group by dc.driver_id 
having avg(rating)<100;

#18.      List the passengers who have taken rides from at least 5 different pickup locations.

select passenger_id,count(distinct pickup_location) as diff_pu from ride r 
group by passenger_id 
having diff_pu >= 5;

#19.      Calculate the average fare amount for rides taken by passengers with ratings above 4.


select r.passenger_id ,p.rating ,avg(fare_amount ) as avg_fm from ride r 
join passenger p on r.passenger_id =p.passenger_id 
group by r.passenger_id ,p.rating 
having p.rating >4;

select avg(fare_amount) from ride 
where passenger_id in (select passenger_id from passenger p where rating > 4);

SELECT AVG(fare_amount) FROM ride WHERE passenger_id in
(SELECT passenger_id FROM passenger WHERE rating > 4);

#20.      Retrieve rides with the shortest ride duration in each pickup location.
use uber;
select ride_id,distinct(pickup_location) from ride where ride_duration in(select min(ride_duration ) from ride);
select * from ride where (pickup_location,ride_duration) in(select distinct (pickup_location),min(ride_duration) from ride group by pickup_location,ride_duration);
 #this one id real query of this question  
select  * from ride r1 join 
(select pickup_location ,min(ride_duration ) as min_duration from ride r2 group by pickup_location )
r2 on r1.pickup_location=r2.pickup_location and r1.ride_duration =r2.min_duration ;


################  ADVACE LEVEL ######################

#1.           List the drivers who have driven rides in all pickup locations.

select * from driver ;
select * from ride r ;

select * from driver d
join ride r on d.driver_id =r.driver_id 
where pickup_location= distinct (pickup_location);

select * from driver d join (
select distinct (pickup_location),count(driver_id) as total_driver from ride r group by pickup_location)
r on d.pickup_location=r.pickup_location and d.driver_id =r.total_driver;

select driver_id from driver d where driver_id not in
(select distinct driver_id from ride where pickup_location not in
(select distinct pickup_location from ride ));

select distinct driver_id,pickup_location from ride where pickup_location in (select distinct pickup_location from ride);

#2.           Calculate the average fare amount for rides taken by passengers who have spent more than 300 in total.
select passenger_id,passenger_name,avg(r.fare_amount) from passenger p ;
select * from passenger p join ride r on p.passenger_id =r.passenger_id 
where p.total_spent >300 ;

select avg(fare_amount) from ride where
passenger_id in (select passenger_id from passenger where total_spent >300);


SELECT AVG(fare_amount)
FROM ride 
WHERE passenger_id IN (SELECT passenger_id FROM passenger WHERE total_spent > 300);



#3.           List the bottom 5 drivers based on their average earnings.0

select driver_id,avg(earnings) as avg_earnings from driver group by driver_id  order by avg_earnings asc limit 5;

#4.           Calculate the sum fare amount for rides taken by passengers who have taken rides in different payment methods.
select sum(fare_amount) as sum_fm from ride where passenger_id in
(select passenger_id from passenger group by passenger_id )
having count(distinct  payment_method) >1;



#5.           Retrieve rides where the fare amount is significantly above the average fare amount.

select * from ride where fare_amount >(select avg(fare_amount) as avg_fm from ride );

#6.           List the drivers who have completed rides on the same day they joined.

select * from driver d ;

select d.driver_id,d.driver_name from driver d 
join ride r on d.driver_id=r.driver_id
where DATE(STR_TO_DATE(d.join_date, "%m/%d/%Y %H:%i"))=DATE(STR_TO_DATE(r.ride_timestamp,"%m/%d/%Y %H:%i"));

#7.           Calculate the average fare amount for rides taken by passengers who have taken rides in different payment methods.
select avg(fare_amount) as avg_fm from ride 
where passenger_id in (select passenger_id from ride group by passenger_id having count( distinct payment_method)>1);

#8.           Identify the pickup location with the highest percentage increase in average fare amount compared to the overall average fare.

select pickup_location ,avg(fare_amount) as avg_fm,
( avg(fare_amount )- (select avg(fare_amount)from ride )) * 100.0/ (select avg(fare_amount )from ride) as percentage_increase
from ride
GROUP BY pickup_location
ORDER BY percentage_increase desc
LIMIT 1;

SELECT pickup_location, AVG(fare_amount) AS avg_fare,
       (AVG(fare_amount) - (SELECT AVG(fare_amount) from ride)) * 100.0 / (SELECT AVG(fare_amount) FROM ride) AS percentage_increase
FROM ride 
GROUP BY pickup_location
ORDER BY percentage_increase desc
LIMIT 1;


# 9.           Retrieve rides where the dropoff location is the same as the pickup location.
select * from ride where pickup_location =dropoff_location ;

#10.           Calculate the average rating of drivers who have driven rides with various pickup locations.

select * from driver;



SELECT AVG(rating) FROM driver WHERE driver_id IN (SELECT DISTINCT driver_id FROM ride 
    GROUP BY driver_id
    HAVING COUNT(DISTINCT pickup_location) > 1
);


