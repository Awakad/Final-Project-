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

