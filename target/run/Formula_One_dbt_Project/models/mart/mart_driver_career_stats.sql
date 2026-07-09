
  
    

  create  table "formula_one"."dev"."mart_driver_career_stats__dbt_tmp"
  
  
    as
  
  (
    with driver_seasons as (
    select * from "formula_one"."dev"."int_driver_season_performance"
),

driver_races as (
    select * from "formula_one"."dev"."int_results_enriched"
),

drivers as (
    select * from "formula_one"."dev"."stg_drivers"
),

driver_key_metrics as (
select
    drivers.driver_id,
    drivers.driver_name,
    drivers.driver_surname,
    drivers.driver_date_of_birth,
    floor((min(race_date) - drivers.driver_date_of_birth)/365.0) as first_race_age,
    floor((max(race_date) - drivers.driver_date_of_birth)/365.0) as last_race_age,
    round((max(race_date) - min(race_date))/365.0,1) as career_duration_years,
    min(race_date) as first_race_date,
    max(race_date) as last_race_date,
    count(race_date) as race_starts,
    min(case when finishing_position = 1 then race_date end) as first_win_date,
    max(case when finishing_position = 1 then race_date end) as last_win_date,
    sum(case when finishing_position = 1 then 1 else 0 end) as career_wins,
    min(case when finishing_position <= 3 then race_date end) as first_podium_date,
    max(case when finishing_position <= 3 then race_date end) as last_podium_date,
    sum(case when finishing_position <= 3 then 1 else 0 end) as career_podiums
from drivers
    inner join driver_races on drivers.driver_id = driver_races.driver_id
group by
    drivers.driver_id, drivers.driver_name, drivers.driver_surname, drivers.driver_date_of_birth
),

driver_championships as (
select
    driver_id,
    min(case when season_position = 1 then season end) as first_championship_win_season,
    max(case when season_position = 1 then season end) as last_championship_win_season,
    sum(case when season_position = 1 then 1 else 0 end) as career_championships_won
from driver_seasons
group by
    driver_id
)

select * 
from driver_key_metrics inner join driver_championships using(driver_id)
order by last_race_date desc, career_wins desc, career_podiums desc

/*-- first race
    min(race_date) as first_race_date
-- last race
    max(race_date) as last_race_date
-- career
    last_race_date - first_race_date as career_duration
-- starting age 
    min(race_date) - driver_date_of_birth as starting_age
-- current age
    current_date - driver_date_of_birth as current_age
-- first win 
    min(case when driver_position = 1 then race_date end) as first_win_date
-- last win 
    max(case when driver_position = 1 then race_date end) as last_win_date
-- career wins
    sum(case when driver_position = 1 then 1 else 0 end) as career_wins
-- first podium
    min(case when driver_position <= 3 then race_date end) as first_podium_date
-- last podium
    max(case when driver_position <= 3 then race_date end) as last_podium_date
-- career podiums
    sum(case when driver_position <= 3 then 1 else 0 end) as career_podiums

*/

/*
-- first championship win
    min(case when season_position = 1 then season end) as first_championship_win_date
-- last championship win
    max(case when season_position = 1 then season end) as last_championship_win_date
-- career championships won
    sum(case when season_position = 1 then 1 else 0 end) as career_championships_won
*/
  );
  