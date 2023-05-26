USE sakila;
##Write a query to display for each store its store ID, city, and country.
SELECT s.store_id , c.city, co.country 
FROM store s
JOIN address a
ON s.address_id = a.address_id
JOIN city c
ON a.city_id = c.city_id
JOIN country co 
ON c.country_id= co.country_id;


##Write a query to display how much business, in dollars, each store brought in.

SELECT s.store_id , SUM(p.amount) AS business_store
FROM store s
JOIN inventory i
ON s.store_id = i.store_id
JOIN rental r
ON i.inventory_id = r.inventory_id
JOIN payment p
ON r.rental_id = p.rental_id
GROUP BY s.store_id 
ORDER BY s.store_id;

SELECT * FROM payment;


##What is the average running time of films by category?
SELECT * FROM category;
SELECT * FROM film;

SELECT c.name , AVG(f.length) AS running_category
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON fc.film_id = f.film_id
GROUP BY c.name 
ORDER BY c.name;
##Which film categories are longest?
 ##SPORTS , GAMES , FOREIGN , DRAMA , COMEDY

##Display the most frequently rented movies in descending order.

SELECT f.title ,SUM(r.rental_id) AS rented_movies 
FROM rental r
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film f
ON i.film_id = f.film_id
GROUP BY i.inventory_id , f.title
ORDER BY i.inventory_id DESC ;

SELECT * FROM payment;

##List the top five genres in gross revenue in descending order.

SELECT c.name, sum(p.amount) AS TOP_FIVE
FROM payment p
JOIN rental r
ON p.rental_id = r.rental_id
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film f
ON i.film_id = f.film_id 
JOIN film_category fc 
ON f.film_id = fc.film_id
JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY TOP_FIVE DESC ;

##Is "Academy Dinosaur" available for rent from Store 1?
SELECT * FROM store;
SELECT * FROM inventory;
SELECT f.title ,s.store_id , i.inventory_id
FROM store s
JOIN inventory i
ON s.store_id = i.store_id
JOIN film f
ON i.film_id = f.film_id;

## si
