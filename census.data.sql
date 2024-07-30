-- number of rows into our dataset

select count(*) from census.dataset1;
select count(*) from census.dataset2;
-- Data set for Bihar and Jharkhand
Select* from dataset1 where state in ('bihar','Jharkhand');

-- poulation of india

Select SUM(Population) population from dataset2;
-- avg growth 

select avg(growth) from dataset1;
select avg(growth),state from dataset1 group by state;
select round(avg(sex_ratio),0) ratio , state from dataset1 group by state having round(avg(sex_ratio),0)< 980 order by ratio asc limit 3 ;
--- Top 3 state showing highest Growth ratio

Select growth, state from dataset1 order by growth desc limit 3;
-- top and bottom 3 states in literacy rate

Select* from
(select state, round(avg(literacy),0) as l from dataset1 group by state order by l desc limit 3) a
union
select* from
(select state, round(avg(literacy),0) as li from dataset1 group by state order by li asc limit 3) b ;

-- states starting with Lette a
Select distinct state from dataset1 where state like 'a%';