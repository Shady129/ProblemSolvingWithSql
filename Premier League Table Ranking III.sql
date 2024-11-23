
--Task: Calculate the points, goal, difference, and rank each team in each season.

--   The rank should be determined as follow:
--1. Teams are first ranked by their total ponts.
--2. If points are tied, teams are then ranked by their goal difference(Highest To Lowest)
--3. if goal difference is also tied, teams are then ranked alphabetically by team name.


CREATE TABLE SeasonStats (
    season_id INT,
    team_id INT,
    team_name VARCHAR(255),
    matches_played INT,
    wins INT,
    draws INT,
    losses INT,
    goals_for INT,
    goals_against INT
);


insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2021', '1', 'Manchester City', '38', '29', '6', '3', '99', '26')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2021', '2', 'Liverpool', '38', '28', '8', '2', '94', '26')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2021', '3', 'Chelsea', '38', '21', '11', '6', '76', '33')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2021', '4', 'Tottenham', '38', '22', '5', '11', '69', '40')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2021', '5', 'Arsenal', '38', '22', '3', '13', '61', '48')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2022', '1', 'Manchester City', '38', '28', '5', '5', '94', '33')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2022', '2', 'Arsenal', '38', '26', '6', '6', '88', '43')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2022', '3', 'Manchester United', '38', '23', '6', '9', '58', '43')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2022', '4', 'Newcastle', '38', '19', '14', '5', '68', '33')
insert into SeasonStats (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against) values ('2022', '5', 'Liverpool', '38', '19', '10', '9', '75', '47')


SELECT * FROM SeasonStats;

WITH Premier_league AS(
SELECT season_id, team_id, team_name, (wins * 3 + draws * 1 + losses * 0 ) AS points, (goals_for - goals_against)AS goal_difference
FROM SeasonStats)
SELECT DISTINCT *, 
Row_number()OVER(PARTITION BY season_id ORDER BY points DESC, goal_difference DESC) AS position
FROM Premier_league
ORDER BY season_id;











