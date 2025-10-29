/*
SQL FOOTBALL LEAGUE DATABASE (SAMUEL)                   
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE Team_table (
   team_no INTEGER PRIMARY KEY,
   team_name VARCHAR(25),
   stadium VARCHAR(40) UNIQUE,
   capacity INTEGER,
   manager VARCHAR(30),
   city VARCHAR(30)
);

CREATE TABLE Fixture_table (                        
   match_no INTEGER PRIMARY KEY,
   home_team INTEGER,
   away_team INTEGER,
   match_date DATE,
   stadium VARCHAR(40),
   FOREIGN KEY (stadium) REFERENCES Team_table (stadium),
   FOREIGN KEY (home_team) REFERENCES Team_table (team_no),
   FOREIGN KEY (away_team) REFERENCES Team_table (team_no)
);

CREATE TABLE Championship_ranking (                           
   ranking_no INTEGER PRIMARY KEY,
   team_no INTEGER,
   match_played INTEGER,
   win INTEGER,
   draw INTEGER,
   loss INTEGER,
   goal_difference INTEGER,
   form VARCHAR(10),
   points INTEGER,
   FOREIGN KEY (team_no) REFERENCES Team_table (team_no)
);

CREATE TABLE FA_cup_table (                          
   fa_ranking_no INTEGER PRIMARY KEY,
   team_no INTEGER,
   group_no VARCHAR(1),
   fa_match_played INTEGER,
   fa_win INTEGER,
   fa_draw INTEGER,
   fa_loss INTEGER,
   fa_goaldifference INTEGER,
   fa_form VARCHAR(10),
   fa_points INTEGER,
   FOREIGN KEY (team_no) REFERENCES Team_table (team_no)
);


CREATE TABLE Championship_revenue (                                         
   revenue_no INTEGER PRIMARY KEY,
   team_no INTEGER,
   ticket_sales INTEGER,
   sponsorship VARCHAR(30) NULL,
   prize_money INTEGER NULL,
   FOREIGN KEY (team_no) REFERENCES Team_table (team_no)
);

CREATE TABLE Championship_archive (                       
   archive_no INTEGER PRIMARY KEY,
   season VARCHAR(30),
   winner VARCHAR(20)
);

INSERT INTO Team_table VALUES
    (001, 'Sheffield Utd', 'Bramall Lane',32050,'Wilder Chris','Sheffield'),
    (010, 'Leeds','Elland Road',37792, 'Farke Daniel', 'Leeds'),
    (002, 'Burnley', 'Turf Moor',22546, 'Parker Scott','Burnley'),
    (003, 'Sunderland', 'Stadium of Light',48707, 'Le Bris Regis', 'Sunderland'), 
    (004, 'Blackburn', 'Ewood Park',31367, 'Eustace John','Blackburn'),
    (005, 'Middlesbrough', 'Riverside Stadium',34742,'Carrick Michael','Middlesbrough'),
    (008, 'Watford', ' Vicarage Road',22200, 'Cleverley Tom', 'Watford'),
    (007, 'West Brom', 'The Hawthorns',26688, 'Corberan Carlos','West Bromwich'), 
    (006, 'Sheffield Wed', 'Hillsborough',39732, 'Rohl Danny','Sheffield'),
    (009, 'Swansea', 'Swansea Stadium',21088, 'Williams Luke', 'Swansea'),
    (011, 'Arsenal','Emirates Stadium',60704, 'Mikel Arteta', 'London'),
    (012, 'Liverpool','Anfield', 61276, 'Arne Slot', 'Liverpool'),
    (013, 'Chelsea','Stamford Bridge',40341, 'Enzo Maresca', 'London'),
    (014,'Manchester United','Old Trafford', 75635, 'Ruben Amorim', 'Manchester'),
    (015, 'Manchester City','Eithad Stadium',55097,'Pep Guardiola', 'Manchester'),
    (016, 'Tottenham', 'Tottenham Hotspur Stadium', 62850, 'Ange Postecoglou', 'London');

INSERT INTO Fixture_table VALUES 
    (039, 001, 002 ,241121,'Bramall Lane'),
    (067, 010, 003, 241122,'Elland Road'),
    (046, 009,006, 251123,'Swansea Stadium'),
    (088, 008,007, 241121,' Vicarage Road'),
    (065, 005,004, 241121,'Riverside Stadium'),
    (090, 011, 012 ,241130,'Emirates Stadium'),
    (095, 013, 014, 241130,'Stamford Bridge'),
    (091, 015,016, 241201,'Eithad Stadium'),
    (099, 012,004, 241204,'Anfield'),
    (098, 016,008, 241205,'Tottenham Hotspur Stadium');

INSERT Championship_ranking VALUES 
    (1,001,30, 25,4,1,20,'W,W,W,W,W',79),
    (2,010,30, 20,8,2,25,'L,D,D,W,W',68),   
    (3, 003, 29, 18,9 ,2,19,'W,W,W,W,L',63),
    (4,002, 30, 16, 10, 4,18,'W,D,D,W,W',58),
    (5, 008, 29, 12, 8, 9,14,'W,W,W,L,D',44),
    (6, 005, 30, 10, 13, 7,10,'D,L,L,D,W',43),
    (7, 007,30, 8, 12, 10,10,'W,D,D,D,W',36),
    (8,009, 30, 8, 6, 16,8,'D,L,D,L,D',30),
    (9,006, 30, 4,5,21,12,'L,L,W,L,L',17),
    (10,004, 30, 2, 3, 25,6,'D,D,D,W,L',9);

INSERT FA_cup_table VALUES 
    (1,001,'A',4, 4,0,0,12,'W,W,W,W',12),
    (2,012,'B',4, 3,0,1,14,'W,W,W,L',9),   
    (3, 003,'C',4, 2,1 ,1,9,'W,W,D,L',7),
    (4,013,'A',4, 2, 1, 1,7,'W,W,D,L',7),
    (5, 015,'D',4, 2, 1, 1,6,'W,W,D,L',7),
    (6, 014,'A',4, 2, 1, 1,6,'W,W,D,L',7),
    (7, 016,'A',4, 2, 1, 1,4,'W,W,D,L',7),
    (8,011,'B',4, 2, 0,2,4,'W,W,L,L',6),
    (9,004,'C',4, 2,0,2,3,'W,W,L,L',6),
    (10,009,'B',4, 2, 0, 2,2,'W,W,L,L',6),
    (11,005,'B',4, 2, 0, 2,2,'W,W,L,L',6),
    (12,006,'D',4, 1, 2, 1,9,'W,D,D,L',5),
    (13,008,'C',4, 1, 2, 1,4,'W,D,D,L',5),
    (14,007,'D',4, 1, 0,3,3,'W,L,L,L',3),
    (15,010,'D', 4, 1, 0, 3,2,'W,L,L,L',3),
    (16,002,'C',4, 0, 0, 4,2,'L,L,L,L',0);

INSERT INTO Championship_revenue VALUES 
    (00021,001,250000,'Maneki', 112600000),
    (00004,002,360000,'Red Bull',0),                      
    (00019,003,10000000,'Spread Ex Sports',0),
    (00005,004,400000,'Red Bull',450000),
    (00012,005,6400000,'BOXT',0),
    (00022,006,900000,'MOCKBA',105000),
    (00027,007,8000000,'Spread Ex Sports',0),
    (00008,008,24000000,'Stake',104600000),
    (00032,009,22000000,'Red Bull',30200000),
    (00001,010,34000000,'Red Bull',100000000);


INSERT INTO Championship_archive VALUES 
    (024, 'Championship 2023/2024', 'Leicester'),
    (023, 'Championship 2022/2023', 'Burnley'),
    (022, 'Championship 2021/2022', 'Fulham'),
    (021, 'Championship 2020/2021','Norwich'),
    (020, 'Championship 2019/2020', 'Leeds'),
    (019, 'Championship 2018/2019', 'Norwich'),
    (018, 'Championship 2017/2018', 'Wolves'),
    (017, 'Championship 2016/2017', 'Newcastle'),
    (016, 'Championship 2015/2016','Burnley'),
    (015, 'Championship 2014/2015', 'Bournemouth');
                     
/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) A football match on the 1st of December 2024 has been postponed to the 4th. */

UPDATE Fixture_table SET match_date = '241204' WHERE match_date = '241201';

/* 2) The capacity for the West Brom stadium has increased by 10,000 seats. */

UPDATE Team_table SET capacity = capacity + 10000 WHERE team_name = 'West Brom';

/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 1) List the teams, managers and stadiums that have a stadium with a capacity of more than 30,000 people, that are in both Championship and FA Cup and have a sponsorship.*/
select '1)' AS '';

SELECT t1.team_name,t1.manager,t1.stadium
FROM Team_table AS t1
INNER JOIN Championship_ranking AS t2 ON t1.team_no = t2.team_no
INNER JOIN FA_cup_table AS t3 ON t1.team_no = t3.team_no
INNER JOIN Championship_revenue AS t4 ON t1.team_no = t4.team_no
WHERE t1.capacity > 30000;

/* 2)  List all the stadiums, home and away teams scheduled in December 2024.*/
select '2)' AS '';

SELECT t1.stadium,t2.team_name AS home_team,t3.team_name AS away_team
FROM Fixture_table AS t1
INNER JOIN Team_table AS t2 ON t1.home_team = t2.team_no
INNER JOIN Team_table AS t3 ON t1.away_team = t3.team_no
WHERE t1.match_date BETWEEN 241201 AND 241231;

/* 3) List all the Championship teams and their total revenue made this season.*/
select '3)' AS '';

SELECT team_name, SUM(ticket_sales + prize_money) AS total_revenue
FROM Team_table AS t1
INNER JOIN Championship_revenue as t2 ON t1.team_no = t2.team_no
GROUP by t1.team_name;

/* 4) List the Championship team that has more than total 10 points in both the Championship and FA Cup.*/
select '4)' AS '';

SELECT t1.team_name
FROM Team_table AS t1
WHERE EXISTS(
SELECT 1 
FROM Championship_ranking AS t2
WHERE t2.team_no = t1.team_no
AND t2.points > 10)
AND EXISTS(
SELECT 1 
FROM FA_cup_table AS t3
WHERE t3.team_no = t1.team_no
AND t3.fa_points > 10);

/* 5) List the Championship teams that have a sponsorship containing the word "Red Bull" or have won a Championship in the past.*/
select '5)' AS '';

SELECT t1.team_name
FROM Team_table AS t1
INNER JOIN Championship_revenue AS t2 ON t1.team_no = t2.team_no
WHERE t2.sponsorship LIKE '%Red Bull%'
UNION
SELECT t1.team_name
FROM Team_table AS t1
INNER JOIN Championship_archive AS t3 ON t1.team_name = t3.winner;

/* 6) List all teams, and their points in the Championship, that are ranked higher than Watford and order in terms of points.*/
select '6)' AS '';

SELECT t1.team_name, t2.points 
FROM Team_table AS t1
INNER JOIN Championship_ranking AS t2 ON t1.team_no = t2.team_no
WHERE t2.points > (
SELECT points 
FROM Championship_ranking 
WHERE team_no = (SELECT team_no FROM Team_table WHERE team_name = 'Watford'))
ORDER BY t2.points DESC;

/* 7) List the number of teams, the team name and form that are unbeaten in the FA Cup.*/
select '7)' AS '';

SELECT COUNT(t1.team_no) AS Number_of_teams,
GROUP_CONCAT(t2.team_name) AS Team_names,fa_form
FROM FA_cup_table AS t1
INNER JOIN Team_table AS t2 ON t1.team_no = t2.team_no
WHERE t1.fa_form = 'W,W,W,W';

/* 8)  List the team names, managers, cities, wins, draws and losses of all Championship teams in the Championship rankings.*/
select '8)' AS '';

SELECT t1.team_name, t1.manager,t1.city,t2.win,t2.draw,t2.loss
FROM Team_table AS t1 
INNER JOIN Championship_ranking AS t2 ON t1.team_no = t2.team_no;

/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Remove the team(s) that have less than 5 points in the FA Cup ranking. */

DELETE FROM FA_cup_table WHERE fa_points < 5;

/* 2) Remove all the information about a team that is sponsored by Stake. */

DELETE FROM Championship_revenue WHERE sponsorship = 'Stake';

/* SECTION 6 - DROP TABLES */

DROP TABLE Championship_archive;
DROP TABLE Championship_revenue;
DROP TABLE FA_cup_table;
DROP TABLE Championship_ranking;
DROP TABLE Fixture_table;
DROP TABLE Team_table;

SHOW TABLES;