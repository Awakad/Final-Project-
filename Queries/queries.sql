SELECT * FROM cast_info;
SELECT * FROM cast_social_media;
SELECT * FROM movie_info;
SELECT * FROM movie_social_media;
SELECT * FROM rating;

--All America action movies made between 2009 and 2016 
SELECT * 
INTO american_action
FROM movie_info
WHERE genres LIKE '%Action%'AND country='USA' AND title_year BETWEEN '2007' AND '2016'
ORDER BY title_year DESC;

SELECT * FROM american_action;

--IMDB Score for American action movies made between 2009 and 2016
SELECT 
aa.movie_id,
aa.cast_set_num,
aa.movie_title,
aa.director_name,
aa.genres,
aa.country,
aa.title_year,
r.imdb_score,
r.movie_imdb_link
INTO imdb_american_action
FROM american_action as aa
LEFT JOIN rating as r
ON r.movie_id = aa.movie_id
ORDER BY imdb_score DESC;

-- Facebook likes of directors of the top 10 IMDB American action movies 
SELECT DISTINCT iaa.director_name,
csm.director_facebook_likes
INTO top_american_action_directors
FROM imdb_american_action as iaa
LEFT JOIN cast_social_media as csm
ON iaa.director_name = csm.director_name
ORDER BY director_facebook_likes DESC
LIMIT 10;


--American Action Movies Box Offcie
SELECT bo.movie_id,
aa.movie_title,
aa.director_name,
aa.content_rating,
aa.title_year,
bo.budget,
bo.gross,
iaa.imdb_score
INTO american_action_boxoffice
FROM american_action as aa
LEFT JOIN boxoffice as bo
ON bo.movie_id = aa.movie_id
INNER JOIN imdb_american_action as iaa
ON aa.movie_id = iaa.movie_id;

-- Top 20 highest Gross Movies
SELECT b.movie_id,
b.budget,
b.gross,
mi.movie_title,
mi.duration,
mi.director_name,
mi.genres,
mi.country,
mi.content_rating,
mi.title_year,
mi.cast_set_num,
ci.actor_1_name
INTO top_20_highest_growth
FROM boxoffice as b
LEFT JOIN movie_info as mi
ON b.movie_id = mi.movie_id
INNER JOIN cast_info as ci
ON ci.cast_set_num = mi.cast_set_num
WHERE gross IS NOT NULL
ORDER BY gross DESC
LIMIT 20;

