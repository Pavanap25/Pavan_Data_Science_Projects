-- 1.who is the senior most employee based on job title ?

select first_name, last_name, title, levels from 
employee order by levels desc limit 1;

--2. which countries have the most invoices?

select * from invoice;

select count(*),  billing_country from invoice
group by billing_country order by billing_country desc limit 1;

-- 3.what are the top 3 values of total invoices?

select total from invoice order by total desc limit 3;

-- 4.which city has the best customers? We would like to throw a 
promotional Music Festival in the city we made the most money. Write 
a query that returns one city that has the highest sum of invoice totals. 
Return both city name & sum of all invoice totals.
select * from invoice;

SELECT SUM(TOTAL) AS P , BILLING_CITY FROM INVOICE
GROUP BY BILLING_CITY ORDER BY P DESC;

select billing_city, sum(total) as Anchal from invoice
group by billing_city order by Anchal desc;

-- 5. Write a query that returns the person who has spent the most money.
Select * from customer;

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total from
customer join invoice
on invoice.customer_id = customer.customer_id
group by customer.customer_id order by total desc limit 1;

-- MODERATE QUESTIONS

/* 6. Write query to return the email, first Name, Last Name  & Genre of all
 Rock Music listeners. Return your list ordered alphabetically by email starting 
 with A */


Select Distinct email, first_name, last_name 
from customer 
join invoice on customer.customer_id= invoice.customer_id 
join invoice_line on invoice.invoice_id= invoice_line.invoice_id
where track_id in(
Select track_id from track join genre 
on track.genre_id= genre.genre_id
where genre.name like 'Rock'
) 
	order by email;

/*Let us invite the artists who have written the most rock music in 
our dataset .Write a query that returns the Artist Name and total
track count of the top 10 rock bands.*/

select * from genre;
select * from track;
select * from artist;

select artist.artist_id, count(artist.artist_id) as songs, artist.name 
from genre join track 
on genre.genre_id= track.genre_id 
join album on album.album_id= track.album_id
join artist on artist.artist_id= album.artist_id
where genre.name like 'Rock'
group by artist.artist_id
order by songs desc limit 10;
;

/* Retrun all the track names that have a song lenth longer than the average 
song length. Return the Name and Milliseconds for each track. Order by the song length with the longest
songs listed first. */

Select name, milliseconds 
from track 
where milliseconds >(
    Select AVG(milliseconds) AS avg_track_length 
    from track)
ORDER BY milliseconds desc;
