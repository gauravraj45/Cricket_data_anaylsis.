SELECT * FROM first_project.cricket_data1;
use first_project;

-- Q1: Total matches Played

Select count(*) AS total_matches
from cricket_data1;

-- Q2: HOW MANY MATCH PLAYED IN EVERY SEASON

Select season , count(*) as total_matches
from cricket_data1
group by season
order by season asc;

-- (Q3): WHICH IS THE MOST MATCHES WINNING TEAM

select winner, count(*) as wins
from cricket_data1
group by winner 
order by wins desc limit 1;

-- (Q4) Which is the TOP 5 WINNIG TEAM

select winner , count(*) as wins
from cricket_data1
group by winner
order by wins desc limit 5;

-- (Q5) WHICH TEAM WON THE TOSS AND ALSO WIN THE MATCHES

select count(*) as toss_won_match_win
from cricket_data1
where toss_won = winner;

-- (Q6) WINNING THE TOSS AND BATTING VS BOLOWING DECISION ANAYLSIS

select  decision, count(*) as total 
from cricket_data1
group by decision;

-- (Q7) HIGHEST SCORE (1ST INNING)

SELECT MAX(first_inning_score) as highest_score
from cricket_data1;

-- (Q8) LOWEST SCORE (1ST INNING)

select min(first_inning_score) as lowest_score
from cricket_data1;

-- (Q9) HIGHEST RUN CHASE (2ND INNING

select max(second_inning_score) as highest_chase
from cricket_data1;

-- (Q10) WHICH PLAYER WON THE HIGHEST POM

select pom , count(*) as highest_award
from cricket_data1
group by pom
order by highest_award desc
limit 1;

-- Q11) TOP 5 LAYER OF THE MATCH

select pom, count(*) award
from cricket_data1
group by pom
order by award desc limit 5;

-- (Q12) HOME TEAM VS AWAY TEAM PERFORMANCE

select home_team, count(*) as home_matches
from cricket_data1
group by home_team;

select away_team, count(*) as away_team
from cricket_data1
group by away_team;

-- (13) WHICH VENUE  HOST HE MOST MATCHES

select venue_name, count(*) as matches
from cricket_data1
group by venue_name
order by matches desc
limit 5;

 -- (Q14) WHICH TEAM WON THE MATCHES BY CHASING
 select  count(*) chasing_wins
 from cricket_data1
 where  first_inning_score > second_inning_score;

 
 -- (Q15) HOW MANY  TOTAL MATCHES WIN IN EVERY SEASON
 select season , winner ,count(*) as total_match_win
 from cricket_data1
 group by season, winner
 order by season, total_match_win desc;
 
 -- (Q16) WHICH TEAM WON THE HIGHEST TOSS
 
 select toss_won, count(*) as highest_wins
 from cricket_data1
 group by toss_won
 order by highest_wins desc limit 1;
 
 -- (Q17) CALCULATED AVERAGE SCORE PER MATCH
 
 select avg(first_inning_score) as avg_first,
        avg(second_inning_score) as avg_second
        from cricket_data1;
        
-- (Q19) WHICH ONE MATCHES IS CLOSE AND (DIFFRENCE IS > 10 RUNS)

select * from cricket_data1
where abs(first_inning_score-second_inning_score) < 10;

-- (Q20) CACULATE TEAM-WISE WIN PERCENTAGE

select winner, count(*)*100.0/(select count(*)from cricket_data1) as win_percentage 
             from cricket_data1
             group by winner
             order by win_percentage desc;





