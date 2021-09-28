# Film Industry Boxoffice
- Analyzing the key factors in film production that determine box office performance for the final project of the UofT Data Analytics Bootcamp 2021
## The Team 
- Callistus Ikeata
- Rojin Shahba

## Project Overview

Project topic is Predicting Movie Revenues

The goal of this project is to implement a machine learning model to determine key factors in the film production industry and forecast the gross income of future productions based on the production team's portfolio, such as the director and cast, social media popularity of the cast, duration of the production and other important elements in film creation. We proceeded by cleaning the [IMDB 5000 Movie Dataset](https://www.kaggle.com/carolzhangdc/imdb-5000-movie-dataset) that contains movies from 1916 to 2016 and using  to analyse datasets.

## Reason For The Project Topic

In a world, where movies made an estimated of over $41.7 billion in 2018 , the film industry is more popular than ever. But what movies make the most money and what are the factor responsible for this?

What we hope to provide insights on:
> - How much does the director's portfolio play a difference?
> - Do projects with higher budgets promise higher revenues?
> - Are certain genres more profitable?
> - Does the popularity of the cast on social media impact the popularity of the film?

## Data Source: 
- [Box Office Prediction](https://www.kaggle.com/c/tmdb-box-office-prediction/data?select=sample_submission.csv)
- [IMDB database](https://www.kaggle.com/carolzhangdc/imdb-5000-movie-dataset)

## Database

### Schema
Postgres SQL was used to store and classify the Movie’s data in [PH-Movies](https://github.com/Awakad/Final-Project-Sirt/blob/main/Queries/PH-Movies-Backup.sql). A total of six datasets were uploaded:
```
- movie_info.csv
- rating.csv
- movie-social_media.csv
- boxoffice.csv
- cast_info.csv
- cast_social_media.csv
```
- QuickDB Schema
<img src="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/movie_data_schema.png" width="500" height="400">


### JOINs
Using various JOIN clauses we created a snapshot of the Top 20 Highest Gross Movies. 
`top_20_highest_growth` combines the movie information from `movie_info` by utilizing a LEFT JOIN and adds the casting information from `cast_info` by utilizing the INNER JOIN command.

```sql
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
```
### Amazon RDS
Lastly, the Amazon RDS was used to link the internal Postgres SQL on the cloud and allow for the scaling of the database to provide access to all team members for future updates and modifications. 

## Dashboard

### Top 20 Highest Gross Movies

| <a href="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20%20Budget%20vs%20Gross.png" target="_blank">**Budget vs Gross**</a> | <a href="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20Directors.png" target="_blank">**Directors**</a> |
| :---: |:---:|
| [<img src="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20%20Budget%20vs%20Gross.png" width="700" height="300">](https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20%20Budget%20vs%20Gross.png)    | [<img src="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20Directors.png" width="700" height="300">](https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20Directors.png) 

| <a href="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross-%20Actor:Actress.png" target="_blank">**Actor-Actress**</a> | <a href="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20%20Genres.png" target="_blank">**Genres**</a> |
| :---: |:---:|
| [<img src="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross-%20Actor:Actress.png" width="600" height="500">](https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross-%20Actor:Actress.png)     | [<img src="https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20%20Genres.png" width="600" height="350">](https://github.com/Awakad/Final-Project-Sirt/blob/main/images/Top20Gross%20-%20%20Genres.png) 


## Machine Learning Model

The dataset is available in a csv file. A Random Forest and Deep Neural Network model was developed for predicting the film's revenue using the [IMDB 5000 Movie Dataset](https://www.kaggle.com/carolzhangdc/imdb-5000-movie-dataset)

To train the model we analyzed, cleaned, and extracted the features from the data. Furthermore we analyzed the model's accuracy by plotting the result, and taking into account our errors.

The following libraries were used in the machine learningm model:
- Python
- Scikit-learn

## Communication Protocols and Roles

Rojin - handled the ERD and database mockup for the dataset. In addition, Rojin helped with the organisation and co-ordination of the group.
 

Callistus - handled data cleaning and machine learning portion, we will run a Random Forest Neural Network model. The dataset will first be preprocessed to be used in our models.

The role of each team member in our group will change every week to ensure everyone can experience different aspects of the project and provide their valuable input. We created a slack channel  dedicated for all project related communications, resources, updates, and Q&A. A weekly touchpoint has been scheduled in addition to the regular class sessions to ensure all team members are confident in the final deliverables and feel supported throughout the project.
