
** Movie Database project. See the file movies_erd for table\column info. **

1. Give the name, release year, and worldwide gross of the lowest grossing movie?
SELECT s.film_title, s.release_year, r.worldwide_gross
FROM specs AS s
LEFT JOIN revenue AS r
ON s.movie_id = r.movie_id
ORDER BY r.worldwide_gross;

-Semi-Tough 
-1977
-$37,187,139

2. What year has the highest average imdb rating?
SELECT s.release_year, r.imdb_rating
FROM specs AS s
LEFT JOIN rating AS r
ON s.movie_id = r.movie_id
ORDER BY r.imdb_rating DESC

 -2008, 9

3. What is the highest grossing G-rated movie? Which company distributed it?
SELECT s.film_title, r.worldwide_gross, d.company_name
FROM specs AS s
INNER JOIN revenue AS r
ON s.movie_id = r.movie_id
LEFT JOIN distributors AS d
ON d.distributor_id = s.domestic_distributor_id
WHERE s.mpaa_rating = 'G'
ORDER BY r.worldwide_gross DESC;

- Toy Story 4
-$1,073,394,593
-Walt Disney

4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

SELECT COUNT(DISTINCT s.film_title), d.company_name
FROM specs AS s
FULL OUTER JOIN distributors AS d
ON s.domestic_distributor_id = d.distributor_id
GROUP BY d.company_name

5. Write a query that returns the five distributors with the highest average movie budget.

SELECT d.company_name, r.film_budget
FROM distributors AS d
CROSS JOIN revenue AS r
ORDER BY r.film_budget DESC
LIMIt 5;

-Fox Searchlight
-Summit Entertainment
-The H Collective
-Icon
-Miramax

6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
SELECT d.headquarters, s.film_title, r.imdb_rating
FROM specs AS s
LEFT JOIN rating AS r
ON s.movie_id = r.movie_id
LEFT JOIN distributors AS d
ON s.domestic_distributor_id = d.distributor_id
WHERE d.headquarters  NOT LIKE '%CA'
GROUP BY d.headquarters, s.film_title, r.imdb_rating
ORDER BY r.imdb_rating DESC;

-2
-Dirty Dancing 




7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
SELECT s.length_in_min, s.film_title, r.imdb_rating
FROM specs AS s
LEFT JOIN rating AS r
ON s.movie_id = r.movie_id
WHERE s.length_in_min > 120 
OR s.length_in_min < 120
GROUP BY s.length_in_min, s.film_title, r.imdb_rating
ORDER BY r.imdb_rating DESC
