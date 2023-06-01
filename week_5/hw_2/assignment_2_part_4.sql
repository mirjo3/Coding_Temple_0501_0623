-- 8. Which category is most prevalent in the films?
-- Need to compare the COUNT(category_id) and match that to 
-- need LIMIT 1 of category's name, then link category_id from film_category and category

SELECT cat.name, COUNT(fc.category_id) AS category_count
FROM category AS cat
JOIN film_category AS fc ON cat.category_id = fc.category_id
GROUP BY cat.name
ORDER BY category_count DESC
LIMIT 1;

