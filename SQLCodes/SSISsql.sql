--populatin DimActor
select actor_id, first_name, last_name
from actor

--populating DimFilm
SELECT film.film_id, film.title, film.description, 
film.release_year, language.name as language, 
category.name as category, film.rental_duration, film.rental_rate, film.rating,
film.replacement_cost, film.length, film.special_features
FROM  language 
join film on film.language_id = language.language_id
join film_category on film_category.film_id = film.film_id 
join category on film_category.category_id = category.category_id

--populating DimCustomer
select customer.customer_id, customer.first_name, customer.last_name, 
customer.email, customer.active, 
address.address, city.city, country.country
from customer 
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id 
join country on city.country_id = country.country_id

--populating DimStore
select store.store_id,
address.address, address.district, city.city, country.country
from store 
join address on store.address_id = address.address_id
join city on address.city_id = city.city_id 
join country on city.country_id = country.country_id

--populating DimStaff
select staff.staff_id, staff.first_name, staff.last_name, 
staff.email, staff.active, 
address.address, city.city, country.country
from staff 
join address on staff.address_id = address.address_id
join city on address.city_id = city.city_id 
join country on city.country_id = country.country_id


--populating FactRental
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
LEFT JOIN inventory ON rental.inventory_id = inventory.inventory_id
LEFT JOIN film ON inventory.film_id = film.film_id
LEFT JOIN payment ON rental.rental_id = payment.rental_id
LEFT JOIN customer ON rental.customer_id = customer.customer_id
LEFT JOIN staff ON rental.staff_id = staff.staff_id
LEFT JOIN store ON inventory.store_id = store.store_id ) as test





