SELECT DISTINCT d.company_name, r.film_budget
FROM distributors AS d
CROSS JOIN revenue AS r
ORDER BY film_budget DESC
LIMIT 5