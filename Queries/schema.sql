-- Creating tables for PH-Movies
CREATE TABLE movie_info (
	movie_id VARCHAR(5) NOT NULL,
	cast_set_num VARCHAR(6) NOT NULL,
	movie_title VARCHAR NOT NULL,
	duration FLOAT,
	director_name VARCHAR,
	color VARCHAR,
	genres VARCHAR NOT NULL,
	plot_keywords VARCHAR,
	movie_language VARCHAR,
	country VARCHAR,
	content_rating VARCHAR,
	budget FLOAT,
	title_year VARCHAR,
	aspect_ratio FLOAT,
	PRIMARY KEY (movie_id),
	UNIQUE (cast_set_num)
);


CREATE TABLE rating(
	movie_id VARCHAR(5) NOT NULL,
	movie_title VARCHAR NOT NULL,
	director_name VARCHAR,
	num_voted_users INT,
	num_critic_for_reviews INT,
	imdb_score FLOAT NOT NULL,
	movie_imdb_link VARCHAR NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie_info(movie_id)
);

CREATE TABLE movie_social_media(
	movie_id VARCHAR(5) NOT NULL,
	movie_facebook_likes INT,
	FOREIGN KEY(movie_id) REFERENCES movie_info(movie_id),
	PRIMARY KEY(movie_id)
);

CREATE TABLE cast_info(
	cast_set_num VARCHAR(6) NOT NULL,
	movie_title VARCHAR NOT NULL,
	actor_1_name VARCHAR,
	actor_2_name VARCHAR,
	actor_3_name VARCHAR,
	facenumber_in_poster INT,
	FOREIGN KEY(cast_set_num) REFERENCES movie_info(cast_set_num),
	PRIMARY KEY(cast_set_num)
);


CREATE TABLE cast_social_media(
	cast_set_num VARCHAR(6) NOT NULL,
	director_name VARCHAR,
	director_facebook_likes INT,
	actor_1_name VARCHAR,
	actor_1_facebook_likes INT,
	actor_2_name VARCHAR,
	actor_2_facebook_likes INT,
	actor_3_name VARCHAR,	
	actor_3_facebook_likes INT,
	cast_total_faceboook_likes INT,
	FOREIGN KEY(cast_set_num) REFERENCES movie_info(cast_set_num),
	PRIMARY KEY(cast_set_num)
);

