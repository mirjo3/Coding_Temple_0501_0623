-- 1. Customers from Texas
SELECT CONCAT(customer.first_name, ' ', customer.last_name) as full_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--2. All Payments above 6.99
SELECT CONCAT(customer.first_name, ' ', customer.last_name) as full_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customer names that made payments over $175
SELECT CONCAT(cu.first_name, ' ', cu.last_name) AS full_name, SUM(p.amount) AS total_payment
FROM customer AS cu
JOIN payment AS p
ON cu.customer_id = p.customer_id
GROUP BY cu.customer_id, full_name
HAVING SUM(p.amount) > 175
ORDER BY total_payment DESC;

-- 4. List all customers that live in Nepal (use the city table)
-- customer:address_id, address:address_id, address:city_id, city_id:country_id,
-- country_id
-- Display 'full_name' & country'

-- 5. Which staff member had the most transactions?
-- We will be using COUNT(payments.amount)
-- payments:staff_id from staff:staff_id
SELECT CONCAT(st.first_name, ' ', st.last_name) AS full_name, COUNT(pay.amount) AS total_transactions
FROM staff AS st
JOIN payment AS pay ON st.staff_id = pay.staff_id
GROUP BY st.staff_id, st.first_name, st.last_name
HAVING SUM(pay.amount) > 0;

SELECT CONCAT(c.first_name, ' ', c.last_name) AS full_name, co.country
FROM customer AS c
JOIN address AS a ON c.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id
WHERE co.country = 'Nepal'
GROUP BY full_name, co.country;

-- 6. What film had the most actors in it?
-- We will be using using film_id to identify actors
-- film_actor:actor_id, film_actor:film_id, film:film_id
-- Use COUNT(film_id)

SELECT title, COUNT(film_actor.actor_id)
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY COUNT(film_actor.actor_id) DESC
LIMIT 1;

-- 7. Show all customers who have made a single payment above $6.99 (use subqueries)

SELECT CONCAT(cu.first_name, ' ', cu.last_name) as full_name
FROM customer AS cu
WHERE cu.customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

-- 8. Which category is most prevalent in the films?
-- Need to compare the COUNT(category_id) and match that to 
-- need LIMIT 1 of category's name, then link category_id from film_category and category

SELECT cat.name, COUNT(fc.category_id) AS category_count
FROM category AS cat
JOIN film_category AS fc ON cat.category_id = fc.category_id
GROUP BY cat.name
ORDER BY category_count DESC
LIMIT 1;

-- 8. Which category is most prevalent in the films?
-- Need to compare the COUNT(category_id) and match that to 
-- need LIMIT 1 of category's name, then link category_id from film_category and category

SELECT cat.name, COUNT(fc.category_id) AS category_count
FROM category AS cat
JOIN film_category AS fc ON cat.category_id = fc.category_id
GROUP BY cat.name
ORDER BY category_count DESC
LIMIT 1;
