Assignment 13 - Xiaojie Min
#i
SELECT DISTINCT(name)
FROM language
ORDER BY name ASC;

#ii
SELECT concat(first_name, ' ', last_name) 
AS Name
FROM actor
WHERE last_name LIKE '%BER%'
ORDER BY first_name ASC;

#iii
SELECT count(*)
FROM actor
HAVING count(DISTINCT(last_name))=1;

#iv
SELECT count(*)
FROM film 
WHERE description LIKE '%Crocodile%'
OR description LIKE '%Shark%';

#v
SELECT concat(first_name, ' ', last_name) AS Name,
release_year
FROM film a JOIN actor b JOIN film_actor c
ON a.film_id=c.film_id
AND b.actor_id=c.actor_id
WHERE description LIKE '%Crocodile%'
OR description LIKE '%Shark%'
ORDER BY last_name ASC;

#vi
SELECT count(*), name
FROM film_category a JOIN category b
ON a.category_id=b.category_id
GROUP BY b.category_id
HAVING 40<=count(*)<=60
ORDER BY count(*) DESC;

#vii
SELECT concat(first_name, ' ', last_name) AS Name
FROM actor
WHERE first_name=(SELECT first_name
FROM actor
WHERE actor_id=24);

#viii
SELECT concat(first_name, ' ', last_name) AS Name,
count(a.actor_id)
FROM film_actor a JOIN actor b
ON a.actor_id=b.actor_id
GROUP BY a.actor_id
ORDER BY count(a.actor_id) DESC
LIMIT 1;

#ix
SELECT name, AVG(length)
FROM film a JOIN category b JOIN film_category c
ON a.film_id=c.film_id
AND b.category_id=c.category_id
GROUP BY name
HAVING AVG(length)>(SELECT AVG(length)
FROM film);

#x
SELECT total_sales
FROM sales_by_store;
