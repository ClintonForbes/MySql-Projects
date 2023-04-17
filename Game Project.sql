use games;

drop table if exists games;
create table if not exists games (
			GameID int not null auto_increment,
            Title varchar(100) null,
            ReleaseDate date null,
            Team varchar(100) null,
            primary key (GameID)
            );
            
            
 drop table if exists reviews;           
create table if not exists reviews (
			ReviewID int not null auto_increment,
            Rating decimal(2,1) null,
            TimesListed int null,
            NumReviews int null,
            Genres varchar(100) null,
            Plays int null,
            Playing int null,
            Backlogs int null,
            Wishlist int null,
            Foreign key (ReviewID) references games(GameID)
            );
			
alter table reviews drop foreign key reviews_ibfk_1;

select * from games;
select * from reviews;

-- Which game has the highest number of plays?

SELECT 
    Title, Plays
FROM
    games
        JOIN
    reviews ON games.GameID = reviews.ReviewID
ORDER BY Plays DESC
LIMIT 1;


-- What is the average of the top 10 teams?

SELECT 
    Team, AVG(Rating) AS AvgRating
FROM
    games
        JOIN
    reviews ON games.GameID = reviews.ReviewID
GROUP BY Team
ORDER BY AvgRating Desc 
LIMIT 10;


-- What are the most popular game genres of all time based on user plays?

SELECT 
    title, genres, plays
FROM
    games
        JOIN
    reviews ON games.GameID = Reviews.ReviewID
WHERE
    ReleaseDate >= '2015-01-01'
        AND ReleaseDate <= '2022-01-01'
ORDER BY plays DESC
LIMIT 5;


-- Which genre is the most popular based on the max ratings?

SELECT 
    Genres, MAX(Rating) AS maxRating
FROM
    Games
        JOIN
    Reviews ON Games.GameID = Reviews.ReviewID
GROUP BY Genres
ORDER BY maxRating DESC
LIMIT 5;


-- What Title and Genre have the highest Backlogs in decending order?

SELECT 
    GameID, Title, Genres, Backlogs
FROM
    games
        JOIN
    Reviews ON Games.GameID = Reviews.ReviewID
WHERE
    ReviewID IN (SELECT 
            ReviewID
        FROM
            Reviews
        WHERE
            Backlogs > 5500)
ORDER BY Backlogs DESC;
