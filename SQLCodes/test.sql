
order by rental_id asc

select count(rental_id), count (distinct rental_id) from factrental
delete from FactRental

where return_date is null

SELECT constraint_name
FROM information_schema.table_constraints
WHERE table_name = 'DimDate'
  AND constraint_type = 'PRIMARY KEY';

select rental_date from FactRental join dimdate on Date = payment_date

ALTER TABLE FactRental
ADD rentalDate DATETIME;

UPDATE FactRental
SET payment_date = DATEADD(DAY, DATEDIFF(DAY, 0, rental_date), 0);

UPDATE FactRental
SET return_date = DATEADD(DAY, DATEDIFF(DAY, 0, rental_date), 0);

UPDATE FactRental
SET rental_date = DATEADD(DAY, DATEDIFF(DAY, 0, rental_date), 0);


select count (rental_id) from (
SELECT 
    rental.rental_id, 
    rental.rental_date, 
    rental.return_date, 
    inventory.inventory_id,
    customer.customer_id, 
    staff.staff_id, 
    payment.amount, 
    payment.payment_date, 
    film.film_id,
    store.store_id
FROM 
    rental 
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
INNER JOIN customer ON rental.customer_id = customer.customer_id
Inner JOIN staff ON rental.staff_id = staff.staff_id
inner JOIN store ON inventory.store_id = store.store_id ) as test

delete from FactRental

select * from FactRental


UPDATE payment
SET payment_date = DATEADD(DAY, DATEDIFF(DAY, 0, payment_date), 0);


UPDATE rental
SET return_date = DATEADD(DAY, DATEDIFF(DAY, 0, return_date), 0);

UPDATE rental
SET rental_date = DATEADD(DAY, DATEDIFF(DAY, 0, rental_date), 0);

--Checking for invalid data
SELECT * FROM rental
WHERE YEAR(rental_date) = 2006

SELECT district FROM address

--Deleting wrong data
DELETE FROM rental WHERE return_date IS NULL AND YEAR(rental_date) = 2006

--Dropping empty columns
ALTER TABLE address
DROP COLUMN district

--Dropping unneeded columns
ALTER TABLE customer
DROP COLUMN last_update

ALTER TABLE film
DROP COLUMN last_update

ALTER TABLE inventory
DROP COLUMN last_update

