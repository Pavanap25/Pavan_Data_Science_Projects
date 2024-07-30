SELECT * FROM car_dekho.cars;

--- total cars

select count(*) from cars;

-- cars in 2023
select count(*) from cars where year = 2023;

-- how many cars in 2020, 2021, 2022

select count(*), year from cars;

-- cars in 2020, 2021, 2022

select count(*), year from cars where year in(2021, 2020, 2022) group by year;

--- diesel cars in 2020

select count(*), fuel as car_type, year from cars where year = 2020 and fuel= 'Diesel';

select count(*) as quantity, fuel, year from cars where fuel = 'Petrol' group by year;
-- Which year had more than 100 cars.
Select count(*), year from cars group by year having count(*)> 100;
-- we did not use where clause because where claused can not be used with aggregate functions.

-- All cars count between 2015 and 2023

select count(*) from cars where year between 2015 and 2023;
